defmodule Teacher.AccoutsTest do
  use Teacher.DataCase

  alias Teacher.Accouts

  describe "users" do
    alias Teacher.Accouts.User

    @valid_attrs %{encrypted_password: "some encrypted_password", username: "some username"}
    @update_attrs %{encrypted_password: "some updated encrypted_password", username: "some updated username"}
    @invalid_attrs %{encrypted_password: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accouts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accouts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accouts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accouts.create_user(@valid_attrs)
      assert user.encrypted_password == "some encrypted_password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accouts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accouts.update_user(user, @update_attrs)
      assert user.encrypted_password == "some updated encrypted_password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accouts.update_user(user, @invalid_attrs)
      assert user == Accouts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accouts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accouts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accouts.change_user(user)
    end
  end
end
