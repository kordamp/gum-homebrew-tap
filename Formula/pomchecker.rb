# Generated with JReleaser 1.4.0 at 2023-01-07T22:46:33.757411293Z
class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.5.0/pomchecker-1.5.0.zip"
  version "1.5.0"
  sha256 "cd8dc9a22e595d558ac8c1dbb60935e5ebabd465b3ac87a2ed53857526ff03f2"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.5.0", output
  end
end
