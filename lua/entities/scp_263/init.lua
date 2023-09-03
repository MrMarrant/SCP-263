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

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel( "models/props_c17/tv_monitor01.mdl" ) -- TODO : Mettre le modèle
	self:InitVar()
	self:RebuildPhysics()
	hook.Add("PlayerSay", "PlayerSay.SCP263_CheckAnswer_".. self:EntIndex(), function(ply, text)
        SCP_263.CheckAnswer(self, ply, text)
    end)
	-- ? if the player died during a game, we end the game.
	hook.Add( "PlayerDeath", "PlayerDeath.SCP263_IsPlayerDead_".. self:EntIndex(), function( victim, inflictor, attacker )
		local CurrentPlayer = self:GetCurrentPlayer()
		if (IsValid(CurrentPlayer) and self:GetIsOn()) then
			if (victim == CurrentPlayer) then
				SCP_263.EndGame(self)
			end
		end
	end)
end

-- Intialise every var related to the entity
function ENT:InitVar( )
	self:SetIsOn(false)
	self:SetIsWaitingAnswer(false)
	self:SetIsEndingGame(false)
	self:SetIsIntroducingQuestion(false)
	self:SetActualAnswer("")
	self:SetCountCorrectAnswer(0)
	local QuestionListCopy = SCP_263_CONFIG.QuestionList[SCP_263_CONFIG.LangServer] or SCP_263_CONFIG.QuestionList["en"]
	self.QuestionsList = table.Copy( QuestionListCopy)
end

-- Intialise the physic of the entity
function ENT:RebuildPhysics( )
	self:PhysicsInit( SOLID_VPHYSICS ) 
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid( SOLID_VPHYSICS ) 
	self:SetUseType(SIMPLE_USE)
	self:PhysWake()
end

function ENT:OnRemove( )
	self:StopEverySounds()
	hook.Remove("PlayerSay", "PlayerSay.SCP263_CheckAnswer_".. self:EntIndex())
	hook.Remove( "PlayerCanHearPlayersVoice", "PlayerCanHearPlayersVoice.SCP263_AntiCheat_".. self:EntIndex())
	hook.Remove( "PlayerDeath", "PlayerDeath.SCP263_IsPlayerDead_".. self:EntIndex())
end

function ENT:StopEverySounds( )
	self:StopSound(SCP_263_CONFIG.SoundGenericIntro)
end

-- Use specially for the physics sounds
function ENT:PhysicsCollide( data, physobj ) -- TODO : Changer les sons de collisions.
	if data.DeltaTime > 0.2 then
		if data.Speed > 250 then
			self:EmitSound( "physics/concrete/concrete_impact_hard".. math.random(1, 3)..".wav", 75, math.random( 100, 110 ) )	
		else
			self:EmitSound( "physics/concrete/concrete_impact_soft".. math.random(1, 3)..".wav", 75, math.random( 100, 110 ) )		
		end
	end
end

-- Switch on the tv if it's off
function ENT:Use(ply)
	if (not IsValid(ply) or self:GetIsOn()) then return end

	-- TODO : Lancer la partie.
	SCP_263.StartGame(ply, self)
end

-- Detect if a player is too far from the tv
function ENT:Think()
	local ply = self:GetCurrentPlayer()
	if (not self:GetIsOn() or self:GetIsEndingGame() or not IsValid(ply)) then return end
	
	local PlayerPos = ply:GetPos()
	local EntityPos = self:GetPos()

	if (PlayerPos:Distance(EntityPos) > SCP_263_CONFIG.MaximumDelimitationGame:GetInt()) then
		SCP_263.BurnPlayer(ply)
        SCP_263.EndGame(self)
	end
end