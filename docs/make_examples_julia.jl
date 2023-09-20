# This file borrows heavily from COSMO.jl

# utility function from https://github.com/JuliaOpt/Convex.jl/blob/master/docs/make.jl
fix_math_md(content) = replace(content, r"\$\$(.*?)\$\$"s => s"```math\1```")
fix_suffix(filename) = replace(filename, ".jl" => ".md")

function postprocess(cont)

      """ Source files for Julia examples can be found in [examples/jl](" *
      joinpath(@__DIR__, "../examples/jl") * """
      cont
end

# force execution of some examples so that
# their timing in the docs represent execution time,
# not compilation time
oldstream = stdout
redirect_stdout(devnull)  #shh!!
include(joinpath(@__DIR__, "../examples/jl", "example_intro.jl"))
include(joinpath(@__DIR__, "../examples/jl", "example_qp.jl"))
include(joinpath(@__DIR__, "../examples/jl/", "example_socp.jl"))
include(joinpath(@__DIR__, "../examples/jl/", "example_expcone.jl"))
include(joinpath(@__DIR__, "../examples/jl/", "example_powcone.jl"))
include(joinpath(@__DIR__, "../examples/jl/", "example_sdp.jl"))
include(joinpath(@__DIR__, "./src/literate/", "arbitrary_precision.jl"))
include(joinpath(@__DIR__, "./src/literate/", "convex_jl.jl"))
redirect_stdout(oldstream)


# find all Julia example source files
exclude_files = String[];
example_path = joinpath(@__DIR__, "../examples/jl/")
build_path =  joinpath(@__DIR__, "src", "examples/jl/")
files = readdir(example_path)
filter!(x -> endswith(x, ".jl"), files)
filter!(x -> !in(x, exclude_files), files)

for file in files
      Literate.markdown(example_path * file, build_path; preprocess = fix_math_md, postprocess = postprocess, documenter = true, credit = true)
end


# find all other documentation source files that are built with Literate
example_path = joinpath(@__DIR__, "src", "literate/")
build_path =  joinpath(@__DIR__, "src", "literate", "build/")
files = readdir(example_path)
filter!(x -> endswith(x, ".jl"), files)
for file in files
      Literate.markdown(example_path * file, build_path; preprocess = fix_math_md, documenter = true, credit = true)
end
