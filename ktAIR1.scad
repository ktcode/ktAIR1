//
// ktAIR1
//

gap1 = 0.001;
gap2 = 0.002;
th = 2;



A = 1;
B = 1;
C = 1;

if(A)
{
    fan( -(24.5+th*3)/2 );
}
if(B)
{
    socket_a( 25/2 );
    filter1( 35/2 );
}
if(C)
{
    filter2( 105 );
    rear( 140+th/2 );
}



module fan( y=0 )
{
    translate( [0, y, 0] )
    {
        difference()
        {
            cube( [157+th*2, 24.5+th, 161+th*2], center=true );
            translate ( [0, th/2, -((161+th*2)-139)/2+th] ) cube( [139, 24.5+gap2, 139], center=true );
            translate ( [0, -((24.5+th)/2)+th, -((161+th*2)-139)/2+th] ) rotate( [90, 0, 0] ) cylinder( th*2, 135/2, 135/2, $fn=100 );
            translate ( [161/2-(157-139)/4-th/2, th/2, 0] ) cube( [(157-139)/2-th, 24.5+gap2, 161], center=true );
            translate ( [-(161/2-(157-139)/4-th/2), th/2, 0] ) cube( [(157-139)/2-th, 24.5+gap2, 161], center=true );
            translate ( [0, th/2, 161/2-(161-139)/2+th/2] ) cube( [157, 24.5+gap2, 161-139-th], center=true );
            translate ( [161/2, 19, -161/2+22] ) rotate( [0, 0, 10] ) cube( [50, 20, 5], center=true );
        }
    }
}

module socket_a( y=0 )
{
    translate( [0, y, 0] )
    {
        difference()
        {
            union()
            {
                translate ( [0, 0, -30/2] ) cube( [124, 25, 130], center=true );
                translate ( [0, -25/2-th/2, 0] ) cube( [157+th*2, th, 161+th*2], center=true );
            }
            translate ( [0, -th/2, -30/2] ) cube( [124-th, 25+th+gap2, 130-th], center=true );
        }
    }
}

module filter1( y=0 )
{
    translate( [0, y, 0] )
    {
        difference()
        {
            cube( [157+th*2, 35, 161+th*2], center=true );
            cube( [157, 35+gap2, 161], center=true );
            translate ( [0, th, -161/2-th/2] ) cube( [124+4, 35+2, th*2], center=true );
        }
    }
}

module filter2( y=0 )
{
    translate( [0, y/2, 0] )
    {
        difference()
        {
            cube( [157+th*2, 35, 161+th*2], center=true );
            cube( [157, 35+gap2, 161], center=true );
        }
    }
}

module rear( y=0 )
{
    translate( [0, y/2, 0] )
    {
        difference()
        {
            cube( [157+th*2, th, 161+th*2], center=true );
            $fn=50;
            rotate( [90, 0, 0] )
            {
                minkowski()
                {
                  cube( [133-10*2, 127-10*2, 25], center=true );
                  cylinder( r=10, h=1 );
                }
            }
        }
    }
}