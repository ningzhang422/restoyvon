module DiningTablesHelper
	def get_table_name(id)
		DiningTable.where(id: id).last.name_of
	end
end
