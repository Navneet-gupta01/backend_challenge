defmodule OmiseGo.ParentChild do
  def format_data(attrs \\ %{}) do
    attrs
    |> Map.keys()
    # Sort by level, We will build tree from downwards to avoid traveling again and again from root to parent to insert a nested children
    |> Enum.sort(&(String.to_integer(&1) > String.to_integer(&2)))
    |> List.foldl(%{}, fn level, map ->
      attrs[level]
      |> Enum.reduce(map, fn x, parent_map ->
        x = Map.put(x, "children", Map.get(parent_map, x["id"], []))
        Map.update(parent_map, x["parent_id"], [x], fn xs -> [x | xs] end)
      end)
    end)
    |> Map.get(nil)
  end
end
