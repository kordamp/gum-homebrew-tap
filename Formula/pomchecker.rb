# Generated with JReleaser 1.9.0 at 2023-11-30T13:47:55.227517669Z
class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.10.0/pomchecker-1.10.0.zip"
  version "1.10.0"
  sha256 "966635d0ec63b68f074a8e11710ba0ea25431e030b760c7f609dbce56bb2c27f"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.10.0", output
  end
end
