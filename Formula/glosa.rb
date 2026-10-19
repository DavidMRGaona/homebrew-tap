class Glosa < Formula
  desc "Docopt-style argument parser in pure Bash"
  homepage "https://github.com/DavidMRGaona/glosa"
  url "https://github.com/DavidMRGaona/glosa/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3edcacd257fcf34524297d1dbdad9f61e3dd44c74824a720fb0f3e56ce52c994"
  license "GPL-3.0-or-later"

  def install
    pkgshare.install "glosa.sh"
    bin.install_symlink pkgshare/"glosa.sh" => "glosa"
  end

  test do
    assert_equal "x='v'", shell_output("#{bin}/glosa -h 'Usage: prog <x>' : v").strip
    assert_match "x=v", shell_output("bash -c 'source #{pkgshare}/glosa.sh; " \
                                     "glosa::parse \"Usage: prog <x>\" v; echo x=$x'")
  end
end
