class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.6.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.6/dockercmd-darwin-amd64"
      sha256 "4119915f4e58e5913b3a5290174e1637eaf1f5cf0b36413e7134abbce1f9765d"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.6/dockercmd-darwin-arm64"
      sha256 "3304a5c228b5b28c41276afef9166b8a2693679a7cf472dff626e048f46e7101"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.6/dockercmd-linux-amd64"
      sha256 "b76595725666b159dec4a15da4a9a5ae82422fd0dc0f37fafd196dd2cf5dd733"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.6/dockercmd-linux-arm64"
      sha256 "f4b8a9426de0d0cef6815d81c82564e974b0c8c911ce60d0df25a2ec8f75ece4"
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
