class IgniteEmber < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant with multi-agent orchestration"
  homepage "https://ignite-ember.sh"
  url "https://files.pythonhosted.org/packages/source/i/ignite-ember/ignite_ember-0.3.0.tar.gz"
  sha256 "8deb961237b68ffa9f3bfbbd5822675a79a680855349289e7bb0b246dac55ac7"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Ember Code", shell_output("#{bin}/ignite-ember --help")
  end
end
