class ItermLayout < Formula
  desc "Save and restore iTerm2 windows, split panes, folders and Claude Code sessions"
  homepage "https://github.com/MPilukov/iterm-layout"
  url "https://github.com/MPilukov/iterm-layout/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2d426fb6aea4093e472068c20abb466738fa8efd33bca5bf92dd1b6f6f53f360"
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
