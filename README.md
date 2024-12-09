<!-- ---
!-- title: ./Semacs/README.md
!-- author: ywatanabe
!-- date: 2024-12-08 03:12:12
!-- --- -->

# Ninja — Neural Information Network of Joint Agents
<p align="center">
    <img src="./docs/logos/logo_55.jpg" width="100px">
</p>


THIS REPOSITORY IS CURRENTLY UNDER ACTIVE DEVELOPMENT
=====================================================

## Introduction
Ninja is an LLM agent system run on Emacs, which offers unique characteristics:
- Full CUI operations with rich GUI
- Interfaces for hacking tools seasoned by history
- Self-evolving potentials inherited from Emacs and Elisp

Here, we reintroduce Emacs — born in MIT's AI Lab in 1970s — as a catalyst for AI agents.

## Quick Start
```bash
# Clone repositories
git clone https://github.com/user/ninja.git ~/.emacs.d/ninja
git clone https://github.com/user/ninja-utils.git ~/.ninja/utils
```

## Developing
``` bash
apptainer_build_def2sand ./.apptainer/ninja/ninja.def
apptainer run ./.apptainer/ninja/ninja.sandbox
less ./.apptainer/ninja/ninja.sandbox.log
apptainer run ./.apptainer/ninja/ninja.sandbox
```

## Contact
ywatanabe@alumni.u-tokyo.ac.jp
