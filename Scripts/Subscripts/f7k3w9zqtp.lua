return function(func, lib)

    local RunService=game:GetService("RunService");local Workspace=game:GetService("Workspace");local FX_FOLDER_NAME="FX";local TARGET_PART_NAME="BallShadow";local DECAL_NAME_INSIDE="Decal";local FOLLOWER_SPHERE_NAME="Ball";local TARGET_TRACKED_COLOR=Color3.fromRGB(111,111,111);local MIN_TRANSPARENCY=0.3;local MAX_TRANSPARENCY=1.0;local MIN_HEIGHT_OFFSET=2.0;local MAX_HEIGHT_OFFSET=280.0;local LERP_FACTOR=1;local isTracking=false;local trackedPartInstance=nil;local trackedDecalInstance=nil;local followerSphere=nil;local renderConnection=nil;local function StartTracking(partToTrack,decalToTrack)if isTracking or renderConnection then return end;if not partToTrack or not decalToTrack then return end;isTracking=true;trackedPartInstance=partToTrack;trackedDecalInstance=decalToTrack;trackedPartInstance.Color=TARGET_TRACKED_COLOR;local oldFollower=Workspace:FindFirstChild(FOLLOWER_SPHERE_NAME);if oldFollower then oldFollower:Destroy()end;followerSphere=Instance.new("Part");followerSphere.Name=FOLLOWER_SPHERE_NAME;followerSphere.Shape=Enum.PartType.Ball;followerSphere.Size=Vector3.new(4,4,4);followerSphere.Color=Color3.fromRGB(255,255,255);followerSphere.Material=Enum.Material.Air;followerSphere.Anchored=true;followerSphere.CanCollide=false;followerSphere.Transparency=1;followerSphere.Parent=Workspace;local initialTransparency=trackedDecalInstance.Transparency;local initialNormTrans=math.clamp((initialTransparency-MIN_TRANSPARENCY)/(MAX_TRANSPARENCY-MIN_TRANSPARENCY),0,1);local initialHeight=MIN_HEIGHT_OFFSET+(MAX_HEIGHT_OFFSET-MIN_HEIGHT_OFFSET)*initialNormTrans;local initialShadowPos=trackedPartInstance.Position;followerSphere.Position=Vector3.new(initialShadowPos.X,initialShadowPos.Y+initialHeight,initialShadowPos.Z);renderConnection=RunService.RenderStepped:Connect(function(deltaTime)if not trackedPartInstance or not trackedPartInstance.Parent or not trackedDecalInstance or not trackedDecalInstance.Parent or trackedDecalInstance.Parent~=trackedPartInstance or not followerSphere or not followerSphere.Parent then StopTracking();return end;local currentTransparency=trackedDecalInstance.Transparency;local normalizedTransparency=math.clamp((currentTransparency-MIN_TRANSPARENCY)/(MAX_TRANSPARENCY-MIN_TRANSPARENCY),0,1);local calculatedHeightOffset=MIN_HEIGHT_OFFSET+(MAX_HEIGHT_OFFSET-MIN_HEIGHT_OFFSET)*normalizedTransparency;local shadowPosition=trackedPartInstance.Position;local sphereTargetPosition=Vector3.new(shadowPosition.X,shadowPosition.Y+calculatedHeightOffset,shadowPosition.Z);followerSphere.Position=followerSphere.Position:Lerp(sphereTargetPosition,LERP_FACTOR)end)end;function StopTracking()if not isTracking then return end;if renderConnection then renderConnection:Disconnect();renderConnection=nil end;local sphereToDestroy=followerSphere or Workspace:FindFirstChild(FOLLOWER_SPHERE_NAME);if sphereToDestroy and sphereToDestroy.Parent then sphereToDestroy:Destroy()end;followerSphere=nil;trackedPartInstance=nil;trackedDecalInstance=nil;isTracking=false end;local fxFolder=Workspace:WaitForChild(FX_FOLDER_NAME,30);if fxFolder then fxFolder.ChildAdded:Connect(function(child)if child.Name==TARGET_PART_NAME and child:IsA("BasePart")and not isTracking then task.wait(0.1);local decal=child:FindFirstChild(DECAL_NAME_INSIDE);if decal and decal:IsA("Decal")and not isTracking then StartTracking(child,decal)end end end);fxFolder.ChildRemoved:Connect(function(child)if child==trackedPartInstance then StopTracking()end end);if not isTracking then local initialPart=fxFolder:FindFirstChild(TARGET_PART_NAME);if initialPart and initialPart:IsA("BasePart")then local initialDecal=initialPart:FindFirstChild(DECAL_NAME_INSIDE);if initialDecal and initialDecal:IsA("Decal")and not isTracking then StartTracking(initialPart,initialDecal)end end end end
    local Workspace=game:GetService("Workspace");local TARGET_HIGHLIGHT_NAME="Highlight";local TARGET_FILL_COLOR_RGB={R=255,G=149,B=0};local TARGET_OUTLINE_COLOR_RGB={R=255,G=238,B=0};local TARGET_FILL_TRANSPARENCY=1;local TARGET_OUTLINE_TRANSPARENCY=0;local TARGET_ENABLED=true;local TARGET_DEPTH_MODE=Enum.HighlightDepthMode.AlwaysOnTop;local COLOR_COMPONENT_TOLERANCE=0.01;local highlightPartProcessed={};local function runBallShadowTrackingLogic()local RunService_BS=game:GetService("RunService");local Workspace_BS=game:GetService("Workspace");local FX_FOLDER_NAME_BS="FX";local TARGET_PART_NAME_BS="BallShadow";local DECAL_NAME_INSIDE_BS="Decal";local FOLLOWER_SPHERE_NAME_BS="ToroBall";local TARGET_PART_INITIAL_COLOR_BS=Color3.fromRGB(163,162,165);local MIN_TRANSPARENCY_BS=0.3;local MAX_TRANSPARENCY_BS=1.0;local MIN_HEIGHT_OFFSET_BS=2.0;local MAX_HEIGHT_OFFSET_BS=280.0;local LERP_FACTOR_BS=1;local isTracking_BS=false;local trackedPartInstance_BS=nil;local trackedDecalInstance_BS=nil;local followerSphere_BS=nil;local renderConnection_BS=nil;local childAddedConnection_BS=nil;local childRemovedConnection_BS=nil;local function StopTracking_BS()if not isTracking_BS then return end;if renderConnection_BS then renderConnection_BS:Disconnect();renderConnection_BS=nil;end;if childAddedConnection_BS then childAddedConnection_BS:Disconnect();childAddedConnection_BS=nil;end;if childRemovedConnection_BS then childRemovedConnection_BS:Disconnect();childRemovedConnection_BS=nil;end;local sphereToDestroy=followerSphere_BS or Workspace_BS:FindFirstChild(FOLLOWER_SPHERE_NAME_BS);if sphereToDestroy and sphereToDestroy.Parent then sphereToDestroy:Destroy()end;followerSphere_BS=nil;trackedPartInstance_BS=nil;trackedDecalInstance_BS=nil;isTracking_BS=false end;local function StartTracking_BS(partToTrack,decalToTrack)if isTracking_BS or renderConnection_BS then return end;if not partToTrack or not decalToTrack then return end;isTracking_BS=true;trackedPartInstance_BS=partToTrack;trackedDecalInstance_BS=decalToTrack;local oldFollower=Workspace_BS:FindFirstChild(FOLLOWER_SPHERE_NAME_BS);if oldFollower then oldFollower:Destroy()end;followerSphere_BS=Instance.new("Part");followerSphere_BS.Name=FOLLOWER_SPHERE_NAME_BS;followerSphere_BS.Shape=Enum.PartType.Ball;followerSphere_BS.Size=Vector3.new(4,4,4);followerSphere_BS.Color=Color3.fromRGB(255,0,0);followerSphere_BS.Material=Enum.Material.Neon;followerSphere_BS.Anchored=true;followerSphere_BS.CanCollide=false;followerSphere_BS.Transparency=0;followerSphere_BS.Parent=Workspace_BS;local initialTransparency=trackedDecalInstance_BS.Transparency;local initialNormTrans=math.clamp((initialTransparency-MIN_TRANSPARENCY_BS)/(MAX_TRANSPARENCY_BS-MIN_TRANSPARENCY_BS),0,1);local initialHeight=MIN_HEIGHT_OFFSET_BS+(MAX_HEIGHT_OFFSET_BS-MIN_HEIGHT_OFFSET_BS)*initialNormTrans;local initialShadowPos=trackedPartInstance_BS.Position;followerSphere_BS.Position=Vector3.new(initialShadowPos.X,initialShadowPos.Y+initialHeight,initialShadowPos.Z);renderConnection_BS=RunService_BS.RenderStepped:Connect(function(deltaTime)if not trackedPartInstance_BS or not trackedPartInstance_BS.Parent or not trackedDecalInstance_BS or not trackedDecalInstance_BS.Parent or trackedDecalInstance_BS.Parent~=trackedPartInstance_BS or not followerSphere_BS or not followerSphere_BS.Parent then StopTracking_BS();return end;local currentTransparency=trackedDecalInstance_BS.Transparency;local normalizedTransparency=math.clamp((currentTransparency-MIN_TRANSPARENCY_BS)/(MAX_TRANSPARENCY_BS-MIN_TRANSPARENCY_BS),0,1);local calculatedHeightOffset=MIN_HEIGHT_OFFSET_BS+(MAX_HEIGHT_OFFSET_BS-MIN_HEIGHT_OFFSET_BS)*normalizedTransparency;local shadowPosition=trackedPartInstance_BS.Position;local sphereTargetPosition=Vector3.new(shadowPosition.X,shadowPosition.Y+calculatedHeightOffset,shadowPosition.Z);followerSphere_BS.Position=followerSphere_BS.Position:Lerp(sphereTargetPosition,LERP_FACTOR_BS)end);if childAddedConnection_BS then childAddedConnection_BS:Disconnect();childAddedConnection_BS=nil;end;if childRemovedConnection_BS then childRemovedConnection_BS:Disconnect();childRemovedConnection_BS=nil;end end;local fxFolder_BS=Workspace_BS:WaitForChild(FX_FOLDER_NAME_BS,30);if fxFolder_BS then childAddedConnection_BS=fxFolder_BS.ChildAdded:Connect(function(child)if isTracking_BS then return end;if child.Name==TARGET_PART_NAME_BS and child:IsA("BasePart")and child.Color==TARGET_PART_INITIAL_COLOR_BS then task.wait(0.1);local decal=child:FindFirstChild(DECAL_NAME_INSIDE_BS);if decal and decal:IsA("Decal")then StartTracking_BS(child,decal)end end end);childRemovedConnection_BS=fxFolder_BS.ChildRemoved:Connect(function(child)if child==trackedPartInstance_BS then StopTracking_BS()end end);if not isTracking_BS then local initialPart=fxFolder_BS:FindFirstChild(TARGET_PART_NAME_BS);if initialPart and initialPart:IsA("BasePart")and initialPart.Color==TARGET_PART_INITIAL_COLOR_BS then task.wait(0.1);local initialDecal=initialPart:FindFirstChild(DECAL_NAME_INSIDE_BS);if initialDecal and initialDecal:IsA("Decal")then StartTracking_BS(initialPart,initialDecal)end end end;task.delay(10,function()if not isTracking_BS then if childAddedConnection_BS then childAddedConnection_BS:Disconnect();childAddedConnection_BS=nil;end;if childRemovedConnection_BS then childRemovedConnection_BS:Disconnect();childRemovedConnection_BS=nil;end end end)end end;local function areColorsSimilar(colorA_Color3,targetColor_RGBTable)if not colorA_Color3 or not targetColor_RGBTable then return false end;local r=math.abs(colorA_Color3.R-(targetColor_RGBTable.R/255))<COLOR_COMPONENT_TOLERANCE;local g=math.abs(colorA_Color3.G-(targetColor_RGBTable.G/255))<COLOR_COMPONENT_TOLERANCE;local b=math.abs(colorA_Color3.B-(targetColor_RGBTable.B/255))<COLOR_COMPONENT_TOLERANCE;return r and g and b end;local function processPartIfMatches(partInstance)if not partInstance or not partInstance:IsA("BasePart")or highlightPartProcessed[partInstance]then return end;local hi=partInstance:FindFirstChild(TARGET_HIGHLIGHT_NAME);if hi and hi:IsA("Highlight")then local nm=(hi.Name==TARGET_HIGHLIGHT_NAME);local en=(hi.Enabled==TARGET_ENABLED);local dm=(hi.DepthMode==TARGET_DEPTH_MODE);local ft=(math.abs(hi.FillTransparency-TARGET_FILL_TRANSPARENCY)<0.01);local ot=(math.abs(hi.OutlineTransparency-TARGET_OUTLINE_TRANSPARENCY)<0.01);local fc=areColorsSimilar(hi.FillColor,TARGET_FILL_COLOR_RGB);local oc=areColorsSimilar(hi.OutlineColor,TARGET_OUTLINE_COLOR_RGB);if nm and en and dm and fc and ft and oc and ot then highlightPartProcessed[partInstance]=true;runBallShadowTrackingLogic()end end end;Workspace.DescendantAdded:Connect(function(d)if d:IsA("BasePart")then task.wait(0.05);processPartIfMatches(d)elseif d:IsA("Highlight")and d.Name==TARGET_HIGHLIGHT_NAME and d.Parent then processPartIfMatches(d.Parent)end end);for _,d in ipairs(Workspace:GetDescendants())do if d:IsA("BasePart")then processPartIfMatches(d)end end
    
    local Players = game:GetService('Players')
    local camera = workspace.CurrentCamera
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local UserInputService = game:GetService("UserInputService")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local GuiService = game:GetService("GuiService")
    local StarterGui = game:GetService("StarterGui")

    local BALL_NAME = 'Ball'
    local TORO_BALL_NAME = 'ToroBall'
    local SHOW_VISUAL_HITBOX = false
    local THREAT_FILL_TRANSPARENCY = 0.34
    local VISUAL_HITBOX_TRANSPARENCY = 0.75
    local BASE_PARRY_RADIUS = 15
    local TORO_BALL_FIXED_PARRY_RADIUS = 20
    local MIN_SPEED_FOR_RADIUS_INCREASE = 40
    local MAX_PARRY_RADIUS = 50
    local PARRY_COOLDOWN = 0
    local ENABLE_DIRECTION_FILTER = true
    local DIRECTION_DOT_THRESHOLD = 0.707
    local CLASH_SPAM_RADIUS = 15
    local ENABLE_PREDICTION_FILTER = true
    local PREDICTION_FRAMES = 2
    local PREDICTION_TOLERANCE = 0.2
    local MIN_BALL_SPEED = 0.05
    local ENABLE_CURVE_DETECTION = true
    local CURVE_ANGLE_THRESHOLD = 45
    local MIN_SPEED_FOR_CURVE_DETECTION = 10

    local function getPing()
        return math.floor(
            game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue()
        )
    end

    local autoCompensatorEnabled = true
    local manualPingCompensation = 0.05

    local function getRadiusIncreaseByPing()
        if autoCompensatorEnabled then
            local ping = getPing()
            if ping <= 50 then
                return 0.05
            elseif ping <= 100 then
                return 0.08
            elseif ping <= 150 then
                return 0.13
            elseif ping <= 200 then
                return 0.18
            else
                return 0.25
            end
        else
            return manualPingCompensation
        end
    end

    local scriptEnabled = false
    local currentRadiusIncreasePerSpeed = getRadiusIncreaseByPing()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild('HumanoidRootPart')

    local ball, trackedBallType
    local lastParryTime = 0
    local parryVisual
    local previousBallPosition
    local heartbeatConnection
    local lastBallMovementVector = Vector3.zero
    local lastBallSpeed = 0
    local announcementBlockUntil = 0

    local function IsAbilityActive()
        local deflectBillboard =
            humanoidRootPart:FindFirstChild('DeflectBillboardGui')
        local activeAbilityLabel = deflectBillboard
            and deflectBillboard:FindFirstChild('ActiveAbilityLabel')
        return activeAbilityLabel and activeAbilityLabel.Visible
    end

    local VIM = game:GetService("VirtualInputManager")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local StarterGui = game:GetService("StarterGui")
    local LocalPlayer = Players.LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        pcall(function()
            LocalPlayer.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
            LocalPlayer.DevTouchMovementMode = Enum.DevTouchMovementMode.DynamicThumbstick
            StarterGui:SetCore("TouchGuiEnabled", true)
        end)
    end

    local TARGET_SOUNDS = {
        ['rbxassetid://129349547626045'] = 1.7,
        ['rbxassetid://15164222785'] = 0.5,
    }

    local soundBlockedUntil = 0
    local activeSounds = {}

    local function IsSoundPlaying()
        return tick() < soundBlockedUntil
    end

    RunService.Heartbeat:Connect(function()
        if next(activeSounds) then
            for sound in pairs(activeSounds) do
                if not sound.Parent or not sound.IsPlaying then
                    activeSounds[sound] = nil
                end
            end
        end
    end)

    game:GetService('Workspace').DescendantAdded:Connect(function(descendant)
        if descendant:IsA('Sound') and TARGET_SOUNDS[descendant.SoundId] then
            descendant.Played:Connect(function()
                local blockTime = TARGET_SOUNDS[descendant.SoundId]
                activeSounds[descendant] = true
                soundBlockedUntil = tick() + blockTime
            end)
        end
    end)

    local function SetupAnnouncementMonitor()
        local success, result = pcall(function()
            local notificationGui = player.PlayerGui
                :WaitForChild('RunTimeModules', 10)
                :WaitForChild('NotificationGui', 10)
            local gameAnnouncement =
                notificationGui:WaitForChild('GameAnnouncement', 10)

            if gameAnnouncement then
                gameAnnouncement
                    :GetPropertyChangedSignal('Visible')
                    :Connect(function()
                        if gameAnnouncement.Visible then
                            announcementBlockUntil = os.clock() + 0.1
                        end
                    end)
                return true
            end
            return false
        end)
    end

    SetupAnnouncementMonitor()

    local Players = game:GetService("Players") 
    local UserInputService = game:GetService("UserInputService") 
    local VIM = game:GetService("VirtualInputManager") 
    local player = Players.LocalPlayer
    local deflectLabel
    pcall(function()
        local playerGui = player:FindFirstChild("PlayerGui")
        local hud = playerGui and playerGui:FindFirstChild("HUD")
        local holderBottom = hud and hud:FindFirstChild("HolderBottom")
        local toolbarButtons = holderBottom and holderBottom:FindFirstChild("ToolbarButtons")
        local deflectButton = toolbarButtons and toolbarButtons:FindFirstChild("DeflectButton")
        deflectLabel = deflectButton and deflectButton:FindFirstChild("KeyCodeLabel")
    end)

    local keyEnum

    local function PerformParryAction()
        if UserInputService.TouchEnabled then
            keyEnum = Enum.KeyCode.F
        else
            if not deflectLabel then return end  
            local keyText = deflectLabel.Text
            if keyText == "" then return end  

            keyEnum = Enum.KeyCode[keyText]
            if not keyEnum then return end
        end

        VIM:SendKeyEvent(true, keyEnum, false, game)
        VIM:SendKeyEvent(false, keyEnum, false, game)
    end

    local function UpdateOrCreateVisualizer(currentHrp, radius)
        if not scriptEnabled or not SHOW_VISUAL_HITBOX then
            if parryVisual then
                parryVisual:Destroy()
            end
            return
        end

        if not parryVisual then
            parryVisual = Instance.new('Part')
            parryVisual.Name = 'ParryVisualizer'
            parryVisual.Shape = Enum.PartType.Ball
            parryVisual.Material = Enum.Material.ForceField
            parryVisual.Color = Color3.fromRGB(255, 255, 255)
            parryVisual.Transparency = VISUAL_HITBOX_TRANSPARENCY
            parryVisual.Anchored = true
            parryVisual.CanCollide = false
            parryVisual.CanQuery = false
            parryVisual.CanTouch = false
            parryVisual.Locked = true
            parryVisual.Parent = Workspace
        end

        local diameter = radius * 2
        parryVisual.Size = Vector3.new(diameter, diameter, diameter)
        parryVisual.CFrame = currentHrp.CFrame
    end

    local function DestroyVisualizer()
        if parryVisual then
            parryVisual:Destroy()
            parryVisual = nil
        end
    end

    local function IsThreat()
        local playerModel = Workspace:FindFirstChild(player.Name)
        local highlight = playerModel
            and playerModel:FindFirstChildWhichIsA('Highlight')
        return highlight
            and highlight.Enabled
            and math.abs(highlight.FillTransparency - THREAT_FILL_TRANSPARENCY)
                < 0.001
    end

    local function AutoParryLoop(deltaTime)
        if not scriptEnabled or deltaTime <= 0 then
            return
        end

        currentRadiusIncreasePerSpeed = getRadiusIncreaseByPing()

        local currentHrp = player.Character
            and player.Character:FindFirstChild('HumanoidRootPart')
        if not currentHrp then
            DestroyVisualizer()
            return
        end

        humanoidRootPart = currentHrp

        if IsAbilityActive() then
            return
        end

        if os.clock() < announcementBlockUntil then
            return
        end

        local bypassgazo

        if bypassgazo then
            if IsSoundPlaying() then
                return
            end
        end

        local hrpPos = humanoidRootPart.Position
        local primaryBall = Workspace:FindFirstChild(BALL_NAME)
        local secondaryBall = Workspace:FindFirstChild(TORO_BALL_NAME)
        local currentBall = primaryBall or secondaryBall

        if not currentBall then
            DestroyVisualizer()
            ball = nil
            trackedBallType = nil
            previousBallPosition = nil
            return
        end

        trackedBallType = (currentBall == secondaryBall) and 'Toro' or 'Normal'

        local ballPos = currentBall.Position
        local ballSpeed = 0
        local ballMovementVector = Vector3.zero

        if previousBallPosition then
            ballMovementVector = ballPos - previousBallPosition
            ballSpeed = ballMovementVector.Magnitude / deltaTime
        end
        previousBallPosition = ballPos

        local isMakingSharpCurve = false
        if
            ENABLE_CURVE_DETECTION
            and ballSpeed > MIN_SPEED_FOR_CURVE_DETECTION
            and lastBallMovementVector.Magnitude > 0
        then
            local currentBallDirectionUnit = ballMovementVector.Unit
            local lastBallDirectionUnit = lastBallMovementVector.Unit
            if
                currentBallDirectionUnit.Magnitude > 0.99
                and lastBallDirectionUnit.Magnitude > 0.99
            then
                local dotProduct =
                    currentBallDirectionUnit:Dot(lastBallDirectionUnit)
                local angle = math.deg(math.acos(math.clamp(dotProduct, -1, 1)))
                isMakingSharpCurve = (angle > CURVE_ANGLE_THRESHOLD)
            end
        end
        lastBallMovementVector = ballMovementVector
        lastBallSpeed = ballSpeed

        if ballSpeed < MIN_BALL_SPEED then
            local radius = (trackedBallType == 'Toro')
                    and TORO_BALL_FIXED_PARRY_RADIUS
                or BASE_PARRY_RADIUS
            UpdateOrCreateVisualizer(humanoidRootPart, radius)
            return
        end

        local parryRadius = (trackedBallType == 'Toro')
                and TORO_BALL_FIXED_PARRY_RADIUS
            or BASE_PARRY_RADIUS
        if
            trackedBallType == 'Normal'
            and ballSpeed >= MIN_SPEED_FOR_RADIUS_INCREASE
        then
            parryRadius = math.min(
                parryRadius + (ballSpeed * currentRadiusIncreasePerSpeed),
                MAX_PARRY_RADIUS
            )
        end

        UpdateOrCreateVisualizer(humanoidRootPart, parryRadius)

        local distance = (hrpPos - ballPos).Magnitude
        local currentTime = os.clock()

        if currentTime - lastParryTime < PARRY_COOLDOWN then
            return
        end

        local shouldParry = false
        local isThreat = IsThreat()

        if trackedBallType == 'Normal' and isThreat then
            if distance <= parryRadius and not isMakingSharpCurve then
                local directionCheckPassed = true
                if ENABLE_DIRECTION_FILTER then
                    local vectorToPlayer = (hrpPos - ballPos).Unit
                    local ballDirectionUnit = ballMovementVector.Unit
                    if
                        ballMovementVector.Magnitude > 0.01
                        and ballDirectionUnit.Magnitude > 0.99
                    then
                        local directionDot = ballDirectionUnit:Dot(vectorToPlayer)
                        directionCheckPassed = (
                            directionDot > DIRECTION_DOT_THRESHOLD
                        )
                    else
                        directionCheckPassed = false
                    end
                end

                local predictionCheckPassed = true
                if
                    directionCheckPassed
                    and ENABLE_PREDICTION_FILTER
                    and ballMovementVector.Magnitude > 0.01
                then
                    local predictedBallPos = ballPos
                        + (ballMovementVector * PREDICTION_FRAMES)
                    local predictedDistance = (hrpPos - predictedBallPos).Magnitude
                    predictionCheckPassed = (
                        predictedDistance <= distance + PREDICTION_TOLERANCE
                    )
                end

                shouldParry = directionCheckPassed and predictionCheckPassed
            end

            if
                not shouldParry
                and distance <= CLASH_SPAM_RADIUS
                and not isMakingSharpCurve
            then
                shouldParry = true
            end
        end

        if trackedBallType == 'Toro' then
            local toroSpamRadius = CLASH_SPAM_RADIUS + 5

            if distance <= toroSpamRadius then
                shouldParry = true
            elseif distance <= parryRadius and not isMakingSharpCurve then
                local directionCheckPassed = true
                if ENABLE_DIRECTION_FILTER then
                    local vectorToPlayer = (hrpPos - ballPos).Unit
                    local ballDirectionUnit = ballMovementVector.Unit
                    if
                        ballMovementVector.Magnitude > 0.01
                        and ballDirectionUnit.Magnitude > 0.99
                    then
                        local directionDot = ballDirectionUnit:Dot(vectorToPlayer)
                        directionCheckPassed = (
                            directionDot > DIRECTION_DOT_THRESHOLD * 0.5
                        )
                    else
                        directionCheckPassed = false
                    end
                end

                local predictionCheckPassed = true
                if
                    directionCheckPassed
                    and ENABLE_PREDICTION_FILTER
                    and ballMovementVector.Magnitude > 0.01
                then
                    local predictedBallPos = ballPos
                        + (ballMovementVector * PREDICTION_FRAMES)
                    local predictedDistance = (hrpPos - predictedBallPos).Magnitude
                    predictionCheckPassed = (
                        predictedDistance <= distance + PREDICTION_TOLERANCE
                    )
                end

                shouldParry = directionCheckPassed and predictionCheckPassed
            end
        end

        if shouldParry then
            PerformParryAction()
            lastParryTime = currentTime
        end
    end

    local function setAutoParry(enabled)
        scriptEnabled = enabled
        if scriptEnabled then
            currentRadiusIncreasePerSpeed = getRadiusIncreaseByPing()
            if not heartbeatConnection then
                heartbeatConnection = RunService.Heartbeat:Connect(AutoParryLoop)
            end
        else
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
            DestroyVisualizer()
            ball = nil
            trackedBallType = nil
            previousBallPosition = nil
        end
    end

    func:AddParagraph({
        Title = "Hello, moon",
        Content = "License valid until: Lifetime",
    })

    func:AddToggle('AutoParry', {
        Title = "Auto Parry",
        Description = "Deflect the ball automatically",
        Default = true,
        Keybind = "...",
        Callback = function(Value)
            setAutoParry(Value)
        end,
    })

    func:AddSlider('PingCompensator', {
        Title = 'Ping compensator',
        Description = 'Adjust according to your ms',
        Default = 5,
        Min = 1,
        Max = 25,
        Rounding = 0,
        Callback = function(Value)
            manualPingCompensation = Value / 100
        end
    })

    func:AddToggle('AutoCompensator', {
        Title = 'Auto compensator',
        Description = "Adjust the ping comp automatically",
        Default = true,
        Callback = function(Value)
            autoCompensatorEnabled = Value
        end
    })

    func:AddToggle('showvisualizer', {
        Title = 'Show hitbox',
        Description = "Shows a hitbox for the parry",
        Default = false,
        Callback = function(__value)
            SHOW_VISUAL_HITBOX = __value
            if not __value then
                DestroyVisualizer()
            end
        end
    })

    local isPremium = false

    if getgenv().__userplan == "Premium" then
        isPremium = true
    end

    func:AddToggle('bypassgazo', {
        Title = 'Bypass gazo',
        Description = isPremium and "Ignore the balls coming from the gazo (3 and 4)" or "Exclusive premium function",
        Default = false,
        Callback = function(__value)
            if not isPremium then return end
            bypassgazo = __value
        end
    })

    local manualSpamData = {
        enabled = false,
        cps = 300,
        connection = nil,
        mobileGUI = nil
    }

    local isMobile = game:GetService("UserInputService").TouchEnabled

    local function startSpam()
        if manualSpamData.connection then
            manualSpamData.connection:Disconnect()
        end
        
        manualSpamData.enabled = true
        
        manualSpamData.connection = game:GetService("RunService").Heartbeat:Connect(function()
            if manualSpamData.enabled then
                local vm = game:GetService("VirtualInputManager")
                local clicksPerFrame = math.max(1, math.floor(manualSpamData.cps / 60))
                
                for i = 1, clicksPerFrame do
                    vm:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                    task.wait(0.001)
                    vm:SendKeyEvent(false, Enum.KeyCode.F, false, game)
                end
            end
        end)
    end

    local function stopSpam()
        manualSpamData.enabled = false
        if manualSpamData.connection then
            manualSpamData.connection:Disconnect()
            manualSpamData.connection = nil
        end
    end

    local function createMobileGUI()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui")

        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "MobileSpamGUI"
        screenGui.Parent = playerGui
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local mainFrame = Instance.new("Frame")
        mainFrame.Size = UDim2.new(0, 140, 0, 50)
        mainFrame.Position = UDim2.new(1, -160, 0, 20)
        mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        mainFrame.BorderSizePixel = 0
        mainFrame.Parent = screenGui

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = mainFrame

        local spamButton = Instance.new("TextButton")
        spamButton.Size = UDim2.new(1, -10, 1, -10)
        spamButton.Position = UDim2.new(0, 5, 0, 5)
        spamButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        spamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        spamButton.Text = "OFF"
        spamButton.Font = Enum.Font.GothamBold
        spamButton.TextSize = 16
        spamButton.Parent = mainFrame

        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 8)
        buttonCorner.Parent = spamButton

        local dragging = false
        local dragInput, dragStart, startPos

        mainFrame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = mainFrame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        mainFrame.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement 
            or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                mainFrame.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )
            end
        end)

        spamButton.MouseButton1Click:Connect(function()
            if manualSpamData.enabled then
                stopSpam()
                spamButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
                spamButton.Text = "OFF"
            else
                startSpam()
                spamButton.BackgroundColor3 = Color3.fromRGB(50, 168, 82)
                spamButton.Text = "ON"
            end
        end)

        manualSpamData.mobileGUI = screenGui
        return screenGui
    end

    func:AddToggle("ManualSpam", {
        Title = "Manual Spam Parry",
        Default = false,
        Keybind = "...",
        Callback = function(Value)
            if isMobile then
                if Value then
                    createMobileGUI()
                else
                    if manualSpamData.mobileGUI then
                        manualSpamData.mobileGUI:Destroy()
                        manualSpamData.mobileGUI = nil
                    end
                    stopSpam()
                end
            else
                if Value then
                    startSpam()
                else
                    stopSpam()
                end
            end
        end
    })

    local autoAbilityEnabled = true
    local UserInputService = game:GetService('UserInputService')
    local VirtualInputManager = game:GetService('VirtualInputManager')

    local function findDeflectButton()
        local player = game.Players.LocalPlayer
        local gui = player:FindFirstChild('PlayerGui')
        if not gui then
            return
        end

        if UserInputService.TouchEnabled then
            local mobileGui = gui:FindFirstChild('MobileButtonsGUI')
            local holder = mobileGui
                and mobileGui:FindFirstChild('MobileButtonHolder')
            return holder and holder:FindFirstChild('DeflectButton')
        else
            local hud = gui:FindFirstChild('HUD')
            local holder = hud and hud:FindFirstChild('HolderBottom')
            local toolbar = holder and holder:FindFirstChild('ToolbarButtons')
            return toolbar and toolbar:FindFirstChild('DeflectButton')
        end
    end

    local function findToolbarButtons()
        local player = game.Players.LocalPlayer
        local gui = player:FindFirstChild('PlayerGui')
        if not gui then
            return
        end

        if UserInputService.TouchEnabled then
            local mobileGui = gui:FindFirstChild('MobileButtonsGUI')
            return mobileGui and mobileGui:FindFirstChild('MobileButtonHolder')
        else
            local hud = gui:FindFirstChild('HUD')
            local holder = hud and hud:FindFirstChild('HolderBottom')
            return holder and holder:FindFirstChild('ToolbarButtons')
        end
    end

    local deflectButton = findDeflectButton()
    local toolbarButtons = findToolbarButtons()
    local lastTransparency = deflectButton and deflectButton.BackgroundTransparency
    local timerRunning, printed90, startTime

    local allowedAbilities = {
        ['FAKE BALL'] = true,
        ['CURSED BLUE'] = true,
        ['ASTRAL PORTAL'] = true,
        ['CHARGED KICK'] = true,
        ['JUGGLING BLAST'] = true,
        ['LEAP STRIKE'] = true,
        ['CHAIN SPEAR'] = true,
        ['HANDGUN'] = true,
        ['FIST BARRAGE'] = true,
        ['STANDOFF'] = true,
        ['UPPER CUT'] = true,
        ['SONIC SLIDE'] = true,
        ['GROUND WALLS'] = true,
        ['AFTERSHOCK'] = true,
        ['ZAP DEFLECT'] = true,
        ['GODSPEED'] = true,
        ['LIGHTNING INTERCEPT'] = true,
        ['BONK'] = true,
        ['SIDE STEP'] = true,
        ['BUNGEE'] = true,
        ['SHADOW RAMPAGE'] = true,
        ['DREAD SPHERE'] = true,
        ['PHANTOM GRASP'] = true,
        ['DRAGON RUSH'] = true,
        ['KI BLAST'] = true,
        ['ORBITAL CANNON'] = true,
        ['DAGGER DASH'] = true,
        ['BLINK'] = true,
        ['ARISE'] = true,
        ['MANA SHOT'] = true,
        ['RUNEGUARD'] = true,
        ['SINGULARITY'] = true,
        ['EXTEND-O ARM'] = true,
        ['ICE SLIDE'] = true,
        ['ICE SHIELD'] = true,
        ['NINJA RUN'] = true,
        ['SHADOW CLONE'] = true,
    }

    local function isOnCooldown(button)
        return button.BackgroundColor3 == Color3.new(0, 0, 0)
    end

    local function pressAbilityButton(button)
        local keyLabel = button:FindFirstChild('KeyCodeLabel')
        if not keyLabel then
            return
        end

        local keyText = keyLabel.Text
        local keyCode

        if keyText == '1' then
            keyCode = Enum.KeyCode.One
        elseif keyText == '2' then
            keyCode = Enum.KeyCode.Two
        elseif keyText == '3' then
            keyCode = Enum.KeyCode.Three
        elseif keyText == '4' then
            keyCode = Enum.KeyCode.Four
        else
            keyCode = Enum.KeyCode[keyText]
        end

        if keyCode then
            VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
            task.wait(0.05)
            VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
        end
    end

    local function isHighlightValid()
        local character = game.Players.LocalPlayer.Character
        if not character then
            return false
        end

        local highlight = character:FindFirstChild('Highlight')
        return highlight
            and highlight:IsA('Highlight')
            and math.abs(highlight.FillTransparency - 0.34) <= 0.001
    end

    game:GetService('RunService').Stepped:Connect(function()
        if autoAbilityEnabled and deflectButton and toolbarButtons then
            local currentTransparency = deflectButton.BackgroundTransparency
            local now = tick()

            if currentTransparency ~= lastTransparency then
                timerRunning = not timerRunning
                startTime = now
                printed90 = false
                lastTransparency = currentTransparency
            end

            if timerRunning and not printed90 and (now - startTime) >= 0.8 then
                if isHighlightValid() then
                    for i = 1, 4 do
                        local button =
                            toolbarButtons:FindFirstChild('AbilityButton' .. i)
                        if button then
                            local nameLabel =
                                button:FindFirstChild('AbilityNameLabel')
                            local abilityName = nameLabel and nameLabel.Text
                            if
                                allowedAbilities[abilityName]
                                and not isOnCooldown(button)
                            then
                                pressAbilityButton(button)
                                break
                            end
                        end
                    end
                end
                printed90 = true
            end
        end
    end)

    func:AddToggle('AutoAbility', {
        Title = "Auto ability",
        Description = "Use your skills when you miss the parry.",
        Default = true,
        Keybind = "...",
        Callback = function(Value)
            autoAbilityEnabled = Value
        end,
    })

    local UserInputService = game:GetService("UserInputService")

    if not UserInputService.TouchEnabled then

        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RunService = game:GetService("RunService")

        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local camera = workspace.CurrentCamera

        local remote
        pcall(function()
            remote = ReplicatedStorage:FindFirstChild("ReplicateCamLook")
        end)

        local autocurveDirection = "off"
        local hookEnabled = false
        local hookInstalled = false
        local oldNamecall

        local curveOptions = {"off"}

        local function rotateXZ(x,z,angle)
            local cos,sin = math.cos(angle),math.sin(angle)
            return x*cos - z*sin, x*sin + z*cos
        end

        local function getCurveVector(direction)
            local lookVector = camera.CFrame.LookVector
            local x,y,z = lookVector.X, lookVector.Y, lookVector.Z

            if direction == "back" then
                x,y,z = -x,-y,-z
            elseif direction == "right" then
                x,z = -z,x
            elseif direction == "left" then
                x,z = z,-x
            elseif direction == "up" then
                y = y + 1
            elseif direction == "down" then
                y = y - 1
            elseif direction == "up_right" then
                y = y + 0.7
                x,z = -z,x
            elseif direction == "up_left" then
                y = y + 0.7
                x,z = z,-x
            elseif direction == "down_right" then
                y = y - 0.7
                x,z = -z,x
            elseif direction == "down_left" then
                y = y - 0.7
                x,z = z,-x
            elseif direction == "extreme_right" then
                x,z = rotateXZ(x,z,math.rad(90))
            elseif direction == "extreme_left" then
                x,z = rotateXZ(x,z,math.rad(-90))
            elseif direction == "extreme_up" then
                y = y + 2
            elseif direction == "extreme_down" then
                y = y - 2
            elseif direction == "back_left" then
                x,z = rotateXZ(-x,-z,math.rad(45))
            elseif direction == "back_right" then
                x,z = rotateXZ(-x,-z,math.rad(-45))
            elseif direction == "spiral" then
                local t = tick()
                local ang = t % (2*math.pi)
                x,z = rotateXZ(x,z,ang)
                y = y + math.sin(t) * 0.5
            elseif direction == "random" then
                local ang = math.rad(math.random(-180,180))
                x,z = rotateXZ(x,z,ang)
            end

            return x,y,z
        end

        local __module = game:GetService("ReplicatedFirst").Classes.PlayerControl

        local supported

        if pcall(require, __module) then
            supported = true
        else
            supported = false
        end

        local autoCurve = func:AddDropdown("autocurve", {
            Title = "Auto curve",
            Description = supported and "Curve the ball in the selected direction" or "Unsupported executor",
            Values = {
            "off","back","right","left","up","down","random",
            "up_right","up_left","down_right","down_left",
            "extreme_right","extreme_left","extreme_up","extreme_down",
            "back_right","back_left","spiral"},
            Multi = false,
            Default = "off",
        })

        autoCurve:OnChanged(function(Value)
            if not supported then return end
            autocurveDirection = Value
            local shouldEnable = (autocurveDirection ~= "off") and not isSemiSupported
            
            if shouldEnable and not hookInstalled then
                oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                    local args = {...}
                    if self == remote and getnamecallmethod() == "FireServer" then
                        if not checkcaller() then
                            local x,y,z,id = args[1], args[2], args[3], args[4]
                            local newX, newY, newZ = getCurveVector(autocurveDirection)
                            return oldNamecall(self, newX, newY, newZ, id or tick())
                        end
                    end
                    return oldNamecall(self, ...)
                end)
                hookInstalled = true
                hookEnabled = true
                
            elseif not shouldEnable and hookInstalled then
                if oldNamecall then
                    hookmetamethod(game, "__namecall", oldNamecall)
                    hookInstalled = false
                    hookEnabled = false
                    oldNamecall = nil
                end
            else
                hookEnabled = shouldEnable
            end
        end)

        RunService.RenderStepped:Connect(function()
            if autocurveDirection ~= "off" and not isSemiSupported then
                local x,y,z = getCurveVector(autocurveDirection)
                local id = tick()
                if remote then
                    remote:FireServer(x,y,z,id)
                end
            end
        end)
    end

    local character = game.Players.LocalPlayer.Character
    local humanoid = character:FindFirstChild('Humanoid')
    local function findReadyZone()
        local newLobby = workspace:FindFirstChild("New Lobby")
        if not newLobby then return nil end
        
        local readyArea = newLobby:FindFirstChild("ReadyArea")
        if not readyArea then return nil end
        
        local readyZone = readyArea:FindFirstChild("ReadyZone")
        return readyZone
    end

    local readyZone = findReadyZone()

    local autoReadyConnection

    func:AddToggle('AutoReady', {
        Title = 'Auto ready',
        Description = "Go to ReadyZone automatically.",
        Default = false,
        Callback = function(Value)
            if Value then
                autoReadyConnection = game:GetService('RunService').Heartbeat:Connect(function()
                    if character and not game.Players.LocalPlayer:GetAttribute('IsInGame') then
                        if humanoid and readyZone then
                            humanoid:MoveTo(readyZone.Position)
                        end
                    else
                        if humanoid then
                            humanoid:MoveTo(character.HumanoidRootPart.Position)
                        end
                    end
                end)
            else
                if autoReadyConnection then
                    autoReadyConnection:Disconnect()
                    autoReadyConnection = nil
                    
                    if character and humanoid then
                        humanoid:MoveTo(character.HumanoidRootPart.Position)
                    end
                end
            end
        end,
    })

    local fov = workspace.CurrentCamera and math.clamp(workspace.CurrentCamera.FieldOfView, 70, 120) or 70

    func:AddSlider("Fov", {
        Title = "FOV",
        Description = "Field of View",
        Default = 70,
        Min = 70,
        Max = 120,
        Rounding = 0,
        Callback = function(Value)
            fov = Value
        end,
    })

    game:GetService("RunService").RenderStepped:Connect(function()
        if workspace.CurrentCamera and fov ~= 70 then
            if workspace.CurrentCamera.FieldOfView ~= fov then
                workspace.CurrentCamera.FieldOfView = fov
            end
        end
    end)

    func:AddSlider("MaxZoom", {
        Title = "Max Zoom",
        Description = "Zoom in on your camera",
        Default = 45,
        Min = 45,
        Max = 200,
        Rounding = 0,
        Callback = function(Value)
            if Players.LocalPlayer then 
                Players.LocalPlayer.CameraMaxZoomDistance = Value 
            end
        end,
    })

end
