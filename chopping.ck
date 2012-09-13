
SndBuf buf => dac;
//For example use the Amen break by VEXST http://www.freesound.org/people/VEXST/sounds/24930/
buf.read("/Users/tom/Downloads/24930__vexst__basic-break.wav");

MAUI_Slider slider;
slider.range( 1, 16 );
slider.display();
1=> int max_subdiv;

buf.length()/32 => dur beat_d;
buf.samples()/32 => int beat_i;
int length, repeats, measure_pos,subdiv;
while(true)
{
    
    Math.rand2(1,8) => length;
    Math.rand2(1,8/length) => repeats;
    Math.rand2(0,32-length)*beat_i => measure_pos;
    <<<measure_pos>>>;
    for(0=>int i;i<repeats;i++)
    {
        Math.floor(slider.value()) $ int=> max_subdiv;
        Math.rand2(1,max_subdiv) => subdiv;
        for(0=>int j;j<subdiv;j++)
        {
            measure_pos => buf.pos;
            Math.rand2f(.8,1.)=>buf.rate;
            beat_d*length/subdiv => now;
        }
    }
}