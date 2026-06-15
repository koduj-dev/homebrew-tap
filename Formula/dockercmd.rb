class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.4.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.4/dockercmd-darwin-amd64"
      sha256 "93599098d3a3471b2290b9eb2ea0d95487293385ac1b12f9e066382b0359c06a"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.4/dockercmd-darwin-arm64"
      sha256 "3408007ac16f35760579205193682025156e4416a00be9751ad2819c5940b79d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.4/dockercmd-linux-amd64"
      sha256 "e760eeeb8f5c4645f40ca9fc79d8bd4947f4602ef086ae61be8dc1153e518adc"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.4.4/dockercmd-linux-arm64"
      sha256 "09aed675e944de17d2dbfee9959032755db5ec6cf1f90596faf0b558f18d50af"
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
