--[[
BY : SNIEBRTEAM
Channel Files : https://t.me/SNIEBRFiles
]]
local function keko_SNIEBR(data)
    local msg = data.message_
    redis = (loadfile "./libs/redis.lua")()
    datahmade = Redis.connect('127.0.0.1', 6379)
    sudos = dofile('sudo.lua')
    HTTPS = require("ssl.https")
    JSON = (loadfile  "./libs/dkjson.lua")()
    local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
    local TextParseMode = {ID = "TextParseModeMarkdown"}
      tdcli_function ({
      ID = "SendMessage",
      chat_id_ = chat_id,
      reply_to_message_id_ = reply_to_message_id,
      disable_notification_ = disable_notification,
      from_background_ = 1,
      reply_markup_ = nil,
      input_message_content_ = {
      ID = "InputMessageText",
      text_ = text,
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode,
      },
      }, dl_cb, nil)
      end
    local msg = data.message_
    text = msg.content_.text_
    if (text and text == 'تعين start' and  tonumber(msg.sender_user_id_) == tonumber(sudo_add) ) then 
      send(msg.chat_id_, msg.id_, 1, '📜┇الان ، ارسل الكليشه', 1, 'md')
      datahmade:set("keko:addo"..msg.sender_user_id_, "yes")
      return false
    end  
    if text then 
    local keko = datahmade:get("keko:addo"..msg.sender_user_id_)
    if keko == 'yes' then 
      send(msg.chat_id_, msg.id_, 1, "☑️┇تم حفظ كليشه start", 1, 'md')
      datahmade:del("keko:addo"..msg.sender_user_id_)
      datahmade:set("keko:start0"..bot_id, text)
      return false
    end
    end
local id2 = tostring(msg.chat_id_)
if (text and id2:match('^(%d+)')) then 
if text == '/start' then 
local start = datahmade:get("keko:start0"..bot_id)
local kkt = ''
if start then 
kkt = start.. "\n[🦁┇SNIEBR TEAM](https://t.me/SNIEBR)" -- هلو ماوصيك 
else 
kkt = "مرحبا بك في بوت حمايه الكروبات".. "\n\n[🦁┇SNIEBR TEAM](https://t.me/SNIEBR)" -- هلو ماوصيك 
end
send(msg.chat_id_, msg.id_, 1, kkt, 1, 'md')
end
end
    end
    return {
        keko_SNIEBR = keko_SNIEBR,
    }
    --[[
    BY : SNIEBRTEAM
    Channel Files : https://t.me/SNIEBRFiles
    ]]