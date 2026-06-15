class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.1/dockercmd-darwin-amd64"
      sha256 "ef6f32caa5440b971e6f164bf98cfcc6689e987f422a07b3a974ab5f81d8134e"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.1/dockercmd-darwin-arm64"
      sha256 "dba03b08feaab9c9e5f769b2d2600f079e2bf580cffa9626af059e54e6d8884d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.1/dockercmd-linux-amd64"
      sha256 "43bf8a5372a69f5939d61c31e721de58f68659df0927bda18d997bc68a155bef"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.1/dockercmd-linux-arm64"
      sha256 "d49ea14011e484adc168be869ddd3c5eb972ee8775ec6825b74a885f1b2f52ea"
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
