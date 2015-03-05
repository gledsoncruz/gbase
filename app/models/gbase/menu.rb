module Gbase
  class Menu < ActiveRecord::Base

  	belongs_to :modulo
	has_many :permissions, :dependent => :destroy
	has_many :users, through: :permissions

	validates :nome, :descricao, :link, presence: true

  end
end
