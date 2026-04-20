class IgniteEmber < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant with multi-agent orchestration"
  homepage "https://ignite-ember.sh"
  url "https://files.pythonhosted.org/packages/source/i/ignite-ember/ignite_ember-0.1.1.tar.gz"
  sha256 "2166f2b25ac78efb24aab2c2c704707d749d3812cf629732d664d0ea02aad642"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Ember Code", shell_output("#{bin}/ignite-ember --help")
  end
end
