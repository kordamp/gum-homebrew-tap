# Generated with JReleaser 1.2.0 at 2022-09-17T18:24:23.517202+02:00
class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.3.0/pomchecker-1.3.0.zip"
  version "1.3.0"
  sha256 "9be808661c8c2a54bd2875e9d4d870d30c7e9a94dd3daccd0aadb4ca14912ae0"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.3.0", output
  end
end
