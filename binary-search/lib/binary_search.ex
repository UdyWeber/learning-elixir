defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    case do_search(0, tuple_size(numbers) - 1, numbers, key) do
      nil -> :not_found
      val -> {:ok, val}
    end
  end

  defp do_search(l, r, _, _) when l > r, do: nil

  defp do_search(l, r, numbers, key) do
    midle = div(l + r, 2)
    val = elem(numbers, midle)

    cond do
      val > key -> do_search(l, midle - 1, numbers, key)
      val < key -> do_search(midle + 1, r, numbers, key)
      val == key -> midle
    end
  end
end
