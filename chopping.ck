SndBuf buf => dac;
buf.read("/Users/tom/Downloads/24930__vexst__basic-break.wav");
buf.length()/32 => dur beat_d;
buf.samples()/32 => int beat_i;
int length, repeats, measure_pos;
while(true)
{
    
    Math.rand2(1,8) => length;
    Math.rand2(1,8/length) => repeats;
    Math.rand2(0,31)*beat_i => measure_pos;
    <<<measure_pos/beat_i>>>;
    for(0=>int i;i<repeats;i++)
    {
        measure_pos => buf.pos;
        beat_d*length => now;
    }
}