Processor 
Type SynthChain ID SoftSynth Build 4-11-19 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script ,Content.makeFrontInterface(600, 700);
// Keyboard
const var Keyboard = Content.addFloatingTile("Keyboard", -230, 626);
Content.setPropertiesFromJSON('Keyboard',{
   'width': 850,
   'height': 72
});
Keyboard.setContentData({'Type': 'Keyboard'});


//Constructors to control parameters of modules
const var GlobalTimeVariantModulator1 = Synth.getModulator("Global Time Variant Modulator1");
const var btnRandomizeAll = Content.addButton('Randomize All',427,220);
const var WaveformGenerator = Synth.getChildSynth('Waveform Generator2');
const var SynthesizerGroup = Synth.getChildSynth('Syntesizer Group1');
const var Saturator = Synth.getEffect('Saturator1');
const var Reverb = Synth.getEffect('Simple Reverb1');
const var Delay = Synth.getEffect('Delay1');
const var SimpleGain = Synth.getEffect('Simple Gain1');
inline function onButton1Control(component, value)
{
    if (value)
    {
        local tbl = GlobalTimeVariantModulator1.asTableProcessor();

        tbl.reset(0);
        for (i = 0; i < 5; i++){
            tbl.addTablePoint(0, Math.random(), Math.random());
        Content.getComponent('Button1').setValue(0);
        }
    }
};
Content.getComponent("Button1").setControlCallback(onButton1Control);

function RandomizeAll(){
    Content.getComponent('WaveMix').setValue(Math.random());
    WaveformGenerator.setAttribute(WaveformGenerator.Mix,Content.getComponent('WaveMix').getValue());

    Content.getComponent('Detune').setValue(Math.random());
    SynthesizerGroup.setAttribute(SynthesizerGroup.UnisonoDetune,Content.getComponent('Detune').getValue());
    
    Content.getComponent('Voices').setValue(Math.randInt(1,16));
    SynthesizerGroup.setAttribute(SynthesizerGroup.UnisonoVoiceAmount,Content.getComponent('Voices').getValue());

    Content.getComponent('Width').setValue(Math.random()+ Math.random());
    SynthesizerGroup.setAttribute(SynthesizerGroup.UnisonoSpread,Content.getComponent('Width').getValue());

    Content.getComponent('Drive').setValue(Math.randInt(1,127));
    
    Content.getComponent('SaturationMix').setValue(Math.random());
    Saturator.setAttribute(Saturator.WetAmount,Content.getComponent('SaturationMix').getValue());
    
    Content.getComponent('ReverbWet').setValue(Math.randInt(30,100)*0.01);
    Reverb.setAttribute(Reverb.WetLevel,Content.getComponent('ReverbWet').getValue());
    Content.getComponent('Size').setValue(Math.random());
    Reverb.setAttribute(Reverb.RoomSize,Content.getComponent('Size').getValue());
    
    Content.getComponent('DelayMix').setValue(Math.random());
    Delay.setAttribute(Delay.Mix,Content.getComponent('DelayMix').getValue());
    
    Content.getComponent('MasterGain').setValue(Math.randInt(5,15));
    SimpleGain.setAttribute(SimpleGain.Gain,Content.getComponent('MasterGain').getValue());
}
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
    if (number == btnRandomizeAll){
        RandomizeAll();
        btnRandomizeAll.setValue(0);
    }
}
 EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptSlider id Knob1 value 	      @ Control type ScriptButton id 	Button1 value 	         Control type ScriptTable id tbl value 	        data u84...............vOpJur9n5hI6C...vOzt1t9feeb5C...vOS3FF+3W0l8C...vOHMcb+bhgl7C...vOYzzd+3Gkk8C...vO...f+....9C...vO  Control type ScriptSlider id MasterGain value     Control type ScriptComboBox id WaveTwoType value 	      @ Control type ScriptComboBox id WaveOneType value 	       @ Control type ScriptSlider id 	WaveMix value 	  �Jƕ�? Control type ScriptSlider id Detune value 	  @��? Control type ScriptSlider id Voices value     Control type ScriptSlider id Width value 	  ��N�? Control type ScriptSlider id Drive value .    Control type ScriptSlider id SaturationMix value 	   �ص? Control type ScriptSlider id ReverbWet value 	gfffff�? Control type ScriptSlider id Size value 	  ��Q��? Control type ScriptSlider id 
DelayMix value 	   U���? Control type ScriptSlider id 
Feedback value 	      :@ Control type ScriptButton id Randomize All value 	         UIData  ContentProperties DeviceType 	Desktop 
Component type ScriptSlider id Knob1 x 	     �z@y 	     @r@text Rate isPluginParameter 1 tooltip Control the rate of the LFO processorId LFO Modulator2 parameterId Frequency mode TempoSync max 	      2@stepSize 	      �?middlePosition 	      "@ Component type ScriptButton id 	Button1 x 	     �z@y 	      p@text Randomize  Component type ScriptTable id tbl x 	     �x@y 	     �u@width 	     �g@height 	     �\@processorId  Global Time Variant Modulator1  Component type ScriptPanel id Master x 	      x@y 	      *@width 	      i@height 	     �R@Component type ScriptSlider id MasterGain x 	     �@@y 	      *@parentComponent Master text Master Gain processorId Simple Gain1 parameterId Gain min 	      Y�max 	      B@stepSize 	   ����?middlePosition 	        isPluginParameter 1 tooltip Controls the master volume  Component type ScriptPanel id MainSynthComponents x 	      3@y 	      3@width 	     �t@height 	     @f@processorId Waveform Generator1 Component 
type ScriptComboBox id WaveTwoType x 	     �g@y 	      0@text WaveType 2 parentComponent MainSynthComponents processorId Waveform Generator2 parameterId WaveForm2 items Sine
Triangle
Saw
Square

 max     Component 
type ScriptComboBox id WaveOneType x 	      $@y 	      0@max    text Wave Type parentComponent MainSynthComponents processorId Waveform Generator2 parameterId WaveForm1 items Sine
Triangle
Saw
Square
  Component 
type ScriptSlider id 	WaveMix x 	      $@y 	      L@parentComponent MainSynthComponents processorId Waveform Generator2 parameterId Mix text Wave Blender isPluginParameter 1 tooltip 0Control the mix between the two waves selected  Component 	type ScriptSlider id Detune x 	      $@y 	     �\@parentComponent MainSynthComponents processorId Syntesizer Group1 parameterId UnisonoDetune isPluginParameter 1 tooltip 8Controls the amount of detune (enable multiple voices)  Component type ScriptSlider id Voices x 	     �g@y 	     �\@parentComponent MainSynthComponents processorId Syntesizer Group1 parameterId UnisonoVoiceAmount min 	      �?max 	      0@stepSize 	      �?defaultValue 	      �?isPluginParameter 1 tooltip Controls the number of voices  Component type ScriptSlider id Width x 	     �g@y 	      N@parentComponent MainSynthComponents processorId Syntesizer Group1 parameterId UnisonoSpread max 	       @mode NormalizedPercentage middlePosition 	      �?defaultValue 	      �?isPluginParameter 1 tooltip Control the stereo width  Component type ScriptPanel id Saturation x 	      3@y 	     @k@width 	     �t@height 	      V@Component type ScriptSlider id Drive x 	      $@y 	      0@parentComponent Saturation macroControl 	Macro 1 min 	      �?max 	     �_@stepSize 	      �?isPluginParameter 1 tooltip /Controls the aggressiveness of the distortion processorId Saturator1 parameterId Saturation  Component 
type ScriptSlider id SaturationMix x 	     �g@y 	      0@parentComponent Saturation text Mix processorId Saturator1 parameterId WetAmount isPluginParameter 1 tooltip #Controls the amount of distortion  Component type ScriptPanel id Reverb x 	     �h@y 	     �t@width 	     �c@height 	     �a@Component type ScriptSlider id ReverbWet x 	       @y 	     �S@parentComponent Reverb text Reverb Wet processorId Simple Reverb1 parameterId 
WetLevel mode NormalizedPercentage suffix % middlePosition 	      �?isPluginParameter 1 tooltip  Controls rthe amount of reverb  Component type ScriptSlider id Size x 	       @y 	      (@parentComponent Reverb processorId Simple Reverb1 parameterId 
RoomSize mode NormalizedPercentage suffix % middlePosition 	      �?isPluginParameter 1 tooltip !Controls the size of the reverb  Component type ScriptPanel id Delay x 	      3@y 	     �t@width 	      c@height 	     @a@Component type ScriptSlider id 
DelayMix x 	      $@y 	     �S@parentComponent Delay text Delay Wet processorId Delay1 parameterId Mix mode NormalizedPercentage suffix % middlePosition 	      �?isPluginParameter 1 tooltip Controls the amount of delay  Component type ScriptSlider id 
Feedback x 	      $@y 	      (@parentComponent Delay macroControl 	Macro 2 min 	      �?max 	     �_@stepSize 	      �?isPluginParameter 1 tooltip ,Controls the amount of feedback from delay processorId Delay1 parameterId FeedbackLeft  Component type ScriptButton id Randomize All x �  y �   processorId Syntesizer Group1 isMetaParameter  Component type ScriptFloatingTile id 
Keyboard x ���y r  width 	R      height 	H       ContentType 
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
}  Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type GlobalModulatorContainer ID Global Modulator Container1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Global Modulators Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type LFO ID LFO Modulator2 Bypassed Intensity 	      �?Frequency 	      @FadeIn 	   �=
@WaveformType 	      @Legato 	        TempoSync 	      �?SmoothingTime 	   ��@LoopEnabled 	      �?CustomWaveform %24...............vO...f+....9C...vO StepData [64....f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+. EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID LFO Intensity Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID LFO Frequency Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SynthGroup ID Syntesizer Group1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      3@KillFadeTime 	      4@IconColour 0 EnableFM 	        CarrierIndex 	      �ModulatorIndex 	      �?UnisonoVoiceAmount 	      *@UnisonoDetune 	    ��?UnisonoSpread 	    �N�?KillSecondVoices 	      �?EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleEnvelope ID DefaultEnvelope Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	      *@Release 	      8@LinearMode 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type GlobalTimeVariantModulator ID  Global Time Variant Modulator1 Bypassed Intensity 	      �?UseTable Inverted TableData u84...............vOpJur9n5hI6C...vOzt1t9feeb5C...vOS3FF+3W0l8C...vOHMcb+bhgl7C...vOYzzd+3Gkk8C...vO...f+....9C...vO Connection ,Global Modulator Container1:LFO Modulator2 EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleReverb ID Simple Reverb1 Bypassed RoomSize 	    R��?Damping 	    ף�?WetLevel 	   `ff�?DryLevel 	    ���?Width 	   ���?FreezeMode 	   ����?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Delay ID Delay1 Bypassed DelayTimeLeft 	       @DelayTimeRight 	      "@FeedbackLeft 	   `�e�?FeedbackRight 	   `�e�?LowPassFreq 	     ��@HiPassFreq 	      D@Mix 	   `���?TempoSync 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Saturator ID Saturator1 Bypassed Saturation 	    �q�?WetAmount 	   ��ص?PreGain 	        PostGain 	   �8�#�EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Saturation Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SimpleGain ID Simple Gain1 Bypassed Gain 	      *@Delay 	        Width 	      Y@Balance 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type ModulatorChain ID Detune Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Spread Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type WaveSynth ID Waveform Generator2 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 OctaveTranspose1 	        OctaveTranspose2 	      �Detune1 	        Detune2 	        WaveForm1 	       @WaveForm2 	      @Pan1 	        Pan2 	        Mix 	   @ƕ�?EnableSecondOscillator 	      �?PulseWidth1 	      �?PulseWidth2 	      �?EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Mix Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name Drive value 56.444446563720703125 midi_cc -1 controlled_parameter 	id Saturator1 parameter 0 parameter_name Saturation min 0 max 1 low 0 high 1 inverted 0 readonly 1  controlled_parameter 	id Saturator1 parameter 3 parameter_name Post Gain min -24 max 0 low 0 high -22 inverted 0 readonly 1  macro name 
Feedback value 25.198413848876953125 midi_cc -1 controlled_parameter 	id Delay1 parameter 2 parameter_name Left Feedback min 0 max 1 low 0 high 1 inverted 0 readonly 1  controlled_parameter 	id Delay1 parameter 3 parameter_name Right Feedback min 0 max 1 low 0 high 1 inverted 0 readonly 1  macro name 	Macro 3 value 0 midi_cc -1  macro name 	Macro 4 value 0 midi_cc -1  macro name 	Macro 5 value 0 midi_cc -1  macro name 	Macro 6 value 0 midi_cc -1  macro name 	Macro 7 value 0 midi_cc -1  macro name 	Macro 8 value 0 midi_cc -1  MidiAutomation   MPEData Enabled  