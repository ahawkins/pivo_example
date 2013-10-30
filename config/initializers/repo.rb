class Chassis::Repo
  def backend
    @backend
  end
end

Chassis::Repo.backend = Chassis::Repo::InMemoryAdapter.new
Chassis::Repo.backend.initialize_storage!
