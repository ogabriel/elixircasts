defmodule Theater.PeopleTest do
  use Theater.DataCase

  alias Theater.People

  describe "actors" do
    alias Theater.People.Actor

    @valid_attrs %{likes: "some likes", name: "some name"}
    @update_attrs %{likes: "some updated likes", name: "some updated name"}
    @invalid_attrs %{likes: nil, name: nil}

    def actor_fixture(attrs \\ %{}) do
      {:ok, actor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> People.create_actor()

      actor
    end

    test "list_actors/0 returns all actors" do
      actor = actor_fixture()
      assert People.list_actors() == [actor]
    end

    test "get_actor!/1 returns the actor with given id" do
      actor = actor_fixture()
      assert People.get_actor!(actor.id) == actor
    end

    test "create_actor/1 with valid data creates a actor" do
      assert {:ok, %Actor{} = actor} = People.create_actor(@valid_attrs)
      assert actor.likes == "some likes"
      assert actor.name == "some name"
    end

    test "create_actor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_actor(@invalid_attrs)
    end

    test "update_actor/2 with valid data updates the actor" do
      actor = actor_fixture()
      assert {:ok, %Actor{} = actor} = People.update_actor(actor, @update_attrs)
      assert actor.likes == "some updated likes"
      assert actor.name == "some updated name"
    end

    test "update_actor/2 with invalid data returns error changeset" do
      actor = actor_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_actor(actor, @invalid_attrs)
      assert actor == People.get_actor!(actor.id)
    end

    test "delete_actor/1 deletes the actor" do
      actor = actor_fixture()
      assert {:ok, %Actor{}} = People.delete_actor(actor)
      assert_raise Ecto.NoResultsError, fn -> People.get_actor!(actor.id) end
    end

    test "change_actor/1 returns a actor changeset" do
      actor = actor_fixture()
      assert %Ecto.Changeset{} = People.change_actor(actor)
    end
  end
end
