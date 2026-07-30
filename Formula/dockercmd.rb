class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.5.1/dockercmd-darwin-amd64"
      sha256 "e6a69a1e4fdb97ebd45e65e532d9540a00196b3c59d6e0defba2ec210b9376c8"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.5.1/dockercmd-darwin-arm64"
      sha256 "ad36dfdff8ddec6cab6af4056759fa0bb3cdcfa4ba32bf2455cd74430ce0a6c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.5.1/dockercmd-linux-amd64"
      sha256 "0ee9940587f78343a0a9fdb9e652fbcf4eeb21959871278775bd1e623fa64b7b"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.5.1/dockercmd-linux-arm64"
      sha256 "127c35370249056989e1424a78c38cc09b6f955f048fdc2415068bca4f1d99bb"
    end
  end

  def install
    # The release asset is the bare binary (dockercmd-<os>-<arch>); only one is
    # downloaded per platform, so install it under the canonical name.
    bin.install Dir["dockercmd-*"].first => "dockercmd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dockercmd --version")
  end
end
