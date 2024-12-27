defmodule TakeANumber do
  def start() do
    spawn(fn -> handle_messages(0) end)
  end

  defp handle_messages(state) do
    receive do
      {:report_state, original_pid} ->
        send(original_pid, state)
        handle_messages(state)

      {:take_a_number, original_pid} ->
        send(original_pid, state + 1)
        handle_messages(state + 1)

      :stop ->
        IO.puts("Stoping the machine")
        exit(:kill)

      _ ->
        handle_messages(state)
    end
  end
end
