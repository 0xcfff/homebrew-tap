class Hostsctl < Formula
  desc "Small tool to manage aliases in /etc/hosts file"
  homepage "https://github.com/0xcfff/hostsctl"
  url "https://github.com/0xcfff/hostsctl/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "c6c6306f70b1b4a780d8b61186b59b48ce5621e6f7639ab6902e5365a3f93d55"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.VERSION=#{version}
    ].join(" ")

    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/hostsctl"
  end

  test do
    system "#{bin}/hostsctl", "version"
  end
end
