defmodule OmiseGo.ParentChildTest do
  use OmiseGo.DataCase

  alias OmiseGo.ParentChild

  describe "parent_child" do
    @valid_arg %{
      "0" => [
        %{"children" => [], "id" => 10, "level" => 0, "parent_id" => nil, "title" => "House"}
      ],
      "1" => [
        %{"children" => [], "id" => 12, "level" => 1, "parent_id" => 10, "title" => "Red Roof"},
        %{"children" => [], "id" => 18, "level" => 1, "parent_id" => 10, "title" => "Blue Roof"},
        %{"children" => [], "id" => 13, "level" => 1, "parent_id" => 10, "title" => "Wall"}
      ],
      "2" => [
        %{
          "children" => [],
          "id" => 17,
          "level" => 2,
          "parent_id" => 12,
          "title" => "Blue Window"
        },
        %{"children" => [], "id" => 16, "level" => 2, "parent_id" => 13, "title" => "Door"},
        %{"children" => [], "id" => 15, "level" => 2, "parent_id" => 12, "title" => "Red Window"}
      ]
    }

    @valid_resp [
      %{
        "children" => [
          %{
            "children" => [
              %{
                "children" => [],
                "id" => 16,
                "level" => 2,
                "parent_id" => 13,
                "title" => "Door"
              }
            ],
            "id" => 13,
            "level" => 1,
            "parent_id" => 10,
            "title" => "Wall"
          },
          %{
            "children" => [],
            "id" => 18,
            "level" => 1,
            "parent_id" => 10,
            "title" => "Blue Roof"
          },
          %{
            "children" => [
              %{
                "children" => [],
                "id" => 15,
                "level" => 2,
                "parent_id" => 12,
                "title" => "Red Window"
              },
              %{
                "children" => [],
                "id" => 17,
                "level" => 2,
                "parent_id" => 12,
                "title" => "Blue Window"
              }
            ],
            "id" => 12,
            "level" => 1,
            "parent_id" => 10,
            "title" => "Red Roof"
          }
        ],
        "id" => 10,
        "level" => 0,
        "parent_id" => nil,
        "title" => "House"
      }
    ]

    test "should format_code properly" do
      data = OmiseGo.ParentChild.format_data(@valid_arg)
      assert data == @valid_resp
    end
  end
end
