examples = [
      "Quadratic Program (QP)" => Any[
            "Problem Description" => "./examples/example_qp.md",
            "Julia" => "./examples/jl/example_qp.md",
            "Rust" => "./examples/rs/example_qp.md",
            "Python" => "./examples/py/example_qp.md",
      ]
      "Second-Order Cone Program (SOCP)" => Any[
            "Problem Description" => "./examples/example_socp.md",
            "Julia" => "./examples/jl/example_socp.md",
            "Rust" => "./examples/rs/example_socp.md",
            "Python" => "./examples/py/example_socp.md",
      ]
      "Exponential Cone Program" => Any[
            "Problem Description" => "./examples/example_expcone.md",
            "Julia" => "./examples/jl/example_expcone.md",
            "Rust" => "./examples/rs/example_expcone.md",
            "Python" => "./examples/py/example_expcone.md",
      ]
      "Power Cone Program" => Any[
            "Problem Description" => "./examples/example_powcone.md",
            "Julia" => "./examples/jl/example_powcone.md",
            "Rust" => "./examples/rs/example_powcone.md",
            "Python" => "./examples/py/example_powcone.md",
      ]
      "Semidefinite Program (SDP)" => Any[
            "Problem Description" => "./examples/example_sdp.md",
            "Julia" => "./examples/jl/example_sdp.md",
            "Rust" => "./examples/rs/example_sdp.md",
            "Python" => "./examples/py/example_sdp.md",
      ]
]

pages = [
      "Home" => "index.md",
      "Supported Languages" => Any[
          "Julia" =>  Any[
                "Installation" => "julia/installation_jl.md",
                "Getting Started" => "julia/getting_started_jl.md",
                "JuMP Interface" => "julia/jump.md",
                "Convex.jl Interface" => "./literate/build/convex_jl.md",
                "Arbitrary Precision Arithmetic" => "./literate/build/arbitrary_precision.md",
          ],
          "Rust" =>  Any[
                "Installation" => "rust/installation_rs.md",
                "Getting Started" => "rust/getting_started_rs.md",
          ],
          "Python" =>  Any[
                "Installation" => "python/installation_py.md",
                "Getting Started" => "python/getting_started_py.md",
          ],
          "C/C++" => "user_guide_c_cpp.md",
          "R" => "user_guide_r.md",
      ],
      "Solver features" => Any[
            "Callbacks" => Any[
            "Termination Callbacks" => "user_guide_callbacks.md",
            "Rust Example" => "./examples/rs/example_callback.md",
            "Python Example" => "./examples/py/example_callback.md",
            ],
          "Chordal Decomposition" => "user_guide_chordal.md",
          "Problem Data Updates" => "user_guide_data_updating.md",
          "Linear System Solvers" => "user_guide_linsolvers.md",
      ],
      #"Method" => "method.md",
      "Examples" => examples,
      "Citing Clarabel" => "citing.md",
      "Contributing" => "contributing.md",
      "API Reference" => Any[
          "Supported Cone Types" => "api_cone_types.md",
          "Solver Settings" => "api_settings.md",
          "Julia API" => "api_jl.md",
          "Rust API \u29C9" => "api_rs.md",
      ]
]

