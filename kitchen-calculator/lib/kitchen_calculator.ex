defmodule KitchenCalculator do
  @spec get_volume({atom, integer}) :: integer
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  @spec to_milliliter({atom, integer}) :: {atom, integer}
  def to_milliliter(volume_pair) when elem(volume_pair, 0) == :milliliter, do: volume_pair

  def to_milliliter(volume_pair) do
    vol =
      case volume_pair do
        {:cup, vol} -> vol * 240
        {:fluid_ounce, vol} -> vol * 30
        {:teaspoon, vol} -> vol * 5
        {:tablespoon, vol} -> vol * 15
      end

    {:milliliter, vol}
  end

  @spec from_milliliter({atom, integer}, atom) :: {atom, integer}
  def from_milliliter(volume_pair, unit) do
    vol = elem(volume_pair, 1)

    case unit do
      :cup -> {:cup, vol / 240}
      :fluid_ounce -> {:fluid_ounce, vol / 30}
      :teaspoon -> {:teaspoon, vol / 5}
      :tablespoon -> {:tablespoon, vol / 15}
      _ -> {:milliliter, vol}
    end
  end

  @spec convert({atom, integer}, atom) :: {atom, integer}
  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
