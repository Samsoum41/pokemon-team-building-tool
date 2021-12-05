defmodule Pokemon do
  @enforce_keys [:name, :type1]
  defstruct [:name, :type1, :type2, :attack1, :attack2, :attack3, :attack4]
end

defmodule PokemonTool do
  defp types do
    [
      :acier,
      :combat,
      :dragon,
      :eau,
      :electrique,
      :fee,
      :feu,
      :glace,
      :insecte,
      :normal,
      :plante,
      :poison,
      :psy,
      :roche,
      :sol,
      :spectre,
      :tenebre,
      :vol
    ]
  end

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

  def max(a,b)                                                 when a>b,                           do: a
  def max(_,b),                                                                                    do: b

  def effectiveness(%{type1: type1, type2: type2} = pokemon)    when pokemon.__struct__ == Pokemon, do: effectiveness(type1,type2)
  def effectiveness(%{type1: type1} = pokemon)                  when pokemon.__struct__ == Pokemon, do: effectiveness(type1)
  def effectiveness(attackType, defenseType),                                                       do: types_chart()[defenseType][attackType]

  def type_sensitivity(%{type1: type1, type2: type2} = pokemon) when pokemon.__struct__ == Pokemon, do: type_sensitivity(type1,type2)
  def type_sensitivity(%{type1: type1} = pokemon)               when pokemon.__struct__ == Pokemon, do: type_sensitivity(type1)
  def type_sensitivity(type1),                                                                      do: types_chart()[type1]
  def type_sensitivity(type1, type2),                                                               do: types_chart()[type1] |> Enum.map(fn {type, coef} -> {type, coef*types_chart()[type2][type]} end)

  def strong_against(%{type1: type1} = pokemon)                 when pokemon.__struct__ == Pokemon, do: strong_against(type1)
  def strong_against(%{type1: type1, type2: type2} = pokemon)   when pokemon.__struct__ == Pokemon, do: strong_against(type1,type2)
  def strong_against(type1)                                                                         do
    weakTypes = types()
      |> Enum.filter(fn defenseType ->  effectiveness(type1, defenseType)>=2 end)
    coefs = weakTypes
      |> Enum.map(&(effectiveness(type1, &1)))
    Enum.zip(weakTypes, coefs)
      |> Enum.into(%{})
  end
  def strong_against(type1, type2)                                                                  do
    weakTypes = types()
      |> Enum.filter(fn defenseType ->  effectiveness(type1, defenseType)>=2 or effectiveness(type2, defenseType)>=2 end)
    coefs = weakTypes
      |> Enum.map(&(PokemonTool.max(effectiveness(type1, &1), effectiveness(type2, &1))))
    Enum.zip(weakTypes, coefs)
      |> Enum.into(%{})
  end

  def type_weekness(%{type1: type1, type2: type2} = pokemon)    when pokemon.__struct__ == Pokemon, do: type_weekness(type1,type2)
  def type_weekness(%Pokemon{} = pokemon)                  when pokemon.type2 != nil, do: IO.inspect(type_weekness(type1))
  def type_weekness(type1),                                                                         do: type_sensitivity(type1) |> Enum.filter(fn {_, coef} ->  coef>=2 end)
  def type_weekness(type1, type2),                                                                  do: type_sensitivity(type1, type2) |> Enum.filter(fn {_, coef} ->  coef>=2 end)

  def type_resistance(%{type1: type1, type2: type2} = pokemon)  when pokemon.__struct__ == Pokemon, do: type_resistance(type1,type2)
  def type_resistance(%{type1: type1} = pokemon)                when pokemon.__struct__ == Pokemon, do: type_resistance(type1)
  def type_resistance(type1),                                                                       do: type_sensitivity(type1) |> Enum.filter(fn {_, coef} ->  coef<1 end)
  def type_resistance(type1, type2),                                                                do: type_sensitivity(type1, type2) |> Enum.filter(fn {_, coef} ->  coef<1 end)

  def team_weaknesses(team) do
    strong_types = team
      |> Enum.map(fn pokemon -> strong_against(pokemon) end)
      |> Enum.reduce(%{}, fn dic, acc -> Map.merge(dic, acc) end)
      |> IO.inspect()
    types()
      |> Enum.filter(&(!Map.has_key?(strong_types, &1)))
      |> IO.inspect()

  end
end


defmodule Main do
  def main do
    pokemon1 = %Pokemon{name: "Etouraptor", type1: :normal, type2: :vol}
    pokemon2 = %Pokemon{name: "Leviator", type1: :eau, type2: :vol}
    pokemon3 = %Pokemon{name: "Dracaufeu", type1: :feu, type2: :vol}
    pokemon4 = %Pokemon{name: "Tortank", type1: :eau}
    pokemon5 = %Pokemon{name: "Ronflex", type1: :normal}
    pokemon6 = %Pokemon{name: "Roserade", type1: :plante, type2: :poison}

    equipe = [pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6]
    PokemonTool.type_weekness(pokemon4)
    #PokemonTool.team_weaknesses([pokemon4])
  end
end


Main.main
