# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hostsctl < Formula
  desc "A small tool to manage aliases in /etc/hosts file"
  homepage "https://github.com/0xcfff/hostsctl"
  url "https://github.com/0xcfff/hostsctl/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "c6c6306f70b1b4a780d8b61186b59b48ce5621e6f7639ab6902e5365a3f93d55"
  license "Apache-2.0"
  version "0.0.1"

  depends_on "go" => :build

  def install
  
    ldflags = %W[
      -s -w
      -X main.VERSION=#{version}
    ].join(" ")

    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/hostsctl"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test hostsctl`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/hostsctl", "database", "print"
  end
end
