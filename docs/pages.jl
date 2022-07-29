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
                "Installation" => "julia/installation_jl.md",
                "Getting Started" => "julia/getting_started_jl.md",
                "JuMP Interface" => "julia/jump.md",
                "Convex.jl Interface" => "./literate/build/convex_jl.md",
                "Arbitrary Precision Arithmetic" => "./literate/build/arbitrary_precision.md",
                "Linear Solvers" => "julia/linear_solvers.md",
          ],
          "Rust" =>  Any[
                "Installation" => "rust/installation_rs.md",
                "Getting Started" => "rust/getting_started_rs.md",
          ],
          "Python" =>  Any[
                "Installation" => "python/installation_py.md",
                "Getting Started" => "python/getting_started_py.md",
          ],
      ],
      #"Method" => "method.md",
      "Examples" => examples,
      "Citing Clarabel" => "citing.md",
      "Contributing" => "contributing.md",
      "API Reference" => Any[
          "Julia API" => "api_jl.md"
          "Rust API \u29C9" => "api_rs.md"
    ]
  ]
