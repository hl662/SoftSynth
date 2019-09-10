Content.makeFrontInterface(600, 500);

const var GlobalTimeVariantModulator1 = Synth.getModulator("Global Time Variant Modulator1");
const var btnRandomizeAll = Content.addButton('Randomize All',427,220);
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
    Content.getComponent('Detune').setValue(Math.random());
    Content.getComponent('Voices').setValue(Math.randInt(1,16));
    Content.getComponent('Width').setValue(Math.random()+ Math.random());
    Content.getComponent('Drive').setValue(Math.randInt(1,127));
    Content.getComponent('SaturationMix').setValue(Math.random());
    Content.getComponent('ReverbWet').setValue(Math.random());
    Content.getComponent('Size').setValue(Math.random());
    Content.getComponent('MasterGain').setValue(Math.randInt(-100,36));
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
