# Generated with JReleaser 1.3.1 at 2022-12-18T17:17:36.243322061Z
class Jarviz < Formula
  desc "JAR file analyzer"
  homepage "https://github.com/kordamp/jarviz"
  version "0.1.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/kordamp/jarviz/releases/download/v0.1.0/jarviz-standalone-0.1.0-linux-aarch64.zip"
    sha256 "3f8a0df6a18ab9bda1404757972538325c2d4ed883a98a9d4c437b880248deab"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/kordamp/jarviz/releases/download/v0.1.0/jarviz-standalone-0.1.0-linux-x86_64.zip"
    sha256 "254963825b2e32e321458561add3404c83e7c71eee1b50815607837edf643e53"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kordamp/jarviz/releases/download/v0.1.0/jarviz-standalone-0.1.0-osx-aarch64.zip"
    sha256 "8ee2658f1ef6ff18ee87e57dcb721f2434893f58fb67ebe2916f5ebcd474dd34"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/kordamp/jarviz/releases/download/v0.1.0/jarviz-standalone-0.1.0-osx-x86_64.zip"
    sha256 "e25d8890050d18bd440cc507a569b0574ea60c94153bc10a4000e8ff248c58ab"
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
    assert_match "0.1.0", output
  end
end
