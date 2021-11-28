types = {:acier, :combat, :dragon, :eau, :electrique, :fee, :feu, :glace, :insecte, :normal, :plante, :poison, :psy, :roche, :sol, :spectre, :tenebre, :vol}

defmodule PokemonTool do
  defp types_chart do
    %{
      acier:       %{acier: 0.5, combat: 2  , dragon: 0.5, eau: 1  , electrique: 1  , fee: 0.5, feu: 2  , glace: 0.5, insecte: 0.5, normal: 0.5, plante: 0.5, poison: 0  , psy: 0.5, roche: 0.5, sol: 2  , spectre: 1  , tenebre: 1  , vol: 0.5},
      combat:      %{acier: 1  , combat: 1  , dragon: 1  , eau: 1  , electrique: 1  , fee: 2  , feu: 1  , glace: 1  , insecte: 0.5, normal: 1  , plante: 1  , poison: 1  , psy: 2  , roche: 0.5, sol: 1  , spectre: 1  , tenebre: 0.5, vol: 2  },
      dragon:      %{acier: 1  , combat: 1  , dragon: 2  , eau: 0.5, electrique: 0.5, fee: 2  , feu: 0.5, glace: 2  , insecte: 1  , normal: 1  , plante: 0.5, poison: 1  , psy: 1  , roche: 1  , sol: 1  , spectre: 1  , tenebre: 1  , vol: 1  },
      eau:         %{acier: 0.5, combat: 1  , dragon: 1  , eau: 0.5, electrique: 2  , fee: 1  , feu: 0.5, glace: 0.5, insecte: 1  , normal: 1  , plante: 2  , poison: 1  , psy: 1  , roche: 1  , sol: 1  , spectre: 1  , tenebre: 1  , vol: 1  },
      electrique:  %{acier: 0.5, combat: 1  , dragon: 1  , eau: 1  , electrique: 0.5, fee: 1  , feu: 1  , glace: 1  , insecte: 1  , normal: 1  , plante: 1  , poison: 1  , psy: 1  , roche: 1  , sol: 2  , spectre: 1  , tenebre: 1  , vol: 0.5},
      fee:         %{acier: 2  , combat: 0.5, dragon: 0  , eau: 1  , electrique: 1  , fee: 1  , feu: 1  , glace: 1  , insecte: 0.5, normal: 1  , plante: 1  , poison: 2  , psy: 1  , roche: 1  , sol: 1  , spectre: 1  , tenebre: 0.5, vol: 1  },
      feu:         %{acier: 0.5, combat: 1  , dragon: 1  , eau: 2  , electrique: 1  , fee: 0.5, feu: 0.5, glace: 0.5, insecte: 0.5, normal: 1  , plante: 0.5, poison: 1  , psy: 1  , roche: 2  , sol: 2  , spectre: 1  , tenebre: 1  , vol: 1  },
      glace:       %{acier: 2  , combat: 2  , dragon: 1  , eau: 1  , electrique: 1  , fee: 1  , feu: 2  , glace: 0.5, insecte: 1  , normal: 1  , plante: 1  , poison: 1  , psy: 1  , roche: 2  , sol: 1  , spectre: 1  , tenebre: 1  , vol: 1  },
      insecte:     %{acier: 1  , combat: 0.5, dragon: 1  , eau: 1  , electrique: 1  , fee: 1  , feu: 2  , glace: 1  , insecte: 1  , normal: 1  , plante: 0.5, poison: 1  , psy: 1  , roche: 2  , sol: 0.5, spectre: 1  , tenebre: 1  , vol: 2  },
      normal:      %{acier: 1  , combat: 2  , dragon: 1  , eau: 1  , electrique: 1  , fee: 1  , feu: 1  , glace: 1  , insecte: 1  , normal: 1  , plante: 1  , poison: 1  , psy: 1  , roche: 1  , sol: 1  , spectre: 0  , tenebre: 1  , vol: 1  },
      plante:      %{acier: 1  , combat: 1  , dragon: 1  , eau: 0.5, electrique: 0.5, fee: 1  , feu: 2  , glace: 2  , insecte: 2  , normal: 1  , plante: 0.5, poison: 2  , psy: 1  , roche: 1  , sol: 0.5, spectre: 1  , tenebre: 1  , vol: 2  },
      poison:      %{acier: 1  , combat: 0.5, dragon: 1  , eau: 1  , electrique: 1  , fee: 0.5, feu: 1  , glace: 1  , insecte: 0.5, normal: 1  , plante: 0.5, poison: 0.5, psy: 2  , roche: 1  , sol: 2  , spectre: 1  , tenebre: 1  , vol: 1  },
      psy:         %{acier: 1  , combat: 0.5, dragon: 1  , eau: 1  , electrique: 1  , fee: 1  , feu: 1  , glace: 1  , insecte: 2  , normal: 1  , plante: 1  , poison: 1  , psy: 0.5, roche: 1  , sol: 1  , spectre: 2  , tenebre: 2  , vol: 1  },
      roche:       %{acier: 2  , combat: 2  , dragon: 1  , eau: 2  , electrique: 1  , fee: 1  , feu: 0.5, glace: 1  , insecte: 1  , normal: 0.5, plante: 2  , poison: 0.5, psy: 1  , roche: 1  , sol: 2  , spectre: 1  , tenebre: 1  , vol: 0.5},
      sol:         %{acier: 1  , combat: 1  , dragon: 1  , eau: 2  , electrique: 0  , fee: 1  , feu: 1  , glace: 2  , insecte: 1  , normal: 1  , plante: 2  , poison: 0.5, psy: 1  , roche: 0.5, sol: 1  , spectre: 1  , tenebre: 1  , vol: 1  },
      spectre:     %{acier: 1  , combat: 0  , dragon: 1  , eau: 1  , electrique: 1  , fee: 1  , feu: 1  , glace: 1  , insecte: 0.5, normal: 0  , plante: 1  , poison: 0.5, psy: 1  , roche: 1  , sol: 1  , spectre: 2  , tenebre: 2  , vol: 1  },
      tenebre:     %{acier: 1  , combat: 2  , dragon: 1  , eau: 1  , electrique: 1  , fee: 2  , feu: 1  , glace: 1  , insecte: 2  , normal: 1  , plante: 1  , poison: 1  , psy: 0  , roche: 1  , sol: 1  , spectre: 0.5, tenebre: 0.5, vol: 1  },
      vol:         %{acier: 1  , combat: 0.5, dragon: 1  , eau: 1  , electrique: 2  , fee: 1  , feu: 1  , glace: 2  , insecte: 0.5, normal: 1  , plante: 0.5, poison: 1  , psy: 1  , roche: 2  , sol: 0  , spectre: 1  , tenebre: 1  , vol: 1  }
    }
  end
  def effectiveness(attackType, defenseType), do: types_chart()[defenseType][attackType]
  def type_sensitivity(type1), do: types_chart()[type1]
  def type_sensitivity(type1, type2), do: types_chart()[type1] |> Enum.map(fn {type, coef} -> {type, coef*types_chart()[type2][type]} end)
  def type_weekness(type1), do: type_sensitivity(type1) |> Enum.filter(fn {_, coef} ->  coef>=2 end)
  def type_weekness(type1, type2), do: type_sensitivity(type1, type2) |> Enum.filter(fn {_, coef} ->  coef>=2 end)
  def type_resistance(type1), do: type_sensitivity(type1) |> Enum.filter(fn {_, coef} ->  coef<1 end)
  def type_resistance(type1, type2), do: type_sensitivity(type1, type2) |> Enum.filter(fn {_, coef} ->  coef<1 end)
end

IO.inspect(PokemonTool.type_resistance(:sol, :acier))
