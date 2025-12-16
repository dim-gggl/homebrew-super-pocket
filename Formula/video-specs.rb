class VideoSpecs < Formula
  include Language::Python::Virtualenv

  desc "Lightweight CLI helper to organize video ideas into JSON/XML/HTML prompts"
  homepage "https://github.com/dim-gggl/video-specs"
  url "https://files.pythonhosted.org/packages/c8/11/84fc30a728a6b168f616273220946fdb3cf73dc0d4553f0cd8784b707deb/video_specs-0.1.3.tar.gz"
  sha256 "46edb51672bc7b0cdedc66585bea804acaa431bf7a5c0200b9b322131ac1b851"
  license "MIT"

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/source/c/click/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-14.2.0.tar.gz"
    sha256 "73ff50c7c0c1c77c8243079283f4edb376f0f6442433aecb8ce7e6d0b92d1fe4"
  end

  resource "rich-click" do
    url "https://files.pythonhosted.org/packages/source/r/rich-click/rich_click-1.9.4.tar.gz"
    sha256 "af73dc68e85f3bebb80ce302a642b9fe3b65f3df0ceb42eb9a27c467c1b678c8"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/video-specs", "--version"
  end
end

