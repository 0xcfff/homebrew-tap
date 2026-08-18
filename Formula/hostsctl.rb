class Hostsctl < Formula
  desc "Small tool to manage aliases in /etc/hosts file"
  homepage "https://github.com/0xcfff/hostsctl"
  url "https://github.com/0xcfff/hostsctl/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "36112328ea05876193d11c94da47b0ae6c4a5e7515b7408d6c4e55aa469ab4a5"
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
