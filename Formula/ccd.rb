class Ccd < Formula
  desc "Shared context and collaboration layer for humans and AI agents"
  homepage "https://github.com/koduj-dev/context-commander"
  version "0.1.0-beta.2"
  license "AGPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/context-commander/releases/download/v0.1.0-beta.2/ccd-darwin-amd64"
      sha256 "864c9821f94758a1baf4752240e7899f48784e440b023f401016b88015cd9830"
    end
    on_arm do
      url "https://github.com/koduj-dev/context-commander/releases/download/v0.1.0-beta.2/ccd-darwin-arm64"
      sha256 "8cf0148bec6a49dad76de24ca1c8fde03a9c438407a3d060646196bda5aa5bae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/context-commander/releases/download/v0.1.0-beta.2/ccd-linux-amd64"
      sha256 "db07e90b7b6ff82f3fcc1d0ac3a726170cb03883a6cc21239e246354f38f7f5e"
    end
    on_arm do
      url "https://github.com/koduj-dev/context-commander/releases/download/v0.1.0-beta.2/ccd-linux-arm64"
      sha256 "5bb6bff705a668b85bb6777ffca2350893c1b144e2577b90634cbbc6d3941602"
    end
  end

  # One page per command, generated from --help at release time (make man);
  # the same pages the .deb and .rpm ship.
  resource "man" do
    url "https://github.com/koduj-dev/context-commander/releases/download/v0.1.0-beta.2/ccd-man.tar.gz"
    sha256 "b47a565edc990a1901f80ecbcba54e13e71b536713ae14c059d4ab9b7b8f0640"
  end

  def install
    # The release asset is the bare binary (ccd-<os>-<arch>); only one is
    # downloaded per platform, so install it under the canonical name.
    bin.install Dir["ccd-*"].first => "ccd"
    resource("man").stage { man1.install Dir["*.1.gz"] }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccd version")
    assert_path_exists man1/"ccd-serve.1.gz"
  end
end
