# CementGB.github.io

This is the repository hosting the website for the Cement modding library for Gang Beasts. It contains a basic raw HTML homepage as well as documentation for the library generated using DocFX.

## Contribute

### Building from source

#### Requirements

- [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5#install-powershell-using-winget-recommended) 
- [Git](https://git-scm.com/)
- [.NET 8 SDK and Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)

#### Step-by-Step

1. **Clone this repository** to an empty folder using `git clone` or your preferred method.
2. **Make your changes.** Some guided examples and rules are listed below. Make sure to commit and/or push.
3. **Run the build script at `scripts/build.ps1`.** It should handle the installing of DocFX and the building and packing of both the homepage and the docs automatically for then deploying elsewhere in raw HTML.

### Adding guides
Simply open `pages/docs/guides` and add a Markdown file with the title of the page as the filename but in lowercase and with no spaces (i.e. `Getting Started` becomes `getting-started.md`). Then, add the page to `toc.yml`. You can then make your changes. When you're done, simply commit, push and build using the steps from above.

### Updating the API reference
Its as simple as building or downloading the [newest Cement release](https://github.com/CementGB-4-0/CementSource/releases/latest)'s `CementGB.dll` and `CementGB.xml` files, placing them in `pages/docs/src`, and building the website via the step-by-step instructions above. API summaries are generated from the XML found in the source code.