class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.7.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.3/dockercmd-darwin-amd64"
      sha256 "27c37697b45cb347ba1e1ddb3265fb2a232e2f07467c3edcd7d178996a82b1a7"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.3/dockercmd-darwin-arm64"
      sha256 "b427c6e72828f8f9d9e11a4cddaadcd03018dd959c37bb6dd347519ac0675be8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.3/dockercmd-linux-amd64"
      sha256 "d805f12b0445f91b3b90f3aea4aaad27a970f773e0e1f91878ece1e657d76011"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.3/dockercmd-linux-arm64"
      sha256 "74806a76bbe533a8bd446468e5341fe2c44880a84ae3581785aa853319ba707e"
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
