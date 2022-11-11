defmodule Exla101Test do
  use ExUnit.Case
  @moduletag timeout: :infinity

  # doctest Exla101

  test "add" do
    assert Exla101.add() == Nx.tensor([[2,3,4],[6,7,8]])
  end

  test "tensor_dot 200" do
    :timer.tc(Exla101, :tensor_dot, [200])
  end

  test "dot" do
    func = fn dim ->
      a = Nx.eye({dim, dim})
      b = Nx.eye({dim, dim})
      c = Nx.dot(a, b)
      IO.inspect(c)
    end

    measure_ecec_time = fn dim ->
      {exec_time, _} = :timer.tc(func, [dim])
      exec_time / 1000
    end

    exec_time = measure_ecec_time.(2000*5)
    IO.inspect(exec_time, label: "exec time")
  end
end
