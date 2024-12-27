defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn m ->
      Map.update!(m, :name, fn name ->
        String.replace(name, old_word, new_word)
      end)
    end)
  end

  def increase_quantity(item, count) do
    %{
      item
      | quantity_by_size:
          Map.new(item.quantity_by_size, fn {size, qtd} -> {size, qtd + count} end)
    }
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_name, qtd}, acc ->
      acc + qtd
    end)
  end
end
