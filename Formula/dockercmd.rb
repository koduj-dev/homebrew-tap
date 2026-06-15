class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.4.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.2/dockercmd-darwin-amd64"
      sha256 "bbb559540475cf5c894e51a7d74fabcaf362bd6bf2d6eb358eacdab2424edc6d"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.2/dockercmd-darwin-arm64"
      sha256 "c3b5c7c87fcc21533deced5051bd2bb65af863b71c8cb0983c2604b70c19a2a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.2/dockercmd-linux-amd64"
      sha256 "9a72c1a9e5947531a6feb0c301eb5cd7e6fec78dc988d8431dc9ee798fcdd471"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.2/dockercmd-linux-arm64"
      sha256 "d38cfbed7e835bb190cf54233736042de894419590221d0832ef78f9e3c13e35"
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
