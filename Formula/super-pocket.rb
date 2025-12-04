class SuperPocket < Formula
  include Language::Python::Virtualenv

  desc "Developer toolkit: README generator, codebase-to-markdown, XML tags, agent templates & cheatsheets"
  homepage "https://github.com/dim-gggl/super-pocket"
  url "https://github.com/dim-gggl/super-pocket/archive/refs/tags/v1.0.tar.gz"
  sha256 "aea68dd5d5ef7c219102d87196bcb0dbeff0c7948f89ec2fb708deb724b907df"
  license "MIT"

# 1. Forcer Python 3.11 pour la stabilité
  depends_on "python@3.11" 

  # 2. AJOUT CRITIQUE : Librairies requises pour compiler Pillow
  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "libtiff"
  depends_on "little-cms2"
  depends_on "openjpeg"
  depends_on "webp"
  depends_on "zlib"
  
  # Outil de build souvent nécessaire pour lier les librairies C
  depends_on "pkg-config" => :build

  def install
    # Create virtualenv with pip included
    venv = virtualenv_create(libexec, "python3.11")

    # Install the package with all dependencies using pip
    venv.pip_install Pathname.pwd

    # Create symlink for CLI command
    bin.install_symlink libexec/"bin/pocket"
  end

  test do
    # Verify pocket is in PATH and version displays correctly
    assert_match "pocket, version", shell_output("pocket --version")

    # Test basic functionality - help command works
    system "pocket", "--help"
  end

  def caveats
    <<~EOS
      Super Pocket has been installed successfully!

      Run 'pocket --help' to get started.

      Note: This formula uses Python 3.11 exclusively due to binary wheel
      compatibility requirements for pydantic-core and watchfiles.
    EOS
  end
end
