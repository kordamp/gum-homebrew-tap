# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-02-06T20:28:32.478135496Z
class Jarviz < Formula
  desc "JAR file analyzer"
  homepage "https://github.com/kordamp/jarviz"
  version "0.2.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/kordamp/jarviz/releases/download/v0.2.0/jarviz-standalone-0.2.0-linux-aarch64.zip"
    sha256 "fe13f1edfabe6f76b831b4de7e7478b8fb9ab3749f5706ff29e154cd2d6b0575"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/kordamp/jarviz/releases/download/v0.2.0/jarviz-standalone-0.2.0-linux-x86_32.zip"
    sha256 "4ee54f8259de070c4cef7ec4d482809b1d97f1096caa606b7200108c0e3544fe"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/kordamp/jarviz/releases/download/v0.2.0/jarviz-standalone-0.2.0-linux-x86_64.zip"
    sha256 "5de5bd7fb689ac23676e85bbc8e1b348b3d81ac931015a614bfe09e18b1a1591"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kordamp/jarviz/releases/download/v0.2.0/jarviz-standalone-0.2.0-osx-aarch64.zip"
    sha256 "bff544c1f7bfbef81a6a2c6a71b4e4fa03a93005a8e7d35d4df91dd9b49a045a"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/kordamp/jarviz/releases/download/v0.2.0/jarviz-standalone-0.2.0-osx-x86_64.zip"
    sha256 "d924af8a88375222e79553ecb9a2213f8f9e9545a6f1a1e74dfd9ddf71c6a605"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/jarviz" => "jarviz"
  end

  def post_install
    if OS.mac?
      Dir["#{libexec}/lib/**/*.dylib"].each do |dylib|
        chmod 0664, dylib
        MachO::Tools.change_dylib_id(dylib, "@rpath/#{File.basename(dylib)}")
        chmod 0444, dylib
      end
    end
  end

  test do
    output = shell_output("#{bin}/jarviz --version")
    assert_match "0.2.0", output
  end
end
