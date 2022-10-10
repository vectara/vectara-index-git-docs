## vectara-index-git-docs

Find all documents that have changed in a GitHub repository and submit them to Vectara.

Useful for auto-indexing documentation and other enterprise content contained in GitHub repositories.

## Usage

To use this GitHub action, add a file at `.github/workflows/vectara.yml` with the following contents.

Add secrets to the repository for the `secrets.` values in this template.

```yaml
name: CI

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    name: Index changed-files
    steps:
      - uses: vectara/vectara-index-git-docs@v0.1.2
        with:
          vectaraAccountNumber: ${{ secrets.VECTARA_ACCOUNT_NUMBER }}
          vectaraCorpusID: ${{ secrets.VECTARA_CORPUS_NUMBER }}
          vectaraClientID: ${{ secrets.VECTARA_CLIENT_ID }}
          vectaraClientSecret: ${{ secrets.VECTARA_CLIENT_SECRET }}
          filesPattern: |
            **/*.md
```

## Configuration
|      Parameter       |   Description                | Default
|:--------------------:|:----------------------------:|:----------------------------:
| vectaraAccountNumber | Vectara Account Number       | N/A
|    vectaraCorpusID   | Vectara Account ID           | N/A
|    vectaraClientID   | Vectara OAuth2 Client ID     | N/A
|  vectaraClientSecret | Vectara OAuth2 Client Secret | N/A
|     filesPattern     | What files to index          | **
