defmodule PhonebookWeb.PhonebooksControllerTest do
  use PhonebookWeb.ConnCase

  alias Phonebook.Schedule
  alias Phonebook.Schedule.Phonebooks

  @create_attrs %{
    name: "some name",
    telephone: 42
  }
  @update_attrs %{
    name: "some updated name",
    telephone: 43
  }
  @invalid_attrs %{name: nil, telephone: nil}

  def fixture(:phonebooks) do
    {:ok, phonebooks} = Schedule.create_phonebooks(@create_attrs)
    phonebooks
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all contacts", %{conn: conn} do
      conn = get(conn, Routes.phonebooks_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create phonebooks" do
    test "renders phonebooks when data is valid", %{conn: conn} do
      conn = post(conn, Routes.phonebooks_path(conn, :create), phonebooks: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.phonebooks_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "telephone" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.phonebooks_path(conn, :create), phonebooks: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update phonebooks" do
    setup [:create_phonebooks]

    test "renders phonebooks when data is valid", %{conn: conn, phonebooks: %Phonebooks{id: id} = phonebooks} do
      conn = put(conn, Routes.phonebooks_path(conn, :update, phonebooks), phonebooks: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.phonebooks_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "telephone" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, phonebooks: phonebooks} do
      conn = put(conn, Routes.phonebooks_path(conn, :update, phonebooks), phonebooks: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete phonebooks" do
    setup [:create_phonebooks]

    test "deletes chosen phonebooks", %{conn: conn, phonebooks: phonebooks} do
      conn = delete(conn, Routes.phonebooks_path(conn, :delete, phonebooks))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.phonebooks_path(conn, :show, phonebooks))
      end
    end
  end

  defp create_phonebooks(_) do
    phonebooks = fixture(:phonebooks)
    %{phonebooks: phonebooks}
  end
end
