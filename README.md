# Wolfram

> The goal of this project is to implement Wolfram’s elementary cellular automaton in the terminal.

We had to implement rules 30, 90 and 110.

But it was easier to implement all rules with a generic method.

<p align="center">
  <a href="https://fr.wikipedia.org/wiki/Automate_cellulaire">
    <img src=".github/readme_resources/One-d-cellular-automate-rule-30.gif" alt="gif algo">
  </a>
</p>

This project was make in Haskell.

<p align="center">
  <a href="https://www.haskell.org/">
    <img src=".github/readme_resources/haskell_logo.png" alt="Haskell logo">
  </a>
</p>

<h2>Previews</h2>
<details>
    <summary>Rule 30</summary>
    <img src="/.github/readme_resources/rule30.png">
</details>
  <details>
    <summary>Rule 90</summary>
    <img src="/.github/readme_resources/rule90.png">
</details>
<details>
    <summary>Rule 110</summary>
    <img src="/.github/readme_resources/rule110.png">
</details>

## Requirements

### Stack

To install stack please refer to
the [installation guide](https://docs.haskellstack.org/en/stable/install_and_upgrade/)

## Build and run

Linux:

```sh
make
./wolfram --rule R [ [--start S][--lines L][--window W][--move M] ]
```
* -–rule : the ruleset to use (no default value, mandatory)
* -–start : the generation number at which to start the display. The default value is 0.
* -–lines : the number of lines to display. When omitted, the program never stops.
* -–window : the number of cells to display on each line (line width). If even,
the central cell is displayed in the next cell on the right. The default value is 80.
* -–move : a translation to apply on the window. If negative, the window is translated to the left.
If positive, it’s translated to the right.

##Bonus

Rules 0 to 255.
```shell
cd bonus
make
./wolfram --rule R [ [--start S][--lines L][--window W][--move M] ]
```

## Contributors

- Antoine Desruet [![github-link][github-logo]](https://github.com/antwxne)

<!-- Markdown link & img definition's -->

[vsc-installation-doc]: https://code.visualstudio.com/docs/editor/command-line

[cmake-installation-doc]: https://cmake.org/install/

[Github-logo]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
