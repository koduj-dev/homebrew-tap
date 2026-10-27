class Ccd < Formula
  desc "Shared context and collaboration layer for humans and AI agents"
  homepage "https://github.com/koduj-dev/context-commander"
  version "0.1.0-beta.1"
  license "AGPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/context-commander/releases/download/v0.1.0-beta.1/ccd-darwin-amd64"
      sha256 "493caeaf6972e86bd7dda7e531852d89e23ba575f2080d3e73fe614c89b86cb4"
    end
    on_arm do
      url "https://github.com/koduj-dev/context-commander/releases/download/v0.1.0-beta.1/ccd-darwin-arm64"
      sha256 "52cf5083d5777f8e1585034a77bd851d381b35579a44496f42c42962151c9857"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/context-commander/releases/download/v0.1.0-beta.1/ccd-linux-amd64"
      sha256 "74783a58e0b5ff527ee67556322dd3bde3343e2ff88e5cc76b40fcafa2b60a47"
    end
    on_arm do
      url "https://github.com/koduj-dev/context-commander/releases/download/v0.1.0-beta.1/ccd-linux-arm64"
      sha256 "14e93bd9dcc9730c5feae7da76400a4ac4ac42861653332a022494c16f17446d"
    end
  end

  def install
    # The release asset is the bare binary (ccd-<os>-<arch>); only one is
    # downloaded per platform, so install it under the canonical name.
    bin.install Dir["ccd-*"].first => "ccd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccd version")
  end
end
