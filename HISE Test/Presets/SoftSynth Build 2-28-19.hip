Processor 
Type SynthChain ID SoftSynth Build 2-28-19 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 1 Solo 0 Folded 0  ChildProcessors  Processor Type ScriptProcessor ID Tester Bypassed Script const var DelaySwitch = Content.addButton('Turn off Delay',200,0);
var fx = Synth.getChildSynth('Syntesizer Group1');
var Delay = Synth.getEffect('Delay1');
const var Feedbackslider = Content.addKnob('Lower or higher',50,5);
const var Feedbackbutton = Content.addButton('Update',200,20);
Feedbackslider.setStyle('Horizontal');
function randomize(){
    Message.setVelocity(Math.randInt(0,127));
}

function ToggleDelay(){
    if (DelaySwitch.getValue() == 1){
        Delay.setBypassed(true);
    } else if (DelaySwitch.getValue() == 0){
        Delay.setBypassed(false);
        
    }
    
}function onNoteOn()
{
	ToggleDelay();
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
 EditorStates 
BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1 onNoteOnOpen 0 onNoteOffOpen 0 onControllerOpen 0 onTimerOpen 0 onControlOpen 0  ChildProcessors   Content  Control type ScriptButton id Turn off Delay value 	         Control type ScriptSlider id Lower or higher value 	   �Q��? Control type ScriptButton id Update value 	         UIData Source SoftSynth Build 2-28-19UIData  Processor Type ScriptProcessor ID Interface Bypassed Script hContent.makeFrontInterface(600, 500);
const var Feedbackslider = Content.addKnob('Lower or higher',150,50);
Feedbackslider.setStyle('Horizontal');
const var Feedbackknob = Content.addKnob('Overall',25,50);
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
 EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptSlider id Knob1 value 	        rangeMin 	   ����?rangeMax 	   ����? Control type ScriptSlider id Lower or higher value 	      �? Control type ScriptSlider id 	Overall value 	         UIData  ContentProperties DeviceType 	Desktop Component type ScriptSlider id Knob1 x 	     �Y@y 	     �c@style Range stepSize 	   @�z�? Component type ScriptSlider id Lower or higher x �   y 2   style Horizontal middlePosition 	      �stepSize 	{�G�z�?min 	        max 	      �?suffix  filmstripImage Use default skin linkedTo   Component type ScriptSlider id 	Overall x    y 2   style Knob middlePosition 	      �stepSize 	{�G�z�?min 	        max 	      �?suffix  filmstripImage Use default skin linkedTo   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type SynthGroup ID Syntesizer Group1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      5@KillFadeTime 	      4@IconColour 0 EnableFM 	        CarrierIndex 	      �ModulatorIndex 	      �UnisonoVoiceAmount 	      (@UnisonoDetune 	        UnisonoSpread 	   @�z�?KillSecondVoices 	      �?EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleEnvelope ID DefaultEnvelope Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	       @Release 	      $@LinearMode 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleReverb ID Simple Reverb1 Bypassed RoomSize 	    �G�?Damping 	    ף�?WetLevel 	    �G�?DryLevel 	    )\�?Width 	    ��?FreezeMode 	   ����?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Delay ID Delay1 Bypassed DelayTimeLeft 	        DelayTimeRight 	      @FeedbackLeft 	   �H$�?FeedbackRight 	   �H$�?LowPassFreq 	     ��@HiPassFreq 	      D@Mix 	    ��?TempoSync 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Saturator ID Saturator1 Bypassed Saturation 	      �?WetAmount 	      �?PreGain 	    {@PostGain 	      6�EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Saturation Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SimpleGain ID Simple Gain1 Bypassed Gain 	    )\�Delay 	        Width 	   `3CY@Balance 	      =�EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type ModulatorChain ID Detune Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Spread Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type WaveSynth ID Waveform Generator2 Bypassed Gain 	   @�_�?Balance 	        VoiceLimit 	      `@KillFadeTime 	      4@IconColour 0 OctaveTranspose1 	        OctaveTranspose2 	        Detune1 	   �G��Detune2 	        WaveForm1 	      @WaveForm2 	      �?Pan1 	      C@Pan2 	        Mix 	    �G�?EnableSecondOscillator 	        PulseWidth1 	    \��?PulseWidth2 	      �?EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Mix Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name Drive value 127 midi_cc -1 controlled_parameter 	id Saturator1 parameter 0 parameter_name Saturation min 0 max 1 low 0 high 1 inverted 0 readonly 1  controlled_parameter 	id Saturator1 parameter 3 parameter_name Post Gain min -24 max 0 low 0 high -22 inverted 0 readonly 1  macro name 
Feedback value 18 midi_cc -1 controlled_parameter 	id Delay1 parameter 2 parameter_name Left Feedback min 0 max 1 low 0 high 1 inverted 0 readonly 1  controlled_parameter 	id Delay1 parameter 3 parameter_name Right Feedback min 0 max 1 low 0 high 1 inverted 0 readonly 1  macro name 	Macro 3 value 0 midi_cc -1  macro name 	Macro 4 value 0 midi_cc -1  macro name 	Macro 5 value 0 midi_cc -1  macro name 	Macro 6 value 0 midi_cc -1  macro name 	Macro 7 value 0 midi_cc -1  macro name 	Macro 8 value 0 midi_cc -1  MidiAutomation   MPEData Enabled  