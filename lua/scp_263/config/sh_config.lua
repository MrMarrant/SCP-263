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

SCP_263_CONFIG.NameFileQuestion = "_questions.json"

-- Every models that can be rewarded
SCP_263_CONFIG.ModelsReward = {
    "models/scp_263/scp_173.mdl",
    "models/scp_263/scp_682.mdl",
    "models/scp_263/he_smile.mdl",
}

SCP_263_CONFIG.SoundWrongAnswer = Sound( "scp_263/sound_effect/bad_answer.mp3" )

SCP_263_CONFIG.SoundRightAnswer = Sound( "scp_263/sound_effect/good_answer.mp3" )

SCP_263_CONFIG.SoundGenericIntro = Sound( "scp_263/sound_effect/generic.mp3" )

SCP_263_CONFIG.SoundApplauseGeneric = Sound( "scp_263/sound_effect/applause_generic.mp3" )

SCP_263_CONFIG.SoundApplauseWin = Sound( "scp_263/sound_effect/applause_win.mp3" )

SCP_263_CONFIG.SoundApplause = Sound( "scp_263/sound_effect/applause.mp3" )

SCP_263_CONFIG.SoundTimerDecay = Sound( "scp_263/sound_effect/timer_decay.wav" )

SCP_263_CONFIG.SoundBoo = Sound( "scp_263/sound_effect/boo.mp3" )

-- NET VAR
SCP_263_CONFIG.SetQuestions = "SCP_263_CONFIG.SetQuestions"
SCP_263_CONFIG.SetConvarClientSide = "SCP_263_CONFIG.SetConvarClientSide"
SCP_263_CONFIG.StartTimer = "SCP_263_CONFIG.StartTimer"
SCP_263_CONFIG.StopTimer = "SCP_263_CONFIG.StopTimer"
SCP_263_CONFIG.SetConvarInt = "SCP_263_CONFIG.SetConvarInt"