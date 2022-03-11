defmodule PhonebookWeb.PhonebooksController do
  use PhonebookWeb, :controller

  alias Phonebook.Schedule
  alias Phonebook.Schedule.Phonebooks

  action_fallback PhonebookWeb.FallbackController

  def index(conn, _params) do
    contacts = Schedule.list_contacts()
    render(conn, "index.json", contacts: contacts)
  end

  def create(conn, %{"phonebooks" => phonebooks_params}) do
    with {:ok, %Phonebooks{} = phonebooks} <- Schedule.create_phonebooks(phonebooks_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.phonebooks_path(conn, :show, phonebooks))
      |> render("show.json", phonebooks: phonebooks)
    end
  end

  def show(conn, %{"id" => id}) do
    phonebooks = Schedule.get_phonebooks!(id)
    render(conn, "show.json", phonebooks: phonebooks)
  end

  def update(conn, %{"id" => id, "phonebooks" => phonebooks_params}) do
    phonebooks = Schedule.get_phonebooks!(id)

    with {:ok, %Phonebooks{} = phonebooks} <- Schedule.update_phonebooks(phonebooks, phonebooks_params) do
      render(conn, "show.json", phonebooks: phonebooks)
    end
  end

  def delete(conn, %{"id" => id}) do
    phonebooks = Schedule.get_phonebooks!(id)

    with {:ok, %Phonebooks{}} <- Schedule.delete_phonebooks(phonebooks) do
      send_resp(conn, :no_content, "")
    end
  end
end
