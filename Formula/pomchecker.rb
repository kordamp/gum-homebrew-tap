# Generated with JReleaser 1.4.0 at 2023-02-17T16:23:35.700261522Z
class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.8.0/pomchecker-1.8.0.zip"
  version "1.8.0"
  sha256 "c7107e436254460d98a7a3a934d99a2ce2d8cdfcb642aabc2ae7a928e8b49d7a"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.8.0", output
  end
end
