
SndBuf buf => dac;
//For example use the Amen break by VEXST http://www.freesound.org/people/VEXST/sounds/24930/
buf.read("/Users/tom/Downloads/24930__vexst__basic-break.wav");

buf.length()/32 => dur beat_d;
buf.samples()/32 => int beat_i;
int length, repeats, measure_pos,subdiv;
float glide;
0.1 => float p_glide;
0=>int current;
3=>int align_bars;
while(true)
{
    
    do
    {
        Math.rand2(0,3) => length;
        2*length + 1 => length;
        Math.rand2(1,8/length) => repeats;
    } 
    while(current + length*repeats > align_bars*8);
    Math.rand2(0,32-length)*beat_i => measure_pos;
    Std.randf() => glide;
    for(0=>int i;i<repeats;i++)
    {
        if (repeats > 1 && glide>p_glide)
            0.9 + (0.1*i)/repeats => buf.rate;
        else
            1.0 => buf.rate;
        measure_pos => buf.pos;
        (current + length) % (8*align_bars) => current;
        beat_d*length => now;
    }
}