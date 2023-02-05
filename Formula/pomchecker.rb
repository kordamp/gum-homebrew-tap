# Generated with JReleaser 1.4.0 at 2023-02-05T14:22:58.241429085Z
class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.7.0/pomchecker-1.7.0.zip"
  version "1.7.0"
  sha256 "34cc10c14b86ef01b186498247e5b82ee21fefdc9557deb5ff55e2a04a161599"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.7.0", output
  end
end
