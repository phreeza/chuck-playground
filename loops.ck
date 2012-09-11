Flute f => Delay d1 =>PitShift pit => Delay d2 => LPF lo =>  Dyno l => dac;
l=>d1; l=>d2; 
//adc => d1;
2800 => lo.freq;
1.1 => pit.shift;
1.0 => pit.gain;
2::second => d1.max => d1.delay;
700::ms=> d2.max => d2.delay;
l.limit();
0.9 => d2.gain;
0.8 => d1.gain;
while(Std.rand2(1,4)::second=>now)
{
Std.rand2(100,5000)=>f.freq;
f.noteOn(1.5);
Std.rand2f(0.2,1.0)::second => now;
f.noteOff(1.5);
}