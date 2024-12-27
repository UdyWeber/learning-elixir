defmodule TestSorting do
  alias TestSorting.User

  @moduledoc """
  Documentation for `TestSorting`.
  """
  @doc """
  Filters the list of users to return only those who are adults (age >= 18).

  ## Examples

      iex> users = [
      ...>   %TestSorting.User{name: "Alice", age: 20},
      ...>   %TestSorting.User{name: "Bob", age: 17},
      ...>   %TestSorting.User{name: "Charlie", age: 22}
      ...> ]
      iex> TestSorting.get_adults(users)
      [%TestSorting.User{name: "Alice", age: 20, email: nil},
       %TestSorting.User{name: "Charlie", age: 22, email: nil}]

      iex> empty_users = []
      iex> TestSorting.get_adults(empty_users)
      []

  """

  @spec get_adults(list(User.t())) :: list(User.t())
  def get_adults([%User{age: age} = h | t]) when age >= 18, do: [h | get_adults(t)]
  def get_adults([]), do: []
  def get_adults([_ | t]), do: get_adults(t)
end
