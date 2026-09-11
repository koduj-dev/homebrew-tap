class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.6.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.4/dockercmd-darwin-amd64"
      sha256 "847e18d491d29f84b43aee78bd35767965b1efc99be1ac69f78b5a895b7a92cf"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.4/dockercmd-darwin-arm64"
      sha256 "8373197b6333eba52443e9ecad80693b7e702242a5f8923a6dcb96cc353accba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.4/dockercmd-linux-amd64"
      sha256 "c9ab7571fca07f01510df23cdc27c3944d21e930c728a0f2d60ae8e05d7180ae"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.4/dockercmd-linux-arm64"
      sha256 "179a65f17edda97ad2eca5506aa447fef98e58521ff6ca18825d84ecbeca1404"
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
