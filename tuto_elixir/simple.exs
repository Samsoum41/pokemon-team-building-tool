types = {:acier, :combat, :dragon, :eau, :electrique, :feu, :glace, :insecte, :normal, :plante, :poison, :psy, :roche, :sol, :spectre, :tenebre, :vol}

defmodule PokemonTool do
  def get_types([head|tail]) do
    IO.puts(head)
    get_types(tail)
  end
  def get_types([]) do

  end
end

PokemonTool.get_types(Tuple.to_list(types))
