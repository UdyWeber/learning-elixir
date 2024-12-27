defmodule Username do
  @spec get_char(char()) :: charlist()
  defp get_char(bchar) do
    case bchar do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      c when (c >= ?a and c <= ?z) or c == ?_ -> [c]
      _ -> []
    end
  end

  @spec sanitize(charlist()) :: charlist()
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    username
    |> Enum.flat_map(&get_char/1)
  end
end
