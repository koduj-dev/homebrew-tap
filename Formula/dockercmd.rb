class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.6.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.5/dockercmd-darwin-amd64"
      sha256 "3b0dbf58c094cc707fb725cad62f855ad6db78e119d37fde579327ab2034e16c"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.5/dockercmd-darwin-arm64"
      sha256 "871a07607f7389f1c7f92fcfade026babf023b6d3586075f0cf400ecda998dc8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.5/dockercmd-linux-amd64"
      sha256 "1ba0ebff2175c71f6d03e82cc527b70174f0b993d335808cd9ec7582c5bd8539"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.5/dockercmd-linux-arm64"
      sha256 "cfc19dbcd38bff8e91d408f1c65e0a8cc2f379157209fa8fb7a1a4b09c5545b3"
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
