class IgniteEmber < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant with multi-agent orchestration"
  homepage "https://ignite-ember.sh"
  url "https://files.pythonhosted.org/packages/source/i/ignite-ember/ignite_ember-1.0.2.tar.gz"
  sha256 "3b8fcbea2afa26194584976faaff3cd076cc6d2075fd2fe95c3728f26111e5d4"
  license "MIT"

  depends_on "git"
  depends_on "python@3.12"
  depends_on "ripgrep"

  skip_clean "libexec"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python3.12", "-m", "pip", "install", "--prefer-binary", "ignite-ember==1.0.2"
    bin.install_symlink libexec/"bin/ignite-ember"

    # Clear dylib IDs from Rust-built Python extensions so Homebrew's
    # install_name_tool fixup doesn't fail on them.
    Dir.glob(libexec/"lib/**/*.so").each do |so|
      MachO::Tools.change_dylib_id(so, "") rescue nil
    end
  end

  test do
    assert_match "igni", shell_output("#{bin}/ignite-ember --version")
  end
end
