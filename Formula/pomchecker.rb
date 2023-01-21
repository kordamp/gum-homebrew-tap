# Generated with JReleaser 1.4.0 at 2023-01-21T09:44:31.363270835Z
class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.6.0/pomchecker-1.6.0.zip"
  version "1.6.0"
  sha256 "721de939fa9a1340592e37b611731797c615846d246fac7fabb3aafeaeb8e1eb"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.6.0", output
  end
end
