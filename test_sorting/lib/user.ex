defmodule TestSorting.User do
  @enforce_keys [:name, :age]
  defstruct [:name, :age, email: nil]
  @type t :: %__MODULE__{name: String.t(), age: non_neg_integer, email: String.t() | nil}
end
