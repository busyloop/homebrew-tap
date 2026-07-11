class Csync < Formula
  include Language::Python::Shebang

  NAME = "csync".freeze
  VERSION = "1.3.0".freeze

  desc "Sync clean working copies of local Git repos to a remote host via rsync"
  homepage "https://github.com/busyloop/#{NAME}"
  url "https://github.com/busyloop/#{NAME}.git", tag: "v#{VERSION}"
  head "https://github.com/busyloop/#{NAME}.git"

  depends_on "python@3.13"
  uses_from_macos "git"
  uses_from_macos "rsync"

  def install
    rewrite_shebang detected_python_shebang, "csync.py"
    bin.install "csync.py" => NAME
  end

  test do
    assert_match "usage: csync", shell_output("#{bin}/#{NAME} --help")
    # no args is a usage error and must exit 2
    assert_match "csync: error", shell_output("#{bin}/#{NAME} 2>&1", 2)
  end
end
