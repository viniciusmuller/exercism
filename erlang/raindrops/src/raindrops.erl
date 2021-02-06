-module(raindrops).

-export([convert/1]).


convert(Number) ->
  Items = [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]

  Result = lists:foldl(fun ({Item, Sound}, Acc) ->
      if Number rem Item =:= 0 -> Acc ++ Sound;
      true -> Acc
      end
    end
  , "", Items)

  case Result of
    [] -> integer_to_list(Number)
    _ -> Result
  end
.
