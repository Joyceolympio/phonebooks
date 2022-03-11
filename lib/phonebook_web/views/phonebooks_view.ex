defmodule PhonebookWeb.PhonebooksView do
  use PhonebookWeb, :view
  alias PhonebookWeb.PhonebooksView

  def render("index.json", %{contacts: contacts}) do
    %{data: render_many(contacts, PhonebooksView, "phonebooks.json")}
  end

  def render("show.json", %{phonebooks: phonebooks}) do
    %{data: render_one(phonebooks, PhonebooksView, "phonebooks.json")}
  end

  def render("phonebooks.json", %{phonebooks: phonebooks}) do
    %{id: phonebooks.id,
      name: phonebooks.name,
      telephone: phonebooks.telephone}
  end
end
