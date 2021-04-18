class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  version "1.2.0"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.2.0/pomchecker-1.2.0.zip"
  sha256 "69e5be5389bb3094431934e2bb7fa88715985ab3cce5ec5262e7b0f557fa8e5d"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.2.0", output
  end
end