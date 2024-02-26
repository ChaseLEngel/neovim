local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local function mysplit (inputstr, sep)
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

local function generate_test()
  local file = vim.fn.expand("%:t")
  print("my file is " .. file)

  vim.cmd("vsplit | terminal")
  local command = ':call jobsend(b:terminal_job_id, "rails g test_unit:model' .. file .. '--skip --no-fixture\\n")'
  local result = vim.cmd(command)
  print("result = " ..result)
end

return {
  generate_test = generate_test
}
