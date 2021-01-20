defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(markdown_source) do
    markdown_source
    |> String.split("\n")
    |> Enum.map_join(&process_markdown/1)
    |> patch()
  end

  defp process_markdown(<<"#">> <> _line = line) do
    line
    |> parse_header_size()
    |> enclose_with_header_tag()
  end

  defp process_markdown(<<"*">> <> _line = line) do
    parse_list_md_level(line)
  end

  defp process_markdown(line) do
    line
    |> String.split()
    |> enclose_with_paragraph_tag()
  end

  defp parse_header_size(hwt) do
    [header | content] = String.split(hwt)

    header_size = String.length(header)
    line_content = Enum.join(content, " ")

    {header_size, line_content}
  end

  defp parse_list_md_level(list) do
    list_content =
      list
      |> String.trim_leading("*")
      |> String.split()

    "<li>#{join_tokens_with_tags(list_content)}</li>"
  end

  defp enclose_with_header_tag({size, content}) do
    "<h#{size}>#{content}</h#{size}>"
  end

  defp enclose_with_paragraph_tag(tokens) do
    "<p>#{join_tokens_with_tags(tokens)}</p>"
  end

  defp join_tokens_with_tags(tokens) do
    Enum.map_join(tokens, " ", &parse_token_tags/1)
  end

  defp parse_token_tags(token) do
    token
    |> replace_prefix_md()
    |> replace_suffix_md()
  end

  defp replace_prefix_md(token) do
    cond do
      String.starts_with?(token, "__") ->
        String.replace(token, ~r/^__/, "<strong>")

      String.starts_with?(token, "_") ->
        String.replace(token, ~r/^_/, "<em>")

      true ->
        token
    end
  end

  defp replace_suffix_md(token) do
    cond do
      String.ends_with?(token, "__") ->
        String.replace(token, ~r/__$/, "</strong>")

      String.ends_with?(token, "_") ->
        String.replace(token, ~r/_$/, "</em>")

      true ->
        token
    end
  end

  defp patch(markdown_list) do
    markdown_list
    |> String.replace("<li>", "<ul>" <> "<li>", global: false)
    |> String.replace_suffix("</li>", "</li>" <> "</ul>")
  end
end
