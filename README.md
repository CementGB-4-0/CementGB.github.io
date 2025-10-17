# CementGB.github.io

This is the repository hosting the website for the Cement modding API for Gang Beasts. It contains a basic raw HTML homepage as well as documentation for the library generated using DocFX.

## Contribute

### Building from source

#### Requirements

- [NodeJS + NPM](https://nodejs.org)
- [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5#install-as-a-net-global-tool) 
- [Git](https://git-scm.com/)
- [.NET 9 SDK and Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/9.0)

#### Step-by-Step

1. **Clone this repository** to an empty folder using `git clone` or your preferred method.
2. **Install the dependencies.** You should be able to do this just by running `npm install`.
3. **Make your changes.** Some guided examples and rules are listed below. Make sure to commit and/or push.
4. **Run the build script at `scripts/build.ps1`.** It should handle the installing of DocFX and the building and packing of both the homepage and the docs automatically for then deploying elsewhere in raw HTML.

### Development Aides

#### [`commitlint`](https://commitlint.js.org/)

You may notice you can't just put anything as a commit message when you go to push your changes. This is because your commits must adhere to the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/#summary). This allows a smoother versioning and changelog automation process, as well as just to keep things looking nice and formal. This is enforced by [`commitlint`](https://commitlint.js.org/), an NPM package. Read up on their website if you need to learn more.

#### [`git-cliff`](https://git-cliff.org/)

A changelog generator. Also an NPM package. Relies on commits to adhere to the Conventional spec mentioned above as well.

### Adding 

Simply open `pages/docs/guides` and add a Markdown file with the title of the page as the filename but in lowercase and with no spaces (i.e. `Getting Started` becomes `getting-started.md`). Then, add the page to `toc.yml`. You can then make your changes. When you're done, simply commit, push and build using the steps from above.

### Updating the API reference

Its as simple as building or downloading the [newest Cement release](https://github.com/CementGB-4-0/CementSource/releases/latest)'s `CementGB.dll` and `CementGB.xml` files, placing them in `pages/docs/src`, and building the website via the step-by-step instructions above. API summaries are generated from the XML found in the source code.