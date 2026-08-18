class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.6.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.2/dockercmd-darwin-amd64"
      sha256 "48b75f4964e3f5f9c071dc335831181887cd0c9bdbe420bcd1a4d582ea55e8f8"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.2/dockercmd-darwin-arm64"
      sha256 "5d557ec6ce30a7e3e444ad3e54de7ff571a39bb368d0d9c438af83c5cf4f4aaa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.2/dockercmd-linux-amd64"
      sha256 "a73fc4487e312a8b22592c5831d04292b6bd06214c2e33a883c3d8860bb0e824"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.6.2/dockercmd-linux-arm64"
      sha256 "96d7e52e405679a4e44b29c34b70f609b3b35e0f7b89bdaee8a0498d091078a0"
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
