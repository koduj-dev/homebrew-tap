class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.6.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.3/dockercmd-darwin-amd64"
      sha256 "5b037fda1aa6338b873b90fc62d6ab3c3b62ea04c1beb578e6f255b931938aea"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.3/dockercmd-darwin-arm64"
      sha256 "be038918ccf4e43bf877c2b3ca22cea4bf6c05682fb6710193f06c12b8d90ee5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.3/dockercmd-linux-amd64"
      sha256 "2c11e57f47ace366639ea7b541ee215fcd595f869987c4cc51c386de0ab025ca"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.3/dockercmd-linux-arm64"
      sha256 "f5cb4a60ed2056f0d755cc7620b85bc7a9cee4d38675d936559d42e78224364b"
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
