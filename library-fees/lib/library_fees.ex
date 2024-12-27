defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    Time.compare(NaiveDateTime.to_time(datetime), ~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
    NaiveDateTime.to_date(checkout_datetime)
    |> (&if(before_noon?(checkout_datetime), do: Date.add(&1, 28), else: Date.add(&1, 29))).()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    Date.diff(actual_return_datetime, planned_return_date)
    |> (&if(&1 > 0, do: &1, else: 0)).()
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    days_late(return_date(datetime_from_string(checkout)), datetime_from_string(return))
    |> Kernel.*(rate)
    |> (&if(monday?(datetime_from_string(return)), do: Float.floor(&1 / 2), else: &1)).()
  end
end
