class SectorCreator
  def self.create(name)
    sector = Sector.find_or_initialize_by(name: name)
    sector.save!
    sector
  end

  def self.parent_sector(row)
    sector = Sector.where(name: row['Sector']).first
    p_sector = Sector.where(name: row['Parent sector']).first
    sector.parent_sector = p_sector
    sector.save!
  end

  def self.create_list(list)
    sectors = {}
    list.each do |name|
      sector = create(name)
      sectors[name] = sector.id
    end
    sectors
  end
end
