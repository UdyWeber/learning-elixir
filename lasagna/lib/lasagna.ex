defmodule Lasagna do
  @time_to_prepare 2
  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven(), do: 40

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(n), do: expected_minutes_in_oven() - n

  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(l), do: l * @time_to_prepare
  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(l, n) do
    n + preparation_time_in_minutes(l)
  end

  # Please define the 'alarm/0' function
  def alarm(), do: "Ding!"
end
