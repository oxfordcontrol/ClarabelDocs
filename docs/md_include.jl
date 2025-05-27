# A function for including code blocks into markdown files.   The
# @eval block puts this function into the Clarabel module so that
# it will be in scope when called from within a Markdown @eval block

@eval Documenter begin

    using Markdown, Documenter

    function is_url(s::String)
        url_pattern = r"^https?://[^\s/$.?#].[^\s]*$"i
        return occursin(url_pattern, s)
    end

    function md_include(;source = Nothing,
                         language = :julia,
                         plaintext = false)

        if !isnothing(source) && !is_url(source)
            root   = Documenter.find_root_parent(Documenter.is_git_repo_root,".")
            source = joinpath(root,source)
        end

        @info "md_include importing from:" source

        # plaintext = true just drops the textfile in place
        if(plaintext)
            Markdown.parse("""
                $(read(source,String))
                """
            )

        # otherwise insert it as a code block
        else
            Markdown.parse("""
                ```$(language)
                $(read(source,String))
                ```
                """
            )
        end  #end if

    end #end function

end # end @eval






