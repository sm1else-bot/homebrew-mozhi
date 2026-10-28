# Mozhi Homebrew tap

Install the Mozhi interpreter on macOS (Apple Silicon or Intel) and Linux x64:

```sh
brew install sm1else-bot/mozhi/mozhi
mozhi --version
mozhi repl
```

The native executable bundles Python. A separate Python installation is not required.
macOS 15 and Linux with glibc 2.35+ are the tested baselines. Linux ARM64 is not supported.

To add the tap separately:

```sh
brew tap sm1else-bot/mozhi
brew install sm1else-bot/mozhi/mozhi
```

On Homebrew 6, the fully qualified install trusts only this formula. For short-name
installation, first run `brew trust --formula sm1else-bot/mozhi/mozhi`, then
`brew install mozhi`.

```sh
mozhi run file.mozhi
mozhi check file.mozhi
brew test sm1else-bot/mozhi/mozhi
brew update
brew upgrade mozhi
brew uninstall mozhi
brew untap sm1else-bot/mozhi
```

This is the maintainer's tap, separate from Homebrew/core. Archives are downloaded
from [official Mozhi releases](https://github.com/sm1else-bot/mozhi/releases) and
verified against SHA-256 digests in the formula. macOS binaries are ad-hoc signed,
not Developer ID notarized.

[Language source and documentation](https://github.com/sm1else-bot/mozhi).
Mozhi's early Git commits are retrospective archival reconstructions; see
[PROVENANCE.md](https://github.com/sm1else-bot/mozhi/blob/main/PROVENANCE.md).

## Maintaining the formula

1. Update the single version source in the language repository and complete its
   native build, executable tests and package preparation.
2. Obtain approval and publish the matching immutable GitHub Release assets.
3. Copy the generated `dist/package-managers/homebrew-mozhi/Formula/mozhi.rb` here.
   Verify all public download URLs and hashes against the release checksums.
4. Update `release.json`, open/review the change and require this tap's native
   install/test/reinstall/uninstall workflow to pass before announcing it.
5. For a subsequent version, also test `brew upgrade mozhi` from the previous
   installed version. Do not overwrite released assets or relabel architectures.

The CI workflow checks actual Homebrew installation on native macOS ARM64,
macOS Intel and Linux x64 runners. No registry credentials are needed to install.
