defmodule Phonebook.Schedule do
  @moduledoc """
  The Schedule context.
  """

  import Ecto.Query, warn: false
  alias Phonebook.Repo

  alias Phonebook.Schedule.Phonebooks

  @doc """
  Returns the list of contacts.

  ## Examples

      iex> list_contacts()
      [%Phonebooks{}, ...]

  """
  def list_contacts do
    Repo.all(Phonebooks)
  end

  @doc """
  Gets a single phonebooks.

  Raises `Ecto.NoResultsError` if the Phonebooks does not exist.

  ## Examples

      iex> get_phonebooks!(123)
      %Phonebooks{}

      iex> get_phonebooks!(456)
      ** (Ecto.NoResultsError)

  """
  def get_phonebooks!(id), do: Repo.get!(Phonebooks, id)

  @doc """
  Creates a phonebooks.

  ## Examples

      iex> create_phonebooks(%{field: value})
      {:ok, %Phonebooks{}}

      iex> create_phonebooks(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_phonebooks(attrs \\ %{}) do
    %Phonebooks{}
    |> Phonebooks.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a phonebooks.

  ## Examples

      iex> update_phonebooks(phonebooks, %{field: new_value})
      {:ok, %Phonebooks{}}

      iex> update_phonebooks(phonebooks, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_phonebooks(%Phonebooks{} = phonebooks, attrs) do
    phonebooks
    |> Phonebooks.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a phonebooks.

  ## Examples

      iex> delete_phonebooks(phonebooks)
      {:ok, %Phonebooks{}}

      iex> delete_phonebooks(phonebooks)
      {:error, %Ecto.Changeset{}}

  """
  def delete_phonebooks(%Phonebooks{} = phonebooks) do
    Repo.delete(phonebooks)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking phonebooks changes.

  ## Examples

      iex> change_phonebooks(phonebooks)
      %Ecto.Changeset{data: %Phonebooks{}}

  """
  def change_phonebooks(%Phonebooks{} = phonebooks, attrs \\ %{}) do
    Phonebooks.changeset(phonebooks, attrs)
  end
end
