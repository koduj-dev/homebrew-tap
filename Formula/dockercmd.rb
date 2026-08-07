class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.0/dockercmd-darwin-amd64"
      sha256 "afbd6e1c973ec650ead63a3fb81632d5ac0ae680172fece67ef3d27ca1a89a91"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.0/dockercmd-darwin-arm64"
      sha256 "468cfc5701c260ddc2c1ba6713660a66c08a8aabbb7f7e1252026955fb0add17"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.0/dockercmd-linux-amd64"
      sha256 "cc9cfb0349516df8133fd8d247ef9020e3970362c79c0ec1166de9a9a71f2820"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.0/dockercmd-linux-arm64"
      sha256 "4c1e90eb73f939387e34f7175c4971cf1dca51dcbafd918dae587c4ec15d9767"
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
