class ItermLayout < Formula
  desc "Save and restore iTerm2 windows, split panes, folders and Claude Code sessions"
  homepage "https://github.com/MPilukov/iterm-layout"
  url "https://github.com/MPilukov/iterm-layout/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4c725c4b24aef72bb74a7ef4d1375fcb7dfe3bdb743e5636be3f19a906ac8231"
  license "MIT"

  depends_on :macos

  def install
    bin.install "iterm-layout"
  end

  def caveats
    <<~EOS
      The first save or restore asks for permission to control iTerm2
      (System Settings > Privacy & Security > Automation).
      Snapshots live in ~/.config/iterm-layout/snapshots.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iterm-layout --version")
    assert_match "No snapshots yet", shell_output("HOME=#{testpath} #{bin}/iterm-layout list")
  end
end
