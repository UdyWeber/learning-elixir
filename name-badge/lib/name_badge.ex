defmodule NameBadge do
  def print(id, name, department) do
    name
    |> (&if(id != nil, do: "[#{id}] - " <> &1, else: &1)).()
    |> (&if(department != nil,
          do: &1 <> " - #{String.upcase(department)}",
          else: &1 <> " - OWNER"
        )).()
  end
end
