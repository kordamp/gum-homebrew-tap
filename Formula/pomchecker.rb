# Generated with JReleaser 1.13.1 at 2024-08-30T09:56:42.066699341Z

class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.12.0/pomchecker-1.12.0.zip"
  version "1.12.0"
  sha256 "d9c2fb161265164b402bb6bd88e87dcbd8cf7c4a76b61a95b9a431994b193922"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.12.0", output
  end
end
