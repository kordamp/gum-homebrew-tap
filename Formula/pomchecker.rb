# Generated with JReleaser 1.14.0 at 2024-10-23T08:23:11.700541327Z

class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.14.0/pomchecker-1.14.0.zip"
  version "1.14.0"
  sha256 "8583cc71ab0ea2ade85791a2926204355f4c4304b81d092344f8b4dcace3bcd1"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.14.0", output
  end
end
