defmodule BasketballWebsite do
  defp extract(data, list) when not is_map(data) and list != [], do: nil
  defp extract(data, []), do: data
  defp extract(data, [h | l]), do: extract(data[h], l)
  def extract_from_path(data, path), do: extract(data, String.split(path, "."))

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
