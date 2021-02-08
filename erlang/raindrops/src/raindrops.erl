-module(raindrops).

-export([convert/1]).


convert(Number) ->
  Items = [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}],

  Result = lists:foldl(
    fun (Tuple, Acc) ->
      make_sound(Tuple, Acc, Number) end,
    "",
    Items
  ),

  case Result of
    [] -> integer_to_list(Number);
    _ -> Result
  end
.

make_sound({Item, Sound}, Acc, Number)
  when Number rem Item =:= 0
  ->
    Acc ++ Sound
;
make_sound(_, Acc, _) ->
  Acc
.
