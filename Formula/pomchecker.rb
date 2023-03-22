# Generated with JReleaser 1.5.1 at 2023-03-22T09:21:24.876536159Z
class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.9.0/pomchecker-1.9.0.zip"
  version "1.9.0"
  sha256 "54af037a2590239c40eab0967dbf2d3785710fc62929042b695432e7fb936a6f"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.9.0", output
  end
end
