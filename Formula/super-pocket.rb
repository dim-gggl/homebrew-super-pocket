class SuperPocket < Formula
  include Language::Python::Virtualenv

  desc "Developer toolkit: README generator, codebase-to-markdown, XML tags, agent templates & cheatsheets"
  homepage "https://github.com/dim-gggl/super-pocket"
  url "https://github.com/dim-gggl/super-pocket/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "d6d15536ffb24636b1a21d3a0806260e8b6939cca29904529175dfb76f35fe19"
  license "MIT"

  depends_on "python@3.11"

  # Libraries required to compile Pillow
  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "libtiff"
  depends_on "little-cms2"
  depends_on "openjpeg"
  depends_on "webp"
  depends_on "zlib"

  depends_on "pkg-config" => :build

  resource "rich-click" do
    url "https://files.pythonhosted.org/packages/bf/d8/f2c1b7e9a645ba40f756d7a5b195fc104729bc6b19061ba3ab385f342931/rich_click-1.9.4.tar.gz"
    sha256 "af73dc68e85f3bebb80ce302a642b9fe3b65f3df0ceb42eb9a27c467c1b678c8"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/fb/d2/8920e102050a0de7bfabeb4c4614a49248cf8d5d7a8d01885fbb24dc767a/rich-14.2.0.tar.gz"
    sha256 "73ff50c7c0c1c77c8243079283f4edb376f0f6442433aecb8ce7e6d0b92d1fe4"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/f0/26/19cadc79a718c5edbec86fd4919a6b6d3f681039a2f6d66d14be94e75fb9/python_dotenv-1.2.1.tar.gz"
    sha256 "42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/cb/ce/f06b84e2697fef4688ca63bdb2fdf113ca0a3be33f94488f2cadb690b0cf/uvicorn-0.38.0.tar.gz"
    sha256 "fd97093bdd120a2609fc0d3afe931d4d4ad688b6e75f0f929fde1bc36fe0e91d"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/80/f0/086c442c6516195786131b8ca70488c6ef11d2f2e33c9a893576b2b0d3f7/fastapi-0.121.3.tar.gz"
    sha256 "0055bc24fe53e56a40e9e0ad1ae2baa81622c406e548e501e717634e2dfbc40b"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/5a/b0/cace85a1b0c9775a9f8f5d5423c8261c858760e2466c79b2dd184638b056/pillow-12.0.0.tar.gz"
    sha256 "87d4f8125c9988bfbed67af47dd7a953e2fc7b0cc1e7800ec6d2080d490bb353"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # Adapte selon le vrai output
    system bin/"pocket", "--help"
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
