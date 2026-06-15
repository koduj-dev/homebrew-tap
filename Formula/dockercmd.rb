class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.4.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.3/dockercmd-darwin-amd64"
      sha256 "e8a18a66e9bd1c5caca25e06ce19a2a265c235ecc9852e96554bf613a8b5aebf"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.3/dockercmd-darwin-arm64"
      sha256 "6f13448d2afd2921be6a66fa5e049e8f595294c51f3f16646d37d84be83b31bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.3/dockercmd-linux-amd64"
      sha256 "5458ed346cccbb0a5ea665f75be6dbbf39cb22d227b71a3c9518a9d9bd5f791d"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.3/dockercmd-linux-arm64"
      sha256 "f80b37b3232a9e1eac0bd84d321a9201a4da5e1fb1facd5572fc29c97da86a76"
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
