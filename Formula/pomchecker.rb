# Generated with JReleaser 1.11.0 at 2024-03-25T18:01:40.230608884Z

class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.11.0/pomchecker-1.11.0.zip"
  version "1.11.0"
  sha256 "1676c2a70f3a84b908be36abda70107dfd72e747e86bf337cebd99d9dd082f3f"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.11.0", output
  end
end
