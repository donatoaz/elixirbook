:io.format("~.2f\n", [3.6789])
IO.puts(System.get_env("PATH"))
IO.puts(Path.extname("/tmp/teste.txt"))
IO.puts(System.cwd())

import Poison, only: [decode!: 1]
IO.puts(Poison.decode!(~s({"name": "Devin Torres", "age": 27})))
