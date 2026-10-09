class Dockercmd < Formula
  desc "Monitor and control Docker from one self-contained binary"
  homepage "https://github.com/koduj-dev/docker-commander"
  version "1.7.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.1/dockercmd-darwin-amd64"
      sha256 "7387c65fb9db36756601e9e9fe275aa41de948830e95fde41d72de3ca379755f"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.1/dockercmd-darwin-arm64"
      sha256 "1a4be5f5a447a3f25ca1df4aa1373fee66a119255a854220950ca784cb7fa249"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.1/dockercmd-linux-amd64"
      sha256 "41a8b3b19ab06fb2abac0445588531ae1b2801a89be565e5fd66f503e661299d"
    end
    on_arm do
      url "https://github.com/koduj-dev/docker-commander/releases/download/v1.7.1/dockercmd-linux-arm64"
      sha256 "c2e209a139a2c92868f38b044f16cfd2d9269f295cc08b1270367f018cfdb239"
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
