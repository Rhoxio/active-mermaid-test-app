require 'rails_helper'

describe "model relationships" do 

  describe 'star' do 
    it "will work with a star" do 
      star = Star.create(name: "Sol", color: "yellow", description: "Our Sun")
      galaxy = Galaxy.create(diameter_in_light_years: 10000)
      cluster = Cluster.create(total_galaxies: 999999)
      star.galaxy = galaxy
      star.cluster = cluster
      expect(star.galaxy).to eq(galaxy)
      expect(star.cluster). to eq(cluster)
    end
  end

  describe 'galaxy' do 
    it "will work with a galaxy" do 
      galaxy = Galaxy.create(diameter_in_light_years: 10000)
      star = Star.create(name: "Sol", color: "yellow", description: "Our Sun")
      cluster = Cluster.create(total_galaxies: 999999)
      galaxy.cluster = cluster
      galaxy.stars << star
      expect(galaxy.stars[0]).to eq(star)
      expect(galaxy.cluster).to eq(cluster)
    end
  end


  describe "system" do 
    it "will error out of a system is made without a star" do 
      sys = System.create(name: "bunk")
      expect{sys.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "will create the system" do 
      planet = Planet.create(planet_type: 'terran', population: 1)
      sys = System.create(name: "Our Solar System")
      star = Star.create(name: "Sol", color: "yellow", description: "Our Sun")
      sys.star = star
      sys.planets << planet
      expect(sys.save).to eq(true)
      expect(sys.planets[0]).to eq(planet)
      expect(sys.star).to eq(star)
    end
  end

  describe "cluster" do 
    it "will create a cluster with all associations" do 
      cluster = Cluster.create(total_galaxies: 999999)
      galaxy = Galaxy.create(diameter_in_light_years: 10000)
      planet = Planet.create(planet_type: 'terran', population: 1)
      sys = System.create(name: "Our Solar System")
      sys.planets << planet
      star = Star.create(name: "Sol", color: "yellow", description: "Our Sun")

      cluster.stars << star
      cluster.galaxies << galaxy
      cluster.planets << planet

      expect(cluster.save).to eq(true)
    end
  end

  describe "planet" do 
    it "will error out if a system is not present" do 
      planet = Planet.create(planet_type: 'terran', population: 1)
      expect{planet.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "will save without a cluster" do 
      planet = Planet.create(planet_type: 'terran', population: 1)
      sys = System.create(name: "Our Solar System")
      sys.planets << planet
      expect(planet.save!).to eq(true)
    end

    it "will associate with a cluster" do 
      planet = Planet.create(planet_type: 'terran', population: 1)
      sys = System.create(name: "Our Solar System")
      sys.planets << planet
      cluster = Cluster.create(total_galaxies: 999999)
      planet.cluster = cluster
      expect(planet.cluster).to eq(cluster)
    end
  end

end