class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.7.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.2/dockercmd-darwin-amd64"
      sha256 "7addb3177d4f739272630243c603b45e0ecb5698647dacb635e72275a483279e"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.2/dockercmd-darwin-arm64"
      sha256 "637010a9b80a3e552d3a6f0d1c75c684b04bc7b8684b2b106138b5751bb20d8f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.2/dockercmd-linux-amd64"
      sha256 "278a075df965f996394b60b5b0ee318df9169155125d221ebbbe349e9ca1f34e"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.2/dockercmd-linux-arm64"
      sha256 "6517b2c7c8fa84c5c804a6ed2109695637dde8705151d7ca2ce84ccdd841d231"
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
