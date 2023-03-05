# Generated with JReleaser 1.5.0 at 2023-03-05T13:21:22.766473124Z
class Jarviz < Formula
  desc "JAR file analyzer"
  homepage "https://github.com/kordamp/jarviz"
  version "0.3.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/kordamp/jarviz/releases/download/v0.3.0/jarviz-standalone-0.3.0-linux-aarch64.zip"
    sha256 "8ae25dedae9d967e29910b24d1e1bd8676b6c26da9c70db1fbe630ab37b267fa"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/kordamp/jarviz/releases/download/v0.3.0/jarviz-standalone-0.3.0-linux-x86_64.zip"
    sha256 "1cefeab0834bca70ede3c091febc57e184911ae88a8b3d838e2cfaa817c79b46"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kordamp/jarviz/releases/download/v0.3.0/jarviz-standalone-0.3.0-osx-aarch64.zip"
    sha256 "6e696c649f56687c7b6c4d221d86811002954d5eddb8e4f1f3dcddc879f319ec"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/kordamp/jarviz/releases/download/v0.3.0/jarviz-standalone-0.3.0-osx-x86_64.zip"
    sha256 "1ed5347cadbc3642f4f7a791f99d7b5eb5ede2caa77f8d867f3a6ce09e316b47"
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
    assert_match "0.3.0", output
  end
end
