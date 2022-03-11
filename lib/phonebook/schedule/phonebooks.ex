defmodule Phonebook.Schedule.Phonebooks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :name, :string
    field :telephone, :integer

    timestamps()
  end

  @doc false
  def changeset(phonebooks, attrs) do
    phonebooks
    |> cast(attrs, [:name, :telephone])
    |> validate_required([:name, :telephone])
  end
end
