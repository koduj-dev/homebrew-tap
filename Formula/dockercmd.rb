class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.5.0/dockercmd-darwin-amd64"
      sha256 "98412409822e07d61fbc95ae9a1146e2450c300d4faa5cc812877644d7388202"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.5.0/dockercmd-darwin-arm64"
      sha256 "6fa04f153095ef7ebec3ed9052d70d20028455a933309be1e77b5a163a6d7027"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.5.0/dockercmd-linux-amd64"
      sha256 "53fc0d344c54935ff14d4ecf3bc77a5f7a29bbb1c5e1525cfeacbcdb6b73513d"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.5.0/dockercmd-linux-arm64"
      sha256 "fcd9c068d2f435e0eb14f067546a0b237be10b5c381967b90755271ba04fd90c"
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
