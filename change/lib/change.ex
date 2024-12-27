defmodule Change do
  @error_msg "cannot change"

  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(coins, target) when not is_integer(target) or target <= 0 or hd(coins) > target,
    do: {:error, @error_msg}

  def generate(coins, target) do
    {:ok, generate(Enum.reverse(coins), target, [])}
  end

  # Base cases
  defp generate([], _target, acc), do: acc
  defp generate(_, target, acc) when target <= 0, do: acc

  # Logic 
  defp generate([h | t], target, acc) when h > target, do: generate(t, target, acc)
  defp generate([h | t], target, acc), do: generate([h | t], target - h, [h | acc])
end
