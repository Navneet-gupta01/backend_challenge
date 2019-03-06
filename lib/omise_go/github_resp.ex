defmodule OmiseGo.GithubResp do
  defstruct repos: [],
            page: 0,
            per_page: 10,
            totalItems: 0

  use ExConstructor
end
