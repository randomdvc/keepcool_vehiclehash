local FilePath = 'C:/file.txt' -- The exact path of the file

RegisterServerEvent('keepcool:WriteString')
AddEventHandler('keepcool:WriteString', function(text)
	WriteText(text)
end, false)

function WriteText(text)
    local output = io.open(FilePath, "a")
    if output then
        output:write(text)
    else
        print("file does not exist")
    end
    output:close()
end