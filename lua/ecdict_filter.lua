--[[
ecdict: 把ECDICT.dict.yaml里的text作为comment，code作为text输出
--]]

local function utf8_sub(s, i, j)
   i = i or 1
   j = j or -1
   if i < 1 or j < 1 then
      local n = utf8.len(s)
      if not n then return nil end
      if i < 0 then i = n + 1 + i end
      if j < 0 then j = n + 1 + j end
      if i < 0 then i = 1 elseif i > n then i = n end
      if j < 0 then j = 1 elseif j > n then j = n end
   end
   if j < i then return "" end
   i = utf8.offset(s, i)
   j = utf8.offset(s, j + 1)
   if i and j then
      return s:sub(i, j - 1)
   elseif i then
      return s:sub(i)
   else
      return ""
   end
end

local function truncate_comment(comment)
  local MAX_LENGTH = 50
  local gsub_fmt = package.config:sub(1,1) == "/" and "\n" or "\r"
  local result = comment:gsub("\\n",gsub_fmt)
  if #result > MAX_LENGTH then
    result = utf8_sub(result, 1, MAX_LENGTH)
  end
  return result
end

local function sync_case(input, candidate_word)
  local is_first_char_cap = input:sub(1,1):upper() == input:sub(1,1)
  local is_second_char_cap = input:sub(2,2):upper() == input:sub(2,2)
  if is_first_char_cap and is_second_char_cap then
    return candidate_word:upper()
  elseif is_first_char_cap then
    return candidate_word:sub(1,1):upper() .. candidate_word:sub(2)
  else
    return candidate_word
  end
end

local function ecdict_filter(input, env)
  local context = env.engine.context
  local input_text = context:get_preedit().text
  local separator = " 🔎"
  local text, comment
  for cand in input:iter() do
    text, comment = cand.text:match("^(.*)::(.*)")
    if text then
      text = sync_case(input_text, text)
      comment = truncate_comment(separator .. comment)
      yield(Candidate("ECDICT",1,#text,text,comment))
    else
      yield(cand)
    end
  end
end

return ecdict_filter
