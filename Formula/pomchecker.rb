# Generated with JReleaser 1.3.0 at 2022-10-31T18:55:09.184736Z
class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.4.0/pomchecker-1.4.0.zip"
  version "1.4.0"
  sha256 "f13d4d69ca1d337f2ff5357d8440c19e332d389a8f5a182424689b5a484eaac0"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.4.0", output
  end
end
