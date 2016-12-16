
def next_client client
	this_client = {folder: client, name: "", text: "", ad: "", logo: ""}	# declare new empty hash, add folder name

	Dir.chdir("./" + this_client[:folder])	# enter client file, retrieve file names
	client_assets = Dir.glob("*")
	client_assets.sort!
	puts client_assets

	client_name_file = File.open(client_assets[2], "r")	# read client name and text
	this_client[:name] = client_name_file.read
	client_text_file = File.open(client_assets[3], "r")
	this_client[:text] = client_text_file.read

	this_client[:ad] = "clients/" + client + client_assets[0]	#create image paths
	this_client[:logo] = "clients/" + client + client_assets[1]

	this_client
end

def send_array
	client_folders = Dir.glob("*/")
	client_array = []
	client_folders.each_with_index do |folder, i|
			client_array[i] = next_client(folder)
	end
	client_array
end

send_array

# def Client (folder_name)
# 	@folder = folder_name
# 	@assets = get_assets
# 	@name = ""
# 	@text = ""
# 	@ad = ""
# 	@logo = ""
# 	attr_reader :name, :text, :ad, :logo

# 	def get_assets
# 		D
# 	end

# 	def get_name
		
# 	end
# end