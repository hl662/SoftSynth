Processor 
Type SynthChain ID CamelCase Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 1 Solo 0 Folded 0  ChildProcessors  Processor Type ScriptProcessor ID Script Processor1 Bypassed Script �// This adds a knob to the script interface
const var amount = Content.addKnob("amount");
const var Random = Content.addButton('Random',250,0);
const var RandomOnce = Content.addButton('Random Once',400,0);

// This will store the current normalized mod value.
reg modWheelGain = 1.0;

var randomBool = 'True';

function changeToggle(){
    if (randomBool == 'False'){
        randomBool = 'True';
    }
    else if (randomBool == 'True'){
        randomBool = 'False';
    }
}

function Randomize(){
    Message.setVelocity(Math.randInt(50,127));   
}

// This will store the current velocity
reg currentVelocity = 127.0;

function onNoteOn()
{
    //currentVelocity = amount.getValue() * Message.getVelocity() * modWheelGain + 
    //                  (1.0 - amount.getValue()) * Message.getVelocity();

    //Message.setVelocity(currentVelocity);
    if (randomBool == 'True'){
        Randomize();
        amount.setValue(modWheelGain);
    }
}function onNoteOff()
{
	
}
function onController()
{
	 if(Message.getControllerNumber() == 0)
    {   
        
        modWheelGain = Message.getControllerValue() / 127.0;
    }
}
function onTimer()
{
	
}
function onControl(number, value)
{
	if(Random.getValue() == 1){
        changeToggle();
        Random.setValue(0);
        Console.print('Changed!');
	}
	
	if(RandomOnce.getValue() == 1){
	    RandomOnce.setValue(0);
	    Randomize();   
	}

}
 EditorStates 
BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 0 onNoteOnOpen 0 onNoteOffOpen 0 onControllerOpen 0 onTimerOpen 0 onControlOpen 1  ChildProcessors   Content  Control type ScriptSlider id amount value 	      �? Control type ScriptButton id string value 	         Control type ScriptButton id Random value 	         Control type ScriptButton id Random Once value 	         UIData  ContentProperties DeviceType 	Desktop Component type ScriptSlider id amount x     y     stepSize 	   @�z�? Component type ScriptButton id string x 	     @o@y 	         Component type ScriptButton id Random x �   y     isPluginParameter  Component type ScriptButton id Random Once x �  y      Processor Type ScriptProcessor ID Interface Bypassed Script Content.makeFrontInterface(600, 500);
const var Keyboard = Content.addFloatingTile("Keyboard", 0, 426);
const var knob = Content.addKnob('Turning')
// [JSON Keyboard]
Content.setPropertiesFromJSON("Keyboard", {
  "width": 600,
  "height": 72
});
// [/JSON Keyboard]
Keyboard.setContentData({"Type": "Keyboard"});

const var button = Content.addButton('Randomizer', 250, 100)
function onNoteOn()
{
	
}
function onNoteOff()
{
	
}
function onController()
{
	
}
function onTimer()
{
	
}
function onControl(number, value)
{
	
}
 EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptSlider id 	Turning value 	         Control type ScriptButton id Randomizer value 	         UIData  ContentProperties DeviceType 	Desktop Component type ScriptFloatingTile id 
Keyboard x     y �  width 	X      height 	H       ContentType 
Keyboard bgColour 	ddd�    itemColour 	���    itemColour2 	����    textColour 	����    Data d{
  "KeyWidth": 14,
  "DisplayOctaveNumber": false,
  "LowKey": 9,
  "HiKey": 127,
  "CustomGraphics": false,
  "DefaultAppearance": true,
  "BlackKeyRatio": 0.69999999,
  "ToggleMode": false,
  "MidiChannel": 1,
  "UseVectorGraphics": false,
  "UseFlatStyle": false,
  "MPEKeyboard": false,
  "MPEStartChannel": 2,
  "MPEEndChannel": 16
}  Component type ScriptSlider id 	Turning x     y     stepSize 	   @�z�? Component type ScriptButton id Randomizer x �   y d    Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type StreamingSampler ID 
Sampler1 Bypassed Gain 	      �?Balance 	    )\�?VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 PreloadSize 	      �@BufferSize 	      �@VoiceAmount 	      p@SamplerRepeatMode 	      @RRGroupAmount 	      �?PitchTracking 	      �?OneShot 	        CrossfadeGroups 	        Purged 	        Reversed 	        NumChannels    UseStaticMatrix 	        Group0Table %24...............vO...f+....9C...vO Group1Table %24...............vO...f+....9C...vO Group2Table %24...............vO...f+....9C...vO Group3Table %24...............vO...f+....9C...vO Group4Table %24...............vO...f+....9C...vO Group5Table %24...............vO...f+....9C...vO Group6Table %24...............vO...f+....9C...vO Group7Table %24...............vO...f+....9C...vO SampleMapID 
MusicBox EditorStates BodyShown 1 Visible 1 Solo 0 MapPanelShown 1 BigSampleMap 1 Folded 0 CrossfadeTableShown 0  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type 
Velocity ID Sample Gain Velocity Bypassed Intensity 	      �?UseTable 	      �?Inverted 	        DecibelMode 	        VelocityTableData %24...............vO...f+....9C..... EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor 	Type SimpleEnvelope ID Simple Envelope1 Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	      @Release 	      9@LinearMode 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type 
Constant ID Constant1 Bypassed Intensity 	   ����?Bipolar EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor 	Type 
Velocity ID Sample Gain Velocity2 Bypassed Intensity 	      �?Bipolar UseTable 	      �?Inverted 	        DecibelMode 	        VelocityTableData %24...............vO...f+....9C..... EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Sample Start Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type 
Velocity ID Sample Gain Velocity2 Bypassed Intensity 	      �?UseTable 	      �?Inverted 	      �?DecibelMode 	        VelocityTableData %24...............vO...f+....9C..... EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type ModulatorChain ID Group Fade Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� channels  channelData enabled level 	        suffix   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name 	Macro 1 value 0 midi_cc -1  macro name 	Macro 2 value 0 midi_cc -1  macro name 	Macro 3 value 0 midi_cc -1  macro name 	Macro 4 value 0 midi_cc -1  macro name 	Macro 5 value 0 midi_cc -1  macro name 	Macro 6 value 0 midi_cc -1  macro name 	Macro 7 value 0 midi_cc -1  macro name 	Macro 8 value 0 midi_cc -1  MidiAutomation   MPEData Enabled  