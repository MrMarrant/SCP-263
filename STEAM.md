[img]https://i.imgur.com/BIZZc6S.gif[/img]

[url=https://scp-wiki.wikidot.com/scp-263]Page referring to the object[/url]

[h2]Features[/h2]
SCP-263 is a old black and white television.
SCP-263 has been observed to function even when not connected to a power outlet.

When switched on, the TV always displays the interior of a studio, whose design bears similarities to studios of television game shows from the 1960's.
A large logo, saying "CASH OR ASH" in large, stylized letters can be seen on the generic of the show.

[img]https://i.imgur.com/lcIwSGf.png[/img]

The aim of this addon was to create a new "entity" for role-playing "revision" of knowledge about the SCP universe.

[h3]ENTITY[/h3]

The main entity is the television, it has :
[list]
[*]  Audio announcer
[*]  Animated material
[*]  Multiple way to interact with it 
[*]  'AntiCheat'
[*]  Three different rewards
[*]  25 defaults questions & 4 answers for each question
[*]  Configuration for add new questions or for configure values of the addon
[/list]

[/h2]Functionality[/h2]

When a player uses the 'Action' button on the entity, it lights up and the player is considered to be the candidate for the new show.
The announcer will announce the start of the game and ask the contestant a total of 3 questions, each of which is timed.

The questions are displayed on the candidate's screen, as well as to all players near the entity.
The contestant can answer them by writing the correct letter corresponding to one of the answers in the chat box.

[img]https://i.imgur.com/yxD2PpI.gif[/img]

If he answers correctly, he can continue answering the following questions 😎
If he answers incorrectly, he will be burned alive 🥵

By answering 3 questions correctly, the contestant will be rewarded with one of the 3 figurines available, and then the TV will switch itself off.

[img]https://i.imgur.com/qD2tiqT.gif[/img]

Of course, there are a few rules that the contestant must respect during the game, including :

[list]
[*]  Don't get too far away from the entity
[*]  Don't cheat 😡
[*]  Don't die
[*]  Answer within the time limit
[*]  Don't say 'uwu' or 'feur'
[/list]

Failure to comply with any of the above rules will result in spontaneous combustion of the candidate (unless he's already dead, of course 💀).

[img]https://i.imgur.com/QFnLLy2.gif[/img]

[h3]REWARDS[/h3]

There are 3 awards as explained above, each is a small figurine,
Two correspond to an SCP (SCP-682 and SCP-173)
The last is just a little personal pleasure, interpret it as you want 🙂

[img]https://i.imgur.com/kjbOcCf.jpg[/img]

[h2]Convars[/h2]

There are a number of Convars that allow you to configure the addon on several elements, here is the list:


[table]
[tr]
[th]Name[/th]
[th]Description[/th]
[th]Default Value[/th]
[th]Min[/th]
[th]Max[/th]
[/tr]
[tr]
[td]SCP263_TimeToBurn[/td]
[td]The total time the player is burned[/td]
[td]42[/td]
[td]1[/td]
[td]999[/td]
[/tr]
[tr]
[td]SCP263_TimeToAnswer[/td]
[td]The total time the player has for answer the questions[/td]
[td]45[/td]
[td]1[/td]
[td]600[/td]
[/tr]
[tr]
[td]SCP263_MaximumDelimitationGame[/td]
[td]The maximum distance delimitation of the game[/td]
[td]500[/td]
[td]10[/td]
[td]9999[/td]
[/tr]
[/table]

I strongly recommend that you use the props menu (Utilities/SCP-263/Settings) instead of changing the convar from the server console, only Admin/Super Admin can modify this values.

[h2]Add New Questions[/h2]

If you want to add or remove questions , make sure you've at least launched your server once with the addon active.

Then go to your Garry's Mod folder in your Steam library, here's the path : 
[quote]YourDirectoryRoot\Steam\steamapps\common\GarrysMod\garrysmod\data\data_scp263[/quote]

Normally, there should be at least two files by default: 
[quote]
en_questions.json
fr_questions.json
[/quote]

Open the one corresponding to your language or create a new one by replacing the prefix of the file name by the one of your language. Be careful, prefixes can have a particular syntax depending on the language, check [url=https://wiki.facepunch.com/gmod/Addon_Localization]here[/url] the prefix.

Here's an example of the expected format, which you can use as inspiration, just replace the text:
[quote]
[
    {
		question = "If a staff revolt breaks out, which Fim should intervene ?",
		correct_answer = "c",
		response_a = "The Alpha-1",
		response_b = "The Omega-1",
		response_c = "The Thau-5",
		response_d = "The Omicron Rhô",
	},
	{
		question = "Who is Bobble the Clown?",
		correct_answer = "a",
		response_a = "A clown visible only to children",
		response_b = "SCP-2094",
		response_c = "A breeding circus clown",
		response_d = "SCP-2912-3",
	},
    {
		question = "What is the Foundation's standard procedure for containing SCP ?",
		correct_answer = "a",
		response_a = "Contain them in a containment cell in accordance with their dangerousness and specific needs",
		response_b = "Contain them and attempt to destroy them",
		response_c = "Study and understand them before confining them",
		response_d = "Make them appear in the light",
	},
]
[/quote]
A minimum of 3 questions is required, otherwise the addon will generate an LUA error,
Otherwise, to describe each parameter :
[list]
[*] question' : Name of the question
[*] 'correct_answer' : Wich answer is the one correct
[*] response_' : All the possible answer displays
[/list]
Don't forget the quote and comma or you will have a lot of errors 💀

If you ever want to reset the default questions for included languages, simply delete the json file and restart your server.

[h2]Languages[/h2]
Two languages are currently supported:
[list]
[*]  French
[*]  English
[/list]
Send me a request if you want me to integrate other languages.

[h2]Common questions[/h2]
[h3]How to get the entity or the weapon ?[/h3]

Get the entity or weapon from the [b]SCP[/b] section.

[h3]Where does the map/sound/model come from ?[/h3]

Credit section, with link and name

[h3]Can i edit your addon ?[/h3]

If you want to modify it, no worries, but go through me first, I am very open to discussion, propose me your modifications and if you made them I can integrate them directly.

For developers, you can make Pull Requests on my [url=https://github.com/MrMarrant/SCP-263]repo[/url], and I'll validate them if everything is good. 

[h3]On wich mode it work ?[/h3]

All, normally, let me know if this is not the case, but I haven't used any specific features unique to a gamemode.

[h3]Why ?[/h3]

Cauz it's fun 🤡

[h3]What's your next addon ?[/h3]

Right now, I think I'm going to slow down the entities as i've been doing since the beginning and i'm going to work on projects that require more time and work.

[h3]Can i ask you to work for my server SCP ?[/h3]

[img]https://i.imgur.com/gzZzXdv.gif[/img]


[h2]Credits[/h2]
[list]
[*] All the contents can be found [url=https://pastebin.com/xiAM1YUA]here[/url].
[*] Huge thanks to [url=https://twitter.com/Ganna_Luffy]GannaLuffy[/url] for the voice announcer, you can ask him on discord for commissions if you like it.
[*] Thanks to VTail64 for the map used for screenshoots and GIF's, you can found it [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1345722248]here[/url].
[*] Thanks to [url=https://steamcommunity.com/profiles/76561199480278703]Orion[/url] for helping me to draft somes of the questions.
[*] Thanks to [url=https://steamcommunity.com/id/lunuki]Lunuki[/url] for creating the Logo of the fictional show 'Cash Or Ash'.
[*] Thanks to Fred Allen for the use of his image on some of the shows he produced, he was an excellent presenter.
[/list]


[b]Don't hesitate to tell me if there are bugs or if you would like i add or modify on it.[/b]

If you have any question, don't hesitate to ask on the [url=https://discord.gg/tuMNx3PkkP]discord [/url].
If you want to support my work, click [url= https://wlo.link/@MrMarrant]here[/url].


[i]I hope you laughed. Thank you for killing with us.[/i]
[img]https://i.imgur.com/nTRVJZ1.gif[/img]
[spoiler]tags: tv, tele, television, gameshow, lore, scp-263, scp263, scp 263, SCP263, SCP 263, scp, ericandre, game show, winner, looser, scprp, scp rp, scp roleplay, scp roleplay, show[/spoiler]