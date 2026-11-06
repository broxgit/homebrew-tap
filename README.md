# homebrew-tap

Homebrew formulas for tools by broxgit.

## llm-relay

[llm-relay](https://github.com/broxgit/llm-relay) lets Microsoft Copilot Cowork change your code, even though it can't reach your machine.

```bash
brew install broxgit/tap/llm-relay
```

```bash
relay start
```

To update:

```bash
brew update && brew upgrade llm-relay && relay start
```

The formula is in `Formula/llm-relay.rb`. [docs/releasing.md](https://github.com/broxgit/llm-relay/blob/main/docs/releasing.md) in llm-relay says how it gets a new version.
