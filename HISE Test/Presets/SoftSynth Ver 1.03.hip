Processor 
Type SynthChain ID SoftSynth Ver 1.03 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script =// Ver 1.03 Date: May 15th 2019 - Randomized the Combo Boxes for WaveTypes
Content.makeFrontInterface(600, 700);
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
const var Update = Content.addButton('Update',472,161);
Content.setPropertiesFromJSON('Update',{
    'width': 100,
    'height': 25
});
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
    if (Content.getComponent('lockSynthesizer').getValue() == 0){
        Content.getComponent('WaveOneType').setValue(Math.randInt(1,4));
    
        Content.getComponent('WaveTwoType').setValue(Math.randInt(1,4));
    
        Content.getComponent('WaveMix').setValue(Math.random());
    
        Content.getComponent('Detune').setValue(Math.random());
      
        Content.getComponent('Voices').setValue(Math.randInt(1,16));
    
        Content.getComponent('Width').setValue(Math.random() + Math.random());
    }
    
    if (Content.getComponent('lockSaturator').getValue() == 0){
        Content.getComponent('Drive').setValue(Math.randInt(1,127));
        Content.getComponent('SaturationMix').setValue(Math.random());
    }
    
    if (Content.getComponent('lockReverb').getValue() == 0){
        Content.getComponent('ReverbWet').setValue(Math.randInt(30,100)*0.01);
        Content.getComponent('Size').setValue(Math.random());
    }
    
    if (Content.getComponent('lockDelay').getValue() == 0){
        Content.getComponent('DelayMix').setValue(Math.random());
    }
    
    if (Content.getComponent('lockGain').getValue() == 0){
        Content.getComponent('MasterGain').setValue(Math.randInt(5,15));
    }
    UpdateParameters();
}
function UpdateParameters(){
    WaveformGenerator.setAttribute(WaveformGenerator.Mix,Content.getComponent('WaveMix').getValue());
    SynthesizerGroup.setAttribute(SynthesizerGroup.UnisonoDetune,Content.getComponent('Detune').getValue());
    SynthesizerGroup.setAttribute(SynthesizerGroup.UnisonoVoiceAmount,Content.getComponent('Voices').getValue());
    SynthesizerGroup.setAttribute(SynthesizerGroup.UnisonoSpread,Content.getComponent('Width').getValue());
    Saturator.setAttribute(Saturator.WetAmount,Content.getComponent('SaturationMix').getValue());
    Reverb.setAttribute(Reverb.WetLevel,Content.getComponent('ReverbWet').getValue());
    Reverb.setAttribute(Reverb.RoomSize,Content.getComponent('Size').getValue());
    Delay.setAttribute(Delay.Mix,Content.getComponent('DelayMix').getValue());
    SimpleGain.setAttribute(SimpleGain.Gain,Content.getComponent('MasterGain').getValue());
    WaveformGenerator.setAttribute(WaveformGenerator.WaveForm1,Content.getComponent('WaveOneType').getValue());
    WaveformGenerator.setAttribute(WaveformGenerator.WaveForm2,Content.getComponent('WaveTwoType').getValue());
}
function FeedbackUpdate(){
    var Range = Content.getComponent('KnobRange').getValue();
    if (Content.getComponent('lockSynthesizer').getValue() == 0){
        Content.getComponent('WaveMix').setValue(Content.getComponent('WaveMix').getValue()+1*(Range - 1));
        Content.getComponent('Detune').setValue(Content.getComponent('Detune').getValue()+1*(Range - 1));
        Content.getComponent('Width').setValue(Content.getComponent('Width').getValue()+2*(Range - 1));
        Content.getComponent('Voices').setValue(Math.floor(Content.getComponent('Voices').getValue()+16*(Range - 1))); 
    }
    if (Content.getComponent('lockSaturator').getValue() == 0){
        Content.getComponent('Drive').setValue(Math.floor(Content.getComponent('Drive').getValue()+127*(Range - 1)));
        Content.getComponent('SaturationMix').setValue(Content.getComponent('SaturationMix').getValue()+1*(Range - 1));
    }
    
    if (Content.getComponent('lockDelay').getValue() == 0){
        Content.getComponent('DelayMix').setValue(Content.getComponent('DelayMix').getValue()+1*(Range - 1));
    
    }
    if (Content.getComponent('lockReverb').getValue() == 0){
        Content.getComponent('Size').setValue(Content.getComponent('Size').getValue()+1*(Range - 1));
        Content.getComponent('ReverbWet').setValue(Content.getComponent('ReverbWet').getValue()+1*(Range - 1));
    }
    UpdateParameters();
}function onNoteOn()
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
    if (btnRandomizeAll.getValue() == 1){
        RandomizeAll();
        btnRandomizeAll.setValue(0);
    }
    
    if (Update.getValue() == 1){
        FeedbackUpdate();
        Update.setValue(0);
    }
}
 EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptSlider id Knob1 value 	      @ Control type ScriptButton id 	Button1 value 	         Control type ScriptTable id tbl value 	        data u84...............vO5Sy87vPcX8C...vOe3kY9PU+t8C...vOvQ4f9nyZ44C...vOF96F+DoAl5C...vOqM+T+PINI5C...vO...f+....9C...vO  Control type ScriptSlider id MasterGain value 	      &@ Control type ScriptButton id 
lockGain value 	         Control type ScriptComboBox id WaveTwoType value 	      @ Control type ScriptComboBox id WaveOneType value 	       @ Control type ScriptSlider id 	WaveMix value 	   `b��? Control type ScriptSlider id Detune value 	   �ӊ�? Control type ScriptSlider id Voices value 	      .@ Control type ScriptSlider id Width value 	    ���? Control type ScriptSlider id Drive value 	     @[@ Control type ScriptSlider id SaturationMix value 	   ����? Control type ScriptSlider id ReverbWet value 	   `ff�? Control type ScriptSlider id Size value 	   ��j � Control type ScriptButton id lockReverb value 	         Control type ScriptSlider id 
DelayMix value 	   @ѹ{? Control type ScriptSlider id 
Feedback value 	      :@ Control type ScriptButton id lockDelay value 	         Control type ScriptButton id Randomize All value 	         Control type ScriptSlider id KnobRange value 	   ��(�? Control type ScriptButton id Update value 	         Control type ScriptButton id lockSaturator value 	      �? Control type ScriptButton id lockSynthesizer value 	      �? UIData  ContentProperties DeviceType 	Desktop Component type ScriptSlider id Knob1 x 	     �z@y 	     @r@text Rate isPluginParameter 1 tooltip Control the rate of the LFO processorId LFO Modulator2 parameterId Frequency mode TempoSync max 	      2@stepSize 	      �?middlePosition 	      "@ Component type ScriptButton id 	Button1 x 	     �z@y 	      p@text Randomize  Component type ScriptTable id tbl x 	     �x@y 	     �u@width 	     �g@height 	     �\@processorId  Global Time Variant Modulator1  Component type ScriptPanel id Master x 	      x@y 	      *@width 	      i@height 	     �R@Component type ScriptSlider id MasterGain x 	     �@@y 	      *@parentComponent Master text Master Gain processorId Simple Gain1 parameterId Gain min 	      Y�max 	      B@stepSize 	   ����?middlePosition 	        isPluginParameter 1 tooltip Controls the master volume  Component type ScriptButton id 
lockGain x 	     �d@y 	      8@parentComponent Master text  width 	      >@height 	      >@ Component type ScriptPanel id MainSynthComponents x 	      3@y 	      3@width 	     �t@height 	     @f@processorId Waveform Generator1 Component 
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
type ScriptSlider id SaturationMix x 	     �g@y 	      0@parentComponent Saturation text Mix processorId Saturator1 parameterId WetAmount isPluginParameter 1 tooltip #Controls the amount of distortion  Component type ScriptPanel id Reverb x 	     �h@y 	     �t@width 	     �c@height 	     �a@Component type ScriptSlider id ReverbWet x 	       @y 	     �S@parentComponent Reverb text Reverb Wet processorId Simple Reverb1 parameterId 
WetLevel mode NormalizedPercentage suffix % middlePosition 	      �?isPluginParameter 1 tooltip  Controls rthe amount of reverb  Component type ScriptSlider id Size x 	       @y 	      (@parentComponent Reverb processorId Simple Reverb1 parameterId 
RoomSize mode NormalizedPercentage suffix % middlePosition 	      �?isPluginParameter 1 tooltip !Controls the size of the reverb  Component type ScriptButton id lockReverb x 	     �^@y 	      L@parentComponent Reverb text  width 	      >@height 	      >@ Component type ScriptPanel id Delay x 	      3@y 	     �t@width 	      c@height 	     @a@Component type ScriptSlider id 
DelayMix x 	      $@y 	     �S@parentComponent Delay text Delay Wet processorId Delay1 parameterId Mix mode NormalizedPercentage suffix % middlePosition 	      �?isPluginParameter 1 tooltip Controls the amount of delay  Component type ScriptSlider id 
Feedback x 	      $@y 	      (@parentComponent Delay macroControl 	Macro 2 min 	      �?max 	     �_@stepSize 	      �?isPluginParameter 1 tooltip ,Controls the amount of feedback from delay processorId Delay1 parameterId FeedbackLeft  Component type ScriptButton id lockDelay x 	     �]@y 	     �K@parentComponent Delay text  width 	      >@height 	      >@ Component type ScriptButton id Randomize All x �  y �   processorId Syntesizer Group1 isMetaParameter  Component type ScriptFloatingTile id 
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
}  Component 	type ScriptSlider id KnobRange x 	     �v@y 	      d@style Horizontal width 	     �Y@height 	      :@max 	       @middlePosition 	      �? Component type ScriptButton id Update x �  y �   width 	d       height 	        Component type ScriptButton id lockSaturator x 	     pv@y 	     �n@text  width 	      >@height 	      >@ Component type ScriptButton id lockSynthesizer x 	     �v@y 	      [@text  width 	      >@height 	      >@ Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type GlobalModulatorContainer ID Global Modulator Container1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Global Modulators Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type LFO ID LFO Modulator2 Bypassed Intensity 	      �?Frequency 	      @FadeIn 	   �=
@WaveformType 	      @Legato 	        TempoSync 	      �?SmoothingTime 	   ��@LoopEnabled 	      �?CustomWaveform %24...............vO...f+....9C...vO StepData [64....f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+. EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID LFO Intensity Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID LFO Frequency Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SynthGroup ID Syntesizer Group1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      1@KillFadeTime 	      4@IconColour 0 EnableFM 	        CarrierIndex 	      �ModulatorIndex 	      �?UnisonoVoiceAmount 	      .@UnisonoDetune 	   �ӊ�?UnisonoSpread 	    ���?KillSecondVoices 	      �?EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleEnvelope ID DefaultEnvelope Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	      *@Release 	      8@LinearMode 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type GlobalTimeVariantModulator ID  Global Time Variant Modulator1 Bypassed Intensity 	      �?UseTable Inverted TableData u84...............vO5Sy87vPcX8C...vOe3kY9PU+t8C...vOvQ4f9nyZ44C...vOF96F+DoAl5C...vOqM+T+PINI5C...vO...f+....9C...vO Connection ,Global Modulator Container1:LFO Modulator2 EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleReverb ID Simple Reverb1 Bypassed RoomSize 	   ��j �Damping 	    ף�?WetLevel 	   `ff�?DryLevel 	   @33�?Width 	   ���?FreezeMode 	   ����?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Delay ID Delay1 Bypassed DelayTimeLeft 	       @DelayTimeRight 	      "@FeedbackLeft 	   `�e�?FeedbackRight 	   `�e�?LowPassFreq 	     ��@HiPassFreq 	      D@Mix 	   @ѹ{?TempoSync 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Saturator ID Saturator1 Bypassed Saturation 	   �m�?WetAmount 	   ����?PreGain 	        PostGain 	   �m�2�EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Saturation Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SimpleGain ID Simple Gain1 Bypassed Gain 	      &@Delay 	        Width 	      Y@Balance 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type ModulatorChain ID Detune Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Spread Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type WaveSynth ID Waveform Generator2 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 OctaveTranspose1 	        OctaveTranspose2 	      �Detune1 	        Detune2 	        WaveForm1 	       @WaveForm2 	      @Pan1 	        Pan2 	        Mix 	   `b��?EnableSecondOscillator 	      �?PulseWidth1 	      �?PulseWidth2 	      �?EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Mix Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name Drive value 108.857147216796875 midi_cc -1 controlled_parameter 	id Saturator1 parameter 0 parameter_name Saturation min 0 max 1 low 0 high 1 inverted 0 readonly 1  controlled_parameter 	id Saturator1 parameter 3 parameter_name Post Gain min -24 max 0 low 0 high -22 inverted 0 readonly 1  macro name 
Feedback value 25.198413848876953125 midi_cc -1 controlled_parameter 	id Delay1 parameter 2 parameter_name Left Feedback min 0 max 1 low 0 high 1 inverted 0 readonly 1  controlled_parameter 	id Delay1 parameter 3 parameter_name Right Feedback min 0 max 1 low 0 high 1 inverted 0 readonly 1  macro name 	Macro 3 value 0 midi_cc -1  macro name 	Macro 4 value 0 midi_cc -1  macro name 	Macro 5 value 0 midi_cc -1  macro name 	Macro 6 value 0 midi_cc -1  macro name 	Macro 7 value 0 midi_cc -1  macro name 	Macro 8 value 0 midi_cc -1  MidiAutomation   MPEData Enabled  