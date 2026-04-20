class IgniteEmber < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant with multi-agent orchestration"
  homepage "https://ignite-ember.sh"
  url "https://files.pythonhosted.org/packages/source/i/ignite-ember/ignite_ember-0.1.0.tar.gz"
  sha256 "680bf0ab063da39d9a40358bcc4746444e05e8800f57f2e06ee7f438644cf48a"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Ember Code", shell_output("#{bin}/ignite-ember --help")
  end
end
