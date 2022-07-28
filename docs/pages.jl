examples = [
      "Basic QP Example" => Any[
                "Problem Description" => "./examples/example_QP.md",
                "Julia" => "./examples/jl/example_QP.md",
                "Rust" => "./examples/rs/example_QP.md",
                "Python" => "./examples/py/example_QP.md",
      ]
      "Basic SOCP Example" => Any[
                "Problem Description" => "./examples/example_SOCP.md",
                "Julia" => "./examples/jl/example_SOCP.md",
                "Rust" => "./examples/rs/example_SOCP.md",
                "Python" => "./examples/py/example_SOCP.md",
      ]
]

pages = [
      "Home" => "index.md",
      "User Guides" => Any[
          "Julia" =>  Any[
                "Installation" => "julia/installation.md",
                "Getting Started" => "julia/getting_started.md",
                "JuMP Interface" => "julia/jump.md",
                "Convex.jl Interface" => "./literate/build/convex_jl.md",
                "Arbitrary Precision Arithmetic" => "./literate/build/arbitrary_precision.md",
                "Linear Solvers" => "julia/linear_solvers.md",
          ],
          "Rust" =>  Any[
                "Getting Started" => "rust/getting_started.md",
          ],
          "Python" =>   "python/getting_started.md", #NB: one level only as a test
      ],
      #"Method" => "method.md",
      "Examples" => examples,
      "Citing Clarabel" => "citing.md",
      "Contributing" => "contributing.md",
      "API Reference" => Any[
          "Julia API" => "api-jl.md"
          "Rust API \u29C9" => "api-rs.md"
    ]
  ]
