defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count([h | res]), do: [h + 1 | res]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?(list) when hd(list) == 0, do: true
  def has_day_without_birds?(list), do: has_day_without_birds?(tl(list))

  def total([head | tail]), do: head + total(tail)
  def total([]), do: 0

  def busy_days([]), do: 0
  def busy_days([h | t]) when h >= 5, do: 1 + busy_days(t)
  def busy_days(list), do: busy_days(tl(list))
end
