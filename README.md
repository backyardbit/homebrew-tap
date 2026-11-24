# backyardbit/homebrew-tap

```sh
brew tap backyardbit/tap
brew trust backyardbit/tap   # Homebrew only loads third-party taps you trust
brew install backyardbit/tap/termleaf
brew install --cask backyardbit/tap/shovel
```

Claudesaurus comes from a private repository, so Homebrew needs a GitHub token that can read it:

```sh
HOMEBREW_GITHUB_API_TOKEN=$(gh auth token) brew install backyardbit/tap/claudesaurus
```
