defmodule Phonebook.ScheduleTest do
  use Phonebook.DataCase

  alias Phonebook.Schedule

  describe "contacts" do
    alias Phonebook.Schedule.Phonebooks

    @valid_attrs %{name: "some name", telephone: 42}
    @update_attrs %{name: "some updated name", telephone: 43}
    @invalid_attrs %{name: nil, telephone: nil}

    def phonebooks_fixture(attrs \\ %{}) do
      {:ok, phonebooks} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_phonebooks()

      phonebooks
    end

    test "list_contacts/0 returns all contacts" do
      phonebooks = phonebooks_fixture()
      assert Schedule.list_contacts() == [phonebooks]
    end

    test "get_phonebooks!/1 returns the phonebooks with given id" do
      phonebooks = phonebooks_fixture()
      assert Schedule.get_phonebooks!(phonebooks.id) == phonebooks
    end

    test "create_phonebooks/1 with valid data creates a phonebooks" do
      assert {:ok, %Phonebooks{} = phonebooks} = Schedule.create_phonebooks(@valid_attrs)
      assert phonebooks.name == "some name"
      assert phonebooks.telephone == 42
    end

    test "create_phonebooks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_phonebooks(@invalid_attrs)
    end

    test "update_phonebooks/2 with valid data updates the phonebooks" do
      phonebooks = phonebooks_fixture()
      assert {:ok, %Phonebooks{} = phonebooks} = Schedule.update_phonebooks(phonebooks, @update_attrs)
      assert phonebooks.name == "some updated name"
      assert phonebooks.telephone == 43
    end

    test "update_phonebooks/2 with invalid data returns error changeset" do
      phonebooks = phonebooks_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_phonebooks(phonebooks, @invalid_attrs)
      assert phonebooks == Schedule.get_phonebooks!(phonebooks.id)
    end

    test "delete_phonebooks/1 deletes the phonebooks" do
      phonebooks = phonebooks_fixture()
      assert {:ok, %Phonebooks{}} = Schedule.delete_phonebooks(phonebooks)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_phonebooks!(phonebooks.id) end
    end

    test "change_phonebooks/1 returns a phonebooks changeset" do
      phonebooks = phonebooks_fixture()
      assert %Ecto.Changeset{} = Schedule.change_phonebooks(phonebooks)
    end
  end
end
