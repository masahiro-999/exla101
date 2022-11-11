defmodule Exla101 do

  import Nx.Defn

  defn add do
    a = Nx.tensor([[1,2,3],[4,5,6]])
    b = Nx.tensor([[1,1,1],[2,2,2]])
    a + b
  end

  # memo
  # iex(5)> :timer.tc(Exla101, :tensor_dot, [200])
  # iex(3)> :timer.tc(Exla101, :tensor_dot, [10000])

  def tensor_dot(tensor_size) do
    a = Nx.eye({tensor_size, tensor_size})
    b = Nx.eye({tensor_size, tensor_size})
    IO.puts("--- strt ---")
    c = Nx.dot(a,b)
    IO.puts("--- end ---")
    IO.inspect(c, label: "c")
  end

  defn poly(x) do
    3 * Nx.power(x, 2) + 2 * x + 1
  end

  defn poly_slope_at(x) do
    grad(&poly/1).(x)
  end

  # memo
  # :timer.tc(Exla101, :exec_time_test_defn, [10000])
  def exec_time_test_defn(0), do: :ok

  def exec_time_test_defn(n) do
    poly_slope_at(2)
    exec_time_test_defn(n-1)
  end

end
