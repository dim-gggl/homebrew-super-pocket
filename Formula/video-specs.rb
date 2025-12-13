class VideoSpecs < Formula
  include Language::Python::Virtualenv

  desc "Lightweight CLI helper to organize video ideas into JSON/XML/HTML prompts"
  homepage "https://github.com/dim-gggl/video-specs"
  url "https://files.pythonhosted.org/packages/source/v/video-specs/video-specs-0.1.0.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/source/c/click/click-8.3.1.tar.gz"
    sha256 "96f683aae8dc5e8d70d13e6f7d9a1fd3d87e4e1bfb4a93e57e5e8b2c2f8c4a7c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-14.2.0.tar.gz"
    sha256 "SHA256_FOR_RICH"
  end

  resource "rich-click" do
    url "https://files.pythonhosted.org/packages/source/r/rich-click/rich_click-1.9.4.tar.gz"
    sha256 "SHA256_FOR_RICH_CLICK"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/video-specs", "--version"
  end
end

