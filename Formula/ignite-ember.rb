class IgniteEmber < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant with multi-agent orchestration"
  homepage "https://ignite-ember.sh"
  url "https://files.pythonhosted.org/packages/source/i/ignite-ember/ignite_ember-0.3.3.tar.gz"
  sha256 "f496c39ab484619dfd2fb41d8832c5a37625a8619af755b5bc14978e34a5838d"
  license "MIT"

  depends_on "python@3.12"

  skip_clean "libexec"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python3.12", "-m", "pip", "install", "--prefer-binary", "ignite-ember==0.3.3"
    bin.install_symlink libexec/"bin/ignite-ember"

    # Clear dylib IDs from Rust-built Python extensions so Homebrew's
    # install_name_tool fixup doesn't fail on them.
    Dir.glob(libexec/"lib/**/*.so").each do |so|
      MachO::Tools.change_dylib_id(so, "") rescue nil
    end
  end

  test do
    assert_match "Ember Code", shell_output("#{bin}/ignite-ember --version")
  end
end
