class Masuk < Formula
  desc "SSH host and port manager - save connection details with memorable names"
  homepage "https://github.com/herpiko/masuk"
  url "https://github.com/herpiko/masuk/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_SHA256_CHECKSUM"
  license "MIT"
  head "https://github.com/herpiko/masuk.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    # Test help command works
    assert_match "SSH host and port manager", shell_output("#{bin}/masuk --help")

    # Test adding a profile
    system bin/"masuk", "add", "testserver", "-h", "example.com", "-p", "2222"

    # Test listing profiles
    output = shell_output("#{bin}/masuk ls")
    assert_match "testserver", output

    # Test removing profile
    system bin/"masuk", "rm", "testserver"

    # Verify removed
    output = shell_output("#{bin}/masuk ls")
    refute_match "testserver", output
  end
end
