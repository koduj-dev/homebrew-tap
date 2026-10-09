class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.0/dockercmd-darwin-amd64"
      sha256 "6d6ad18c97d21fba90ef6003ec80943cdea56c6decebcd90842b68d057164d32"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.0/dockercmd-darwin-arm64"
      sha256 "a545b34b1a624a08c25758880ebe323b0e71e175cf84ae4f9d9977e207bc0c9c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.0/dockercmd-linux-amd64"
      sha256 "07ab12b99c32beb67a406d33fba5c244269114a0c3a63b5f8d1818d92cd54bba"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.0/dockercmd-linux-arm64"
      sha256 "03a519deefba7d013787390e1260ef96f59c0ace2c9bcecc30cffe7f3286e9a5"
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
