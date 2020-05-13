[![Email me](https://img.shields.io/badge/Hire%20%2F%20Consult-Click%20to%20contact-blue)](mailto:rosewanjohi24@gmail.com)
[![Twitter Follow](https://img.shields.io/twitter/follow/blackpintz?label=Tweet%20me&style=social)](https://twitter.com/blackpintz)

## Ruby-CSS-Linter

The projects checks linter errors in CSS files.

### Description

I used a gem called css_parser to locate and parse css files. Then, defined five lint errors that I want the css files
to check against.
They linters set some of the following rules:

- Do not use px measurements.
- All selector names should be in lower case.
- The file should not use more than four ID selectors.

When the file fails to lint checkers, it throw a red colored error giving the warning.

## Built with

-Ruby

## Getting Started

Clone the git repository.

cd into the project.

Some css files have been created, in the tester_file folder, for testing purposes. If you prefer to use your

own css file, create a css file in the tester_file folder and change the path in the bin/main.rb file.

Run bin/main.rb to find the lint errors in the css file you choose.

## Project Issues 

The css_parser gemfile may or may not load. In that case, try different css_parser versions until
you find one that works.

##Live Demo

[Live Demo Link](https://repl.it/@blackpintz/RubyCssLinters)


## Author

Rose Wanjohi

- Github: [@blackpintz](https://github.com/blackpintz)

- Twitter: [@blackpintz](https://twitter.com/blackpintz)

 
## 🤝 Contributing

Contributions, issues and feature requests are welcome! Start by:

- Forking the project
- Cloning the project to your local machine
- `cd` into the project directory
- Run `git checkout -b your-branch-name`
- Make your contributions
- Push your branch up to your forked repository
- Open a Pull Request with a detailed description to the development branch of the original project for a review

## Show your support

Give a ⭐️ if you like this project!




