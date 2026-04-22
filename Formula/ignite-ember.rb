class IgniteEmber < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant with multi-agent orchestration"
  homepage "https://ignite-ember.sh"
  url "https://files.pythonhosted.org/packages/source/i/ignite-ember/ignite_ember-0.2.1.tar.gz"
  sha256 "103afae869d60f9ec03b0146bcf4568dac57f9d812f975b7429d61776c6f42cc"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Ember Code", shell_output("#{bin}/ignite-ember --help")
  end
end
