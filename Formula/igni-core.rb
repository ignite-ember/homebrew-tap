class IgniCore < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant with multi-agent orchestration"
  homepage "https://ignite-ember.sh"
  url "https://files.pythonhosted.org/packages/ea/24/8a44eb66f592359d85b64aa956f714dd044512bab0b221c527a851cc57a4/igni_core-1.0.4.tar.gz"
  sha256 "92921412d02ff30fb2a934d4460882b9b5dd13d33ae0d75307e30b8665434269"
  license "Apache-2.0"

  depends_on "git"
  depends_on "python@3.12"
  depends_on "ripgrep"

  skip_clean "libexec"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python3.12", "-m", "pip", "install", "--prefer-binary", "igni-core==#{version}"
    bin.install_symlink libexec/"bin/igni"

    # Clear dylib IDs from Rust-built Python extensions so Homebrew's
    # install_name_tool fixup doesn't fail on them.
    Dir.glob(libexec/"lib/**/*.so").each do |so|
      MachO::Tools.change_dylib_id(so, "")
    rescue
      nil
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/igni --version")
  end
end
