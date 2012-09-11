SndBuf buf => Delay d1 => Delay d2 => PitShift pit =>LPF lo =>  Dyno l => dac;
l=>d1; l=>d2; 
//adc => d1;
MAUI_Slider d1_gain_slider;
d1_gain_slider.range(0.,1.);
d1_gain_slider.name("d1 gain");


MAUI_Slider d2_gain_slider;
d2_gain_slider.range(0.,1.);
d2_gain_slider.name("d2 gain");
d2_gain_slider.position(0,d2_gain_slider.height());

MAUI_Slider d1_delay_slider;
d1_delay_slider.range(0.,5.);
d1_delay_slider.name("d1 delay");
d1_delay_slider.position(0,2*d2_gain_slider.height());

MAUI_Slider d2_delay_slider;
d2_delay_slider.range(0.,1.);
d2_delay_slider.name("d2 delay");
d2_delay_slider.position(0,3*d2_gain_slider.height());

MAUI_View control_view;
control_view.addElement(d1_gain_slider);
control_view.addElement(d2_gain_slider);
control_view.addElement(d1_delay_slider);
control_view.addElement(d2_delay_slider);
control_view.display();

1900 => lo.freq;
1.0 => pit.shift;
1.0 => pit.gain;
now => time start;
buf.read("/Users/tom/Downloads/24930__vexst__basic-break (1).wav");
//buf.read("/Users/tom/Downloads/156550__acclivity__a-dream-within-a-dream.wav");
5::second => d1.max => d1.delay;
5::second=> d2.max => d2.delay;
l.limit();
0.5 => d2.gain;
0.9 => d1.gain;
//while(true)
fun void watch()
{
    while(10::ms=>now){
d1_gain_slider.value() => d1.gain;
d1_delay_slider.value()::second => d1.delay;
d2_gain_slider.value() => d2.gain;
d2_delay_slider.value()::second => d2.delay;
}
    }
spork ~ watch();
while(Std.rand2(1,4)::second=>now)
{
Std.rand2(0,buf.samples())=>buf.pos;
//Std.rand2f(-1.0,1.0) => buf.rate;
Std.rand2f(0.7,1.0) => buf.gain;
Std.rand2f(0.2,3.0)::second => now;
0.0 => buf.gain;
//0.5 + Math.exp( -Math.pow(0.5+(start-now)/3::minute,2)/.1)/2=>d2.gain;
//4*(0.5+Math.sin(Math.PI*(start-now)/1::minute)/2)::second => d1.delay;
}