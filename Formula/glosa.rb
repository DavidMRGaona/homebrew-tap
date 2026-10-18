class Glosa < Formula
  desc "Docopt-style argument parser in pure Bash"
  homepage "https://github.com/DavidMRGaona/glosa"
  url "https://github.com/DavidMRGaona/glosa/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "33cf5fdc76d5e6200c7fceada3eb3753b5b9b3ab0ac52ef30b97cc52a9895384"
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
