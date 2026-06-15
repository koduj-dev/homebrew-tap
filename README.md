# koduj-dev/homebrew-tap

Homebrew tap for [**Docker Commander**](https://github.com/koduj-dev/docker-commander)
— monitor and control Docker from one self-contained binary (works on macOS and
Linux/Linuxbrew).

```bash
brew install koduj-dev/tap/dockercmd
dockercmd --version
```

That installs the signed release binary for your OS/arch. To run the server:

```bash
dockercmd            # serves the web UI on http://127.0.0.1:8470
```

See the [main repo](https://github.com/koduj-dev/docker-commander) for docs,
configuration, and other install methods (release binaries, container image,
`go install`).

## Verifying

The downloaded binary matches the `sha256` pinned in the formula, which in turn
matches the repo's signed `SHA256SUMS` for each release (cosign-verifiable). See
the main repo's “Verifying a download”.
