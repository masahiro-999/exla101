Mix.install([
  {:nx, "~> 0.3.0"},
  {:exla, "~> 0.3.0"},
],
config: [
          nx: [
            default_backend: EXLA.Backend,
            default_defn_options: [compiler: EXLA],
          ]
        ],
system_env: [
    XLA_TARGET: "cuda111"
  ],
  # XLA_TARGETの変更で、exlaを再コンパイルしたい時はtrueにする
  force: true
)
Nx.add(Nx.tensor([1]), Nx.tensor([1]))
