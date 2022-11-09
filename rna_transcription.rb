#!/usr/bin/ruby
require 'benchmark'

module Complement
    class << self
        def of_dna(molecule)
            molecule = Molecule.new(molecule)
            molecule.is_dna? ? molecule.to_rna : ''
        end
    end
end

class Molecule
    def initialize(molecule)
        @molecule = molecule
    end

    def is_dna?
        @molecule.scan(/[^ATGC]/).empty?
    end

    def to_rna
        @molecule.tr('CGTA', 'GCAU')
    end
end

#puts Benchmark.measure { 1000000.times { Complement.of_dna('ACGTGGTCTTAA') } }