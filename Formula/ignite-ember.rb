class IgniteEmber < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant with multi-agent orchestration"
  homepage "https://ignite-ember.sh"
  url "https://files.pythonhosted.org/packages/source/i/ignite-ember/ignite_ember-0.2.0.tar.gz"
  sha256 "1da48138981d4004968955ef77b10e7bb8653efde131c5e7e3825033a5f62e64"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Ember Code", shell_output("#{bin}/ignite-ember --help")
  end
end
