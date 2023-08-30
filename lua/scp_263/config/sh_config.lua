-- SCP-263, A representation of a paranormal object on a fictional series on the game Garry's Mod.
-- Copyright (C) 2023  MrMarrant aka BIBI.

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

-- Every langs handled by the mod
SCP_263_CONFIG.HandledLanguage = {
    "fr",
    "en",
}

-- The total time the player is burned
SCP_263_CONFIG.TimeToBurn = 42

-- The time the player has for answer the questions
SCP_263_CONFIG.TimetoAnswer = 45

-- The maximum distance delimitation of the game
SCP_263_CONFIG.MaximumDelimitationGame = 500

-- Every models that can be rewarded
SCP_263_CONFIG.ModelsReward = {
    "models/food/burger.mdl",
    "models/food/hotdog.mdl",
    "models/player/items/humans/top_hat.mdl",
}

SCP_263_CONFIG.NumberOfQuestion = 1

SCP_263_CONFIG.SoundWrongAnswer = ""

SCP_263_CONFIG.SoundRightAnswer = ""

SCP_263_CONFIG.SoundGenericIntro = ""

-- NETWORK STRING
SCP_263_CONFIG.SetQuestions = "SCP_263_CONFIG.SetQuestions"