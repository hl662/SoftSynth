Processor 
Type SynthChain ID SoftSynth Ver 1.23 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script �// Ver 1.21 Date: May 29th 2019 - Added knob UI and Lock UI.
Content.makeFrontInterface(1200, 580);

// Custom Keyboard Design

const var Keyboard = Content.addFloatingTile("Keyboard", 0, 500);
Content.setPropertiesFromJSON('Keyboard',{
   'width': 1200,
   'height': 80
});
Keyboard.setContentData({'Type': 'Keyboard'});

//Constructors to control parameters of modules
const var GlobalTimeVariantModulator1 = Synth.getModulator("Global Time Variant Modulator1");
const var btnRandomizeAll = Content.addButton('Randomize All',427,205);
const var Update = Content.addButton('Update',465,161);
Content.setPropertiesFromJSON('Update',{
    'width': 135,
    'height': 45
});
const var WaveformGenerator = Synth.getChildSynth('Waveform Generator2');
const var SynthesizerGroup = Synth.getChildSynth('Syntesizer Group1');
const var Saturator = Synth.getEffect('Saturator1');
const var Reverb = Synth.getEffect('Simple Reverb1');
const var Delay = Synth.getEffect('Delay1');
const var SimpleGain = Synth.getEffect('Simple Gain1');
const var Label1 = Content.getComponent("Label1");
//

inline function onButton1Control(component, value) // This function serves to randomize the wave table (The graph in the interface).
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
        Content.getComponent('WaveOneType').setValue(Math.randInt(1,5));
    
        Content.getComponent('WaveTwoType').setValue(Math.randInt(1,5));
    
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
 EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  'Control type ScriptSlider id Knob1 value 	      $@ Control type ScriptButton id 	Button1 value 	         Control type ScriptTable id tbl value 	        data u84...............vOZq.h9XU9s8C...vOFWQr930OI7C...vO5qP89L93u3C...vO.ZB+9.crd8C...vOz1Q.+fxnE2C...vO...f+....9C...vO  Control type ScriptSlider id MasterGain value 	      (@ Control type ScriptButton id 
lockGain value 	         Control type ScriptComboBox id WaveTwoType value 	      @ Control type ScriptComboBox id WaveOneType value 	      @ Control type ScriptSlider id 	WaveMix value 	    ���? Control type ScriptSlider id Detune value 	   �yD�? Control type ScriptSlider id Voices value 	      @ Control type ScriptSlider id Width value 	   @߽�? Control type ScriptSlider id Drive value 	      Z@ Control type ScriptSlider id SaturationMix value 	   �X�? Control type ScriptSlider id ReverbWet value 	   �G�? Control type ScriptSlider id Size value 	   ���? Control type ScriptButton id lockReverb value 	         Control type ScriptSlider id 
DelayMix value 	   @P_�? Control type ScriptSlider id 
Feedback value 	      �? Control type ScriptButton id lockDelay value 	         Control type ScriptButton id Randomize All value 	         Control type ScriptSlider id KnobRange value 	   �p=�? Control type ScriptButton id Update value 	         Control type ScriptButton id lockSaturator value 	         Control type ScriptButton id lockSynthesizer value 	         Control type ScriptLabel id Label1 value 
Wave Mix  Control type ScriptLabel id Label2 value Detune  Control type ScriptLabel id Label3 value Width  Control type ScriptLabel id Label4 value Voices  Control type ScriptLabel id Label5 value Master Gain  Control type ScriptLabel id Label6 value Drive  Control type ScriptLabel id Label7 value Saturation Mix  Control type ScriptLabel id Label8 value Rate  Control type ScriptLabel id Label9 value Delay  Control type ScriptLabel id 	Label10 value Size  Control type ScriptLabel id 	Label11 value Reverb Wet  Control type ScriptLabel id 	Label12 value 
Feedback  Control type ScriptLabel id 	Label13 value Update  Control type ScriptLabel id 	Label14 value Randomize All  Control type ScriptLabel id 	Label15 value Randomize  UIData  ContentProperties DeviceType 	Desktop Component type ScriptImage id Image1 x 	        y 	        fileName !{PROJECT_FOLDER}SSwallpaper.png width 	     ��@height 	      �@Component type ScriptImage id Image2 x 	      {@y 	     �W@parentComponent Image1 width 	     �a@height 	     �O@fileName {PROJECT_FOLDER}SSlogo.png  Component type ScriptSlider id Knob1 x 	     �z@y 	     pr@text Rate isPluginParameter 1 tooltip Control the rate of the LFO processorId LFO Modulator2 parameterId Frequency mode TempoSync max 	      2@stepSize 	      �?middlePosition 	      "@numStrips 	     @Y@scaleFactor 	   `ff�?showValuePopup Right width 	     �F@height 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component 
type ScriptButton id 	Button1 x 	     �z@y 	     @o@text Randomize width 	     �`@height 	     �F@numStrips 	      @scaleFactor 	   `ff�?filmstripImage {PROJECT_FOLDER}button_3.png  Component type ScriptTable id tbl x 	     �x@y 	     �u@width 	     �g@height 	     �\@processorId  Global Time Variant Modulator1  Component type ScriptPanel id Master x 	      x@y 	      *@width 	      i@height 	     �R@itemColour 	   �    itemColour2 	   �    Component type ScriptSlider id MasterGain x 	     �@@y 	      0@parentComponent Master text Master Gain processorId Simple Gain1 parameterId Gain min 	      Y�max 	      B@stepSize 	   ����?middlePosition 	        isPluginParameter 1 tooltip Controls the master volume width 	     �F@numStrips 	     @Y@scaleFactor 	   `ff�?showValuePopup Right filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png height 	     �F@ Component 
type ScriptButton id 
lockGain x 	     �d@y 	      8@parentComponent Master text  width 	      ?@height 	      ?@scaleFactor 	      �?filmstripImage  {PROJECT_FOLDER}lock_icon3.png  Component 	type ScriptPanel id MainSynthComponents x 	      3@y 	      3@width 	     �t@height 	     @f@processorId Waveform Generator1 itemColour 	   �    itemColour2 	   �    Component 
type ScriptComboBox id WaveTwoType x 	     �g@y 	      0@text WaveType 2 parentComponent MainSynthComponents processorId Waveform Generator2 parameterId WaveForm2 items Sine
Triangle
Saw
Square

 max     Component 
type ScriptComboBox id WaveOneType x 	      $@y 	      0@max    text Wave Type parentComponent MainSynthComponents processorId Waveform Generator2 parameterId WaveForm1 items Sine
Triangle
Saw
Square
  Component type ScriptSlider id 	WaveMix x 	      $@y 	     �M@parentComponent MainSynthComponents processorId Waveform Generator2 parameterId Mix text Wave Blender isPluginParameter 1 tooltip 0Control the mix between the two waves selected numStrips 	     @Y@scaleFactor 	   `ff�?showValuePopup Right mouseSensitivity 	   ����?width 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png height 	     �F@ Component type ScriptSlider id Detune x 	      $@y 	     @]@parentComponent MainSynthComponents processorId Syntesizer Group1 parameterId UnisonoDetune isPluginParameter 1 tooltip 8Controls the amount of detune (enable multiple voices) scaleFactor 	   `ff�?numStrips 	     @Y@width 	     �F@showValuePopup Right height 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component type ScriptSlider id Voices x 	     �g@y 	     @]@parentComponent MainSynthComponents processorId Syntesizer Group1 parameterId UnisonoVoiceAmount min 	      �?max 	      0@stepSize 	      �?defaultValue 	      �?isPluginParameter 1 tooltip Controls the number of voices height 	     �F@width 	     �F@numStrips 	     @Y@scaleFactor 	   `ff�?showValuePopup Right filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component type ScriptSlider id Width x 	     �g@y 	     �O@parentComponent MainSynthComponents processorId Syntesizer Group1 parameterId UnisonoSpread max 	       @mode NormalizedPercentage middlePosition 	      �?defaultValue 	      �?isPluginParameter 1 tooltip Control the stereo width numStrips 	     @Y@scaleFactor 	   `ff�?showValuePopup Right width 	     �F@height 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component type ScriptPanel id Saturation x 	      3@y 	     @k@width 	     �t@height 	      V@itemColour2 	   �    itemColour 	   �    Component type ScriptSlider id Drive x 	      $@y 	      3@parentComponent Saturation macroControl 	Macro 1 min 	      �?max 	     �_@stepSize 	      �?isPluginParameter 1 tooltip /Controls the aggressiveness of the distortion processorId Saturator1 parameterId Saturation width 	     �F@numStrips 	     @Y@scaleFactor 	   `ff�?showValuePopup Right height 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component type ScriptSlider id SaturationMix x 	     �g@y 	      3@parentComponent Saturation text Mix processorId Saturator1 parameterId WetAmount isPluginParameter 1 tooltip #Controls the amount of distortion width 	     �F@scaleFactor 	   `ff�?showValuePopup Right numStrips 	     @Y@height 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component type ScriptPanel id Reverb x 	     �h@y 	     �t@width 	     �c@height 	     �a@itemColour 	   �    itemColour2 	   �    Component type ScriptSlider id ReverbWet x 	      $@y 	     @T@parentComponent Reverb text Reverb Wet processorId Simple Reverb1 parameterId 
WetLevel mode NormalizedPercentage suffix % middlePosition 	      �?isPluginParameter 1 tooltip  Controls rthe amount of reverb width 	     �F@scaleFactor 	   `ff�?numStrips 	     @Y@showValuePopup Right height 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component type ScriptSlider id Size x 	      $@y 	      (@parentComponent Reverb processorId Simple Reverb1 parameterId 
RoomSize mode NormalizedPercentage suffix % middlePosition 	      �?isPluginParameter 1 tooltip !Controls the size of the reverb numStrips 	     @Y@scaleFactor 	   `ff�?showValuePopup Right width 	     �F@height 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component 
type ScriptButton id lockReverb x 	     �^@y 	      L@parentComponent Reverb text  width 	      ?@height 	      ?@scaleFactor 	      �?filmstripImage  {PROJECT_FOLDER}lock_icon3.png  Component type ScriptPanel id Delay x 	      3@y 	     �t@width 	      c@height 	     @a@itemColour 	   �    itemColour2 	   �    Component type ScriptSlider id 
DelayMix x 	      $@y 	     @T@parentComponent Delay text Delay Wet processorId Delay1 parameterId Mix mode NormalizedPercentage suffix % middlePosition 	      �?isPluginParameter 1 tooltip Controls the amount of delay width 	     �F@numStrips 	     @Y@scaleFactor 	   `ff�?showValuePopup Right height 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component type ScriptSlider id 
Feedback x 	      $@y 	      (@parentComponent Delay macroControl 	Macro 2 min 	      �?max 	     �_@stepSize 	      �?isPluginParameter 1 tooltip ,Controls the amount of feedback from delay processorId Delay1 parameterId FeedbackLeft showValuePopup Right numStrips 	     @Y@scaleFactor 	   `ff�?width 	     �F@height 	     �F@filmstripImage ${PROJECT_FOLDER}knob_dial1 (3).png  Component 
type ScriptButton id lockDelay x 	     �]@y 	     �K@parentComponent Delay text  width 	      ?@height 	      ?@scaleFactor 	      �?filmstripImage  {PROJECT_FOLDER}lock_icon3.png  Component type ScriptButton id Randomize All x �  y �   processorId Syntesizer Group1 isMetaParameter width 	     �`@height 	     �F@scaleFactor 	   `ff�?numStrips 	      @filmstripImage {PROJECT_FOLDER}button_3.png  Component type ScriptFloatingTile id 
Keyboard x     y �  width 	�      height 	P       ContentType 
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
}  Component type ScriptSlider id KnobRange x 	     �v@y 	     @e@style Horizontal width 	     �Y@height 	      :@max 	      �?middlePosition 	      �?min 	      �?bgColour 	~~~o    itemColour 	333�    itemColour2 	k     Component 	type ScriptButton id Update x �  y �   width 	�       height 	-       numStrips 	      @scaleFactor 	   `ff�?filmstripImage {PROJECT_FOLDER}button_3.png  Component 	type ScriptButton id lockSaturator x 	     pv@y 	     �n@text  width 	      ?@height 	      ?@filmstripImage  {PROJECT_FOLDER}lock_icon3.png scaleFactor 	      �? Component 	type ScriptButton id lockSynthesizer x 	     �v@y 	      [@text  width 	      ?@height 	      ?@scaleFactor 	      �?filmstripImage  {PROJECT_FOLDER}lock_icon3.png  Component type ScriptFloatingTile id FloatingTile1 x 	     ؂@y 	      @width 	     ��@height 	     �}@ContentType PresetBrowser bgColour 	   �    itemColour 	����    itemColour2 	����    Data �{
  "ShowSaveButton": true,
  "ShowFolderButton": true,
  "ShowNotes": true,
  "ShowEditButtons": true,
  "ShowFavoriteIcon": true,
  "NumColumns": 3
}  Component type ScriptLabel id Label1 x 	     �S@y 	      U@width 	     @Q@height 	      8@text 
Wave Mix editable  Component type ScriptLabel id Label2 x 	     @S@y 	      b@width 	     @Q@height 	      8@text Detune editable  Component type ScriptLabel id Label3 x 	     @p@y 	      U@width 	     @Q@height 	      8@text Width editable  Component type ScriptLabel id Label4 x 	     0p@y 	      b@text Voices width 	     @Q@height 	      8@editable  Component type ScriptLabel id Label5 x 	     0}@y 	      B@text Master Gain width 	      S@height 	      8@editable  Component type ScriptLabel id Label6 x 	     �Q@y 	     �n@text Drive width 	     @Q@height 	      8@editable  Component type ScriptLabel id Label7 x 	      p@y 	     �n@text Saturation Mix width 	     @U@height 	      8@editable  Component type ScriptLabel id Label8 x 	     p}@y 	     �r@text Rate width 	     @Q@height 	      8@editable  Component type ScriptLabel id Label9 x 	      R@y 	     @z@text Delay width 	     @Q@height 	      8@editable  Component type ScriptLabel id 	Label10 x 	     �n@y 	     �u@text Size width 	     @Q@height 	      8@editable  Component type ScriptLabel id 	Label11 x 	     �o@y 	     @z@text Reverb Wet width 	     �T@height 	      8@editable  Component type ScriptLabel id 	Label12 x 	     @Q@y 	     �u@text 
Feedback width 	     �T@editable  Component 	type ScriptLabel id 	Label13 x 	     h�@y 	      f@text Update width 	      I@height 	      .@editable enabled  Component type ScriptLabel id 	Label14 x 	     �|@y 	     �j@text Randomize All editable width 	      Y@enabled  Component type ScriptLabel id 	Label15 x 	     �|@y 	      p@text Randomize width 	      Y@editable enabled  Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type GlobalModulatorContainer ID Global Modulator Container1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Global Modulators Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type LFO ID LFO Modulator2 Bypassed Intensity 	      �?Frequency 	      $@FadeIn 	   �=
@WaveformType 	      @Legato 	        TempoSync 	      �?SmoothingTime 	   ��@LoopEnabled 	      �?CustomWaveform %24...............vO...f+....9C...vO StepData [64....f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+....9C...3O...f+. EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID LFO Intensity Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID LFO Frequency Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SynthGroup ID Syntesizer Group1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	     �I@KillFadeTime 	      4@IconColour 0 EnableFM 	        CarrierIndex 	      �ModulatorIndex 	      �?UnisonoVoiceAmount 	      @UnisonoDetune 	   �yD�?UnisonoSpread 	   @߽�?KillSecondVoices 	      �?EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleEnvelope ID DefaultEnvelope Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	      *@Release 	      8@LinearMode 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type GlobalTimeVariantModulator ID  Global Time Variant Modulator1 Bypassed Intensity 	      �?UseTable Inverted TableData u84...............vOZq.h9XU9s8C...vOFWQr930OI7C...vO5qP89L93u3C...vO.ZB+9.crd8C...vOz1Q.+fxnE2C...vO...f+....9C...vO Connection ,Global Modulator Container1:LFO Modulator2 EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleReverb ID Simple Reverb1 Bypassed RoomSize 	    ��?Damping 	    ף�?WetLevel 	    �G�?DryLevel 	    �p�?Width 	   ���?FreezeMode 	   ����?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Delay ID Delay1 Bypassed DelayTimeLeft 	       @DelayTimeRight 	      "@FeedbackLeft 	        FeedbackRight 	        LowPassFreq 	     ��@HiPassFreq 	      D@Mix 	   @P_�?TempoSync 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type Saturator ID Saturator1 Bypassed Saturation 	   �]��?WetAmount 	   �X�?PreGain 	        PostGain 	   � .�EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Saturation Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type SimpleGain ID Simple Gain1 Bypassed Gain 	      (@Delay 	        Width 	      Y@Balance 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type ModulatorChain ID Detune Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Spread Mod Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type WaveSynth ID Waveform Generator2 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 OctaveTranspose1 	        OctaveTranspose2 	      �Detune1 	        Detune2 	        WaveForm1 	      @WaveForm2 	      @Pan1 	        Pan2 	        Mix 	    ���?EnableSecondOscillator 	      �?PulseWidth1 	      �?PulseWidth2 	      �?EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Mix Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name Drive value 86.6825408935546875 midi_cc -1 controlled_parameter 	id Saturator1 parameter 0 parameter_name Saturation min 0 max 1 low 0 high 1 inverted 0 readonly 1  controlled_parameter 	id Saturator1 parameter 3 parameter_name Post Gain min -24 max 0 low 0 high -22 inverted 0 readonly 1  macro name 
Feedback value 0 midi_cc -1 controlled_parameter 	id Delay1 parameter 2 parameter_name Left Feedback min 0 max 1 low 0 high 1 inverted 0 readonly 1  controlled_parameter 	id Delay1 parameter 3 parameter_name Right Feedback min 0 max 1 low 0 high 1 inverted 0 readonly 1  macro name 	Macro 3 value 0 midi_cc -1  macro name 	Macro 4 value 0 midi_cc -1  macro name 	Macro 5 value 0 midi_cc -1  macro name 	Macro 6 value 0 midi_cc -1  macro name 	Macro 7 value 0 midi_cc -1  macro name 	Macro 8 value 0 midi_cc -1  MidiAutomation   MPEData Enabled  