local truegear = require "truegear"

local hookIds = {}
local resetHook = true
local preItemWeight = 0
local isInteract = false
local isGliding = false
local grappingTime = 0


function SendMessage(context)
	if context then
		print(context .. "\n")
		return
	end
	print("nil\n")
end

function RegisterHooks()

	for k,v in pairs(hookIds) do
		UnregisterHook(k, v.id1, v.id2)
	end
		
	hookIds = {}



	local funcName = "/Script/Pal.PalCharacterMovementComponent:OnChangeCrouch"
	local hook1, hook2 = RegisterHook(funcName, Crouch)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Game/Pal/Blueprint/Character/Base/BP_PlayerBase.BP_PlayerBase_C:BndEvt__BP_PlayerBase_CharacterMovement_K2Node_ComponentBoundEvent_2_OnJumpDelegate__DelegateSignature"
	local hook1, hook2 = RegisterHook(funcName, Jump)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Game/Pal/Blueprint/Action/Common/BP_Action_Rolling.BP_Action_Rolling_C:OnBeginAction"
	local hook1, hook2 = RegisterHook(funcName, Rolling)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalGrapplingGunModule:ShotCable"
	local hook1, hook2 = RegisterHook(funcName, ShotCable)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalGrapplingGunModule:IsGrapplingAction"
	local hook1, hook2 = RegisterHook(funcName, IsGrapplingAction)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalShooterComponent:AddRapidFireBlur"
	local hook1, hook2 = RegisterHook(funcName, AddRapidFireBlur)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Game/Pal/Blueprint/Weapon/BP_ThrowWeaponBase.BP_ThrowWeaponBase_C:On Throw"
	local hook1, hook2 = RegisterHook(funcName, OnThrow)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalPlayerController:OnDamage"
	local hook1, hook2 = RegisterHook(funcName, OnDamage)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalCharacterParameterComponent:OnSlipDamage"
	local hook1, hook2 = RegisterHook(funcName, OnSlipDamage)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Game/Pal/Blueprint/Component/Glider/BP_GliderComponent.BP_GliderComponent_C:OnStartGliding"
	local hook1, hook2 = RegisterHook(funcName, OnStartGliding)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Game/Pal/Blueprint/Component/Glider/BP_GliderComponent.BP_GliderComponent_C:OnEndGliding"
	local hook1, hook2 = RegisterHook(funcName, OnEndGliding)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalAnimNotifyState_AttackCollision:OnHit"
	local hook1, hook2 = RegisterHook(funcName, OnHit)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalRiderComponent:Ride"
	local hook1, hook2 = RegisterHook(funcName, Ride)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalUniqueRideWeaponBase:OnUniqueShoot"
	local hook1, hook2 = RegisterHook(funcName, OnUniqueShoot)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Game/Pal/Blueprint/Skill/Common/BP_SkillEffectBase.BP_SkillEffectBase_C:ReceiveBeginPlay"
	local hook1, hook2 = RegisterHook(funcName, SkillEffectBegin)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
    
    local funcName = "/Game/Pal/Blueprint/Status/BP_Status_FallDamage.BP_Status_FallDamage_C:GetLastJumpedZ"
	local hook1, hook2 = RegisterHook(funcName, OnLand)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
    
    local funcName = "/Script/Pal.PalPlayerInventoryData:OnUpdateInventoryContainer"
	local hook1, hook2 = RegisterHook(funcName,PreOnUpdateInventoryContainer, OnUpdateInventoryContainer)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalInteractComponent:EndTriggerInteract"
	local hook1, hook2 = RegisterHook(funcName, EndTriggerInteract)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Game/Pal/Blueprint/Action/Reaction/BP_ActionDeath.BP_ActionDeath_C:OnBeginAction"
	local hook1, hook2 = RegisterHook(funcName, PlayerDeath)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalMapObjectPlayerBedModel:ReceiveTriggerSleepPlayerBedSuccess"
	local hook1, hook2 = RegisterHook(funcName, ToBed)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalMapObjectPlayerBedModel:ReceiveTriggerGetupPlayerBedSuccess"
	local hook1, hook2 = RegisterHook(funcName, Getup)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Game/Pal/Blueprint/UI/CommonWidget/IndividualParamBindWidget/WBP_IndividualParameterBindWidget.WBP_IndividualParameterBindWidget_C:On Update Hunger Internal"
	local hook1, hook2 = RegisterHook(funcName, UpdateHunger)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
    
    local funcName = "/Script/Pal.PalShooterComponent:BowPullAnimeEnd"
	local hook1, hook2 = RegisterHook(funcName, BowPullAnimeEnd)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
        
    local funcName = "/Script/Pal.PalMapObjectConcreteModelBase:OnStartTriggerInteract"
	local hook1, hook2 = RegisterHook(funcName, OnStartTriggerInteract)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
        
    local funcName = "/Script/Pal.PalMapObjectModel:OnStartTriggerInteract"
	local hook1, hook2 = RegisterHook(funcName, OnStartTriggerInteract)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalMapObjectModel:OnEndTriggerInteract"
	local hook1, hook2 = RegisterHook(funcName, OnEndTriggerInteract)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Game/Pal/Blueprint/Action/Palmi/BP_ActionUnlockCagePalLock.BP_ActionUnlockCagePalLock_C:OnBeginAction"
	local hook1, hook2 = RegisterHook(funcName, UnlockCagePalLockOnBeginAction)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

    local funcName = "/Script/Pal.PalShooterComponent:IsShooting"
	local hook1, hook2 = RegisterHook(funcName, IsShooting)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
    
end

-- *******************************************************************
local crossbowShootTime = 0
function IsShooting(self)
    if self:get():GetPropertyValue("bIsShooting") then
        if os.clock() - crossbowShootTime > 0.5 then
            crossbowShootTime = os.clock()
            if self:get():GetPropertyValue("HasWeapon"):GetPropertyValue("WeaponType") == 9 then        -- 弩            
                SendMessage("--------------------------------")
                SendMessage("PistolShoot")  
                truegear.play_effect_by_uuid("PistolShoot") 
            end
        end             
    end
end

function IsPlayShootingAnimation(self)
    SendMessage("--------------------------------")
    SendMessage("IsPlayShootingAnimation")
    SendMessage(self:get():GetFullName())
end

function StartAim(self)
    SendMessage("--------------------------------")
    SendMessage("StartAim")
    SendMessage(self:get():GetFullName())
end


function UnlockCagePalLockOnBeginAction(self)
    isInteract = true
    SendMessage("--------------------------------")
    SendMessage("UnlockCagePalLockOnBeginAction")
    SendMessage(self:get():GetFullName())
end

function OnSlipDamage(self,Damage)
    if string.find(self:get():GetFullName(),"Player") then
        SendMessage("--------------------------------")
        SendMessage("OnSlipDamage")
        truegear.play_effect_by_uuid("DefaultDamage")
        SendMessage(self:get():GetFullName())
        SendMessage(tostring(Damage:get()))
    end
end

function OnStartTriggerInteract(self,Other,IndicatorType)
    local indicatorType = IndicatorType:get()
    if indicatorType == 1 or indicatorType == 3 or indicatorType == 16 or indicatorType == 17 then
        isInteract = true

    end
    SendMessage("--------------------------------")
    SendMessage("OnStartTriggerInteract")
    SendMessage(tostring(IndicatorType:get()))
end

function OnEndTriggerInteract(self,Other,IndicatorType)
    isInteract = false
    SendMessage("--------------------------------")
    SendMessage("OnEndTriggerInteract")
    SendMessage(tostring(IndicatorType:get()))
end

function Pre(self)
end

function BowPullAnimeEnd(self)
    if string.find(self:get():GetFullName(),"Player") then
        SendMessage("--------------------------------")
        SendMessage("ArrowShoot")
        truegear.play_effect_by_uuid("ArrowShoot")
        SendMessage(self:get():GetFullName())
    end
end


local isEat = false
function UpdateHunger(self,Current,Last)
    if string.find(self:get():GetFullName(),"Player") then
        if Last:get() < Current:get() then
            SendMessage("--------------------------------")
            SendMessage("Eat")
            truegear.play_effect_by_uuid("Eat")            
            SendMessage(self:get():GetFullName())
            SendMessage(tostring(Current:get()))
            SendMessage(tostring(Last:get()))
        end
    end
    isEat = true
end

function Getup(self)
    SendMessage("--------------------------------")
    SendMessage("Getup")
    truegear.play_effect_by_uuid("Getup")
    SendMessage(self:get():GetFullName())
end

function ToBed(self)
    SendMessage("--------------------------------")
    SendMessage("ToBed")
    truegear.play_effect_by_uuid("ToBed")
    SendMessage(self:get():GetFullName())
end

function PlayerDeath(self)
    if string.find(self:get():GetFullName(),"Player") then
        SendMessage("--------------------------------")
        SendMessage("PlayerDeath")
        truegear.play_effect_by_uuid("PlayerDeath")
        SendMessage(self:get():GetFullName())
    end
end

function StartTriggerInteract(self,ActionType,IsToggle)
    isInteract = true
    SendMessage("--------------------------------")
    SendMessage("StartTriggerInteract")
    SendMessage(self:get():GetFullName())
    SendMessage(tostring(ActionType:get()))
    SendMessage(tostring(IsToggle:get()))
    SendMessage(tostring(self:get():IsToggleInteracting()))
    SendMessage(tostring(self:get():IsInteracting()))
    SendMessage(tostring(self:get():IsEnableInteract()))
end

function EndTriggerInteract(self,ActionType)
    isInteract = false
    SendMessage("--------------------------------")
    SendMessage("EndTriggerInteract")
    SendMessage(self:get():GetFullName())
    SendMessage(tostring(ActionType:get()))
end

function PreOnUpdateInventoryContainer(self) 
    preItemWeight = self:get():GetNowItemWeight()
end


function OnUpdateInventoryContainer(self,Container)
    if preItemWeight > self:get():GetNowItemWeight() then
        if isEat then
            isEat = false
            return
        end
        SendMessage("--------------------------------")
        SendMessage("InventoryDropItem")
        truegear.play_effect_by_uuid("InventoryDropItem")
    elseif preItemWeight < self:get():GetNowItemWeight() then
        SendMessage("--------------------------------")
        SendMessage("InventoryAddItem")
        truegear.play_effect_by_uuid("InventoryAddItem")
    end
    
    SendMessage(tostring(preItemWeight))
    SendMessage(tostring(self:get():GetNowItemWeight()))
end

function SkillEffectBegin(self)
    if self:get():GetPropertyValue("Owner"):GetPropertyValue("PlayerState"):GetFullName() then
        SendMessage("--------------------------------")
        SendMessage("RideSkill")
        truegear.play_effect_by_uuid("RideSkill")
        SendMessage(self:get():GetFullName())
        SendMessage(self:get():GetPropertyValue("Owner"):GetPropertyValue("PlayerState"):GetFullName())
    end
end

function OnUniqueShoot(self)
    SendMessage("--------------------------------")
    SendMessage("RideWeaponShoot")
    truegear.play_effect_by_uuid("RideWeaponShoot")
    SendMessage(self:get():GetFullName())
end


function Ride(self)
    if string.find(self:get():GetFullName(),"Player") then
        SendMessage("--------------------------------")
        SendMessage("Ride")
        truegear.play_effect_by_uuid("Ride")
        SendMessage(self:get():GetFullName())
    end
end

function OnLand(self,Z)
    if string.find(self:get():GetFullName(),"Player") then
        SendMessage("--------------------------------")
        SendMessage("OnLand")
        truegear.play_effect_by_uuid("OnLand")
        SendMessage(self:get():GetFullName())
        SendMessage(tostring(self:get():GetPropertyValue("Const_DamageStartHeight")))
        SendMessage(tostring(Z:get()))
    end
end

function OnEndGliding(self)
    SendMessage("--------------------------------")
    SendMessage("OnEndGliding")
    SendMessage(self:get():GetFullName())
    isGliding = false
end

function OnStartGliding(self)
    SendMessage("--------------------------------")
    SendMessage("OnStartGliding")
    SendMessage(self:get():GetFullName())
    isGliding = true
end

function OnChangeSwimming(self)
    SendMessage("--------------------------------")
    SendMessage("OnChangeSwimming")
    SendMessage(self:get():GetFullName())
end

function OnHit(self,MyHitComponent,HitActor)
    if (not string.find(HitActor:get():GetFullName(),"Player")) and string.find(self:get():GetFullName(),"Player") then
        SendMessage("--------------------------------")
        SendMessage("MeleeHit")
        truegear.play_effect_by_uuid("MeleeHit")
        SendMessage(self:get():GetFullName())
        SendMessage(HitActor:get():GetFullName())
    end
end

function OnDamage(self,DamageResult)
    SendMessage("--------------------------------")
    SendMessage("DefaultDamage")
    truegear.play_effect_by_uuid("DefaultDamage")
end

function OnThrow(self)
    if string.find(self:get():GetPropertyValue("Owner"):GetFullName(),"Player") then
        SendMessage("--------------------------------")
        SendMessage("ThrowItem")
        truegear.play_effect_by_uuid("ThrowItem")
        SendMessage(self:get():GetFullName())
    end
end

function AddRapidFireBlur(self)
    if string.find(self:get():GetFullName(),"Player") then
        local weaponType = self:get():GetPropertyValue("HasWeapon"):GetPropertyValue("WeaponType")
        if weaponType == 4 or weaponType == 6 or weaponType == 14 or weaponType == 15 then
            SendMessage("--------------------------------")
            SendMessage("ShotgunShoot")
            truegear.play_effect_by_uuid("ShotgunShoot")
        elseif weaponType == 3 or weaponType == 5 or weaponType == 10 or weaponType == 11 or weaponType == 13 then
            SendMessage("--------------------------------")
            SendMessage("RifleShoot")
            truegear.play_effect_by_uuid("RifleShoot")
        else
            SendMessage("--------------------------------")
            SendMessage("PistolShoot")
            truegear.play_effect_by_uuid("PistolShoot")
        end
        SendMessage(self:get():GetFullName())
        SendMessage(tostring(weaponType))
    end
end

function IsGrapplingAction(self)
    local grapplingGunState = self:get():GetPropertyValue("GrapplingGunState")
    if grapplingGunState == 3 then
        if os.clock() - grappingTime > 0.18 then
            grappingTime = os.clock()
            SendMessage("--------------------------------")
            SendMessage("GrapplingGunGrappling")
            truegear.play_effect_by_uuid("GrapplingGunGrappling")
            SendMessage(self:get():GetFullName())
        end
    end
end

function ShotCable(self)
    SendMessage("--------------------------------")
    SendMessage("GrapplingGunShoot")
    truegear.play_effect_by_uuid("GrapplingGunShoot")
    SendMessage(self:get():GetFullName())
end

function Rolling(self)
    SendMessage("--------------------------------")
    SendMessage("Somersault")
    truegear.play_effect_by_uuid("Somersault")
    SendMessage(self:get():GetFullName())
end

function Jump(self)
    SendMessage("--------------------------------")
    SendMessage("Jump")
    truegear.play_effect_by_uuid("Jump")
    SendMessage(self:get():GetFullName())
end

function Crouch(self,Component,IsInCrouch)
    if string.find(self:get():GetFullName(),"Player") then
        SendMessage("--------------------------------")
        SendMessage("Crouch")
        truegear.play_effect_by_uuid("Crouch")
        SendMessage(self:get():GetFullName())
        SendMessage(tostring(IsInCrouch:get()))
    end
end

function Interact()
    if isInteract then 
        SendMessage("--------------------------------")
        SendMessage("Interact")
        truegear.play_effect_by_uuid("Interact")
    end
end

function Gliding()
    if isGliding then 
        SendMessage("--------------------------------")
        SendMessage("Gliding")
        truegear.play_effect_by_uuid("Gliding")
    end
end

truegear.init("1623730", "PalWorld")


function CheckPlayerSpawned()
	RegisterHook("/Script/Engine.PlayerController:ClientRestart", function()
		if resetHook then
			local ran, errorMsg = pcall(RegisterHooks)
			if ran then
				SendMessage("--------------------------------")
				SendMessage("Interact")
				truegear.play_effect_by_uuid("Interact")
				resetHook = false
			else
				print(errorMsg)
			end
		end		
	end)
end


SendMessage("TrueGear Mod is Loaded");
CheckPlayerSpawned()

LoopAsync(180, Gliding)
LoopAsync(300, Interact)