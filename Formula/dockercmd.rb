class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.1/dockercmd-darwin-amd64"
      sha256 "4f2f192d2e27e8802845ae70c191bfbe588588b11c8d57aa2322c0beaeb0efab"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.1/dockercmd-darwin-arm64"
      sha256 "20605b3a212cbb34a92916252c8022e779fe4ace2e7a376e3799aee7a19c60a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.1/dockercmd-linux-amd64"
      sha256 "3168828e48f916883b3642bbbd39c00a5b308c062c62bc51c7a463d6775b61aa"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.1/dockercmd-linux-arm64"
      sha256 "acf8578710f7606aaa2c9b4f7aa1898a227e4ca11fe44840cce4f36b9ccd2608"
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
