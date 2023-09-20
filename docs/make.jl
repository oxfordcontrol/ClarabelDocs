using Documenter, Clarabel, Literate

# a function for importing external code
# snippets into markdown files

include("md_include.jl")

@info "Building example problems..."

include("make_examples_julia.jl")

@info "Making documentation..."

include("pages.jl")

makedocs(
  sitename="Clarabel jl/rs",
  authors = "Paul Goulart",
  format = Documenter.HTML(
        edit_link = "main",
        prettyurls = get(ENV, "CI", nothing) == "true",
        canonical = "https://oxfordcontrol.github.io/ClarabelDocs/stable/",
        assets = ["assets/favicon.ico"; "assets/github_buttons.js"; "assets/custom.css"],
        analytics = "G-FP3WPEJMVX",
  ),
  pages = pages
)

deploydocs(
    devbranch = "develop",
    devurl    = "dev",
    repo      = "github.com/oxfordcontrol/ClarabelDocs.git")
