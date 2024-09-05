# Generated with JReleaser 1.14.0 at 2024-09-05T08:50:12.946870759Z

class Pomchecker < Formula
  desc "Checks POM files may be uploaded to Maven Central"
  homepage "https://kordamp.org/pomchecker"
  url "https://github.com/kordamp/pomchecker/releases/download/v1.13.0/pomchecker-1.13.0.zip"
  version "1.13.0"
  sha256 "e4722daf59b5e87f70beb1d09d2d0cabb344a57acf8c06ea53089a510799f2e6"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/pomchecker" => "pomchecker"
  end

  test do
    output = shell_output("#{bin}/pomchecker --version")
    assert_match "1.13.0", output
  end
end
