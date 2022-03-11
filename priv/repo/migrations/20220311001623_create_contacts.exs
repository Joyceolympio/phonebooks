defmodule Phonebook.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :string
      add :telephone, :integer

      timestamps()
    end

  end
end
