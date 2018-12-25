//
// ktAIR1
//

gap1 = 0.001;
gap2 = 0.002;
th = 2;
fx = 141+th*2;
fy = 141+th*2;
fd = 24.5-5;
fd2 = 5;
cx = 124;
cy = 130;
cd = 25;
cr = 0.7;


A = 0;
B = 0;
C = 0;
D = 1;
E = 1;


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
if(D)
{
    difference()
    {
        translate ( [-fx/2, -fd, 0] ) cube( [fx, fd, fy] );
        translate ( [-fx/2+th, -fd-gap1, th] ) cube( [fx-th*2, fd+gap2, fy-th*2] );
        //translate ( [161/2, -fd-3, +22] ) cube( [50, 20, 5], center=true );
    }
    difference()
    {
        union()
        {
            translate ( [-cx/2, (fy-cy)-th/sqrt(2), 0] ) cube( [cx, cd, cy*2/3] );
            translate ( [-cx/2+4, (fy-cy)-th/sqrt(2)+cd, cy/2+4] ) 
            rotate( [90, 0, 0] )
            minkowski()
            {
                cube( [cx-4*2, cy/2-4*2, cd-1] );
                cylinder( r=4, h=1, $fn=50 );
            }
        }
        translate ( [-cx/2+th*cr, (fy-cy)-th/sqrt(2)-gap1, th*cr] ) cube( [cx-th*2*cr, cd+gap2, cy*2/3-th*2*cr] );
        translate ( [-cx/2+4+th*cr, (fy-cy)-th/sqrt(2)+cd+gap1, cy/2+4+th*cr] ) 
        rotate( [90, 0, 0] )
        minkowski()
        {
            cube( [cx-4*2-th*2*cr, cy/2-4*2-th*2*cr, cd+gap2] );
            cylinder( r=4, h=1, $fn=50 );
        }
    }    
    
    difference()
    {
        union()
        {
            translate ( [-fx/2, 0, 0] ) rotate( [0, 0, -atan(((fx-cx)/2)/(fy-cy))] ) cube( [th, ((fx-cx)/2)/sin(atan(((fx-cx)/2)/(fy-cy))), fy] );
            translate ( [fx/2-(th*cos(atan(((fx-cx)/2)/(fy-cy)))), -(th*sin(atan(((fx-cx)/2)/(fy-cy)))), 0] ) rotate( [0, 0, atan(((fx-cx)/2)/(fy-cy))] ) cube( [th, ((fx-cx)/2)/sin(atan(((fx-cx)/2)/(fy-cy))), fy] );
            translate ( [-fx/2, (fy-cy)-th/sqrt(2), cy-th/sqrt(2)] ) rotate( [45, 0, 0] ) cube( [fx, th, (fy-cy)*sqrt(2)] );
            translate ( [-fx/2, 0, ] ) cube( [fx, (fy-cy), th] );
        }
        translate ( [-fx/2-(th*5*cos(atan(((fx-cx)/2)/(fy-cy)))), (th*5*sin(atan(((fx-cx)/2)/(fy-cy)))), -gap1] ) rotate( [0, 0, -atan(((fx-cx)/2)/(fy-cy))] ) cube( [th*5, ((fx-cx)/2)/sin(atan(((fx-cx)/2)/(fy-cy))), fy+gap2] );
        translate ( [fx/2, 0, -gap1] ) rotate( [0, 0, atan(((fx-cx)/2)/(fy-cy))] ) cube( [th*5, ((fx-cx)/2)/sin(atan(((fx-cx)/2)/(fy-cy))), fy+gap2] );
        translate ( [-fx/2, (fy-cy), cy] ) rotate( [45, 0, 0] ) cube( [fx, th*6, (fy-cy)*sqrt(2)] );
    }
}

if(E)
{
    difference()
    {
        translate ( [-fx/2, -fd-fd2-th, 0] ) cube( [fx, th, fy] );
        translate ( [0, -fd-fd2+th+gap1, fy/2] ) rotate( [90, 0, 0] ) cylinder( th*2+gap2, 120/2, 120/2, $fn=100 );
    }
    translate ( [-3/2, -fd-fd2-th, fx/2] ) cube( [3, th, fx/2] );
    translate ( [-3/2, -fd-fd2-th, fx/2] ) rotate( [0, 120, 0] ) cube( [3, th, fx/2] );
    translate ( [-3/2, -fd-fd2-th, fx/2] ) rotate( [0, 240, 0] ) cube( [3, th, fx/2] );
    translate ( [0, -fd-fd2, fy/2] ) rotate( [90, 0, 0] ) cylinder( th, 55/2, 55/2, $fn=100 );
    
    difference()
    {
        translate ( [-fx/2, -fd-fd2, 0] ) cube( [fx, fd2, fy] );
        translate ( [-fx/2+th, -fd-fd2-gap1, th] ) cube( [fx-th*2, fd+gap2, fy-th*2] );
        translate ( [161/2, -fd-fd2-3, +22] ) cube( [50, 20, 5], center=true );
    }
}


module fan( y=0 )
{
    translate( [0, y, 0] )
    {
        difference()
        {
            translate ( [0, 0, -((161+th*2)-139)/2+th] ) cube( [157+th*2, 24.5+th, fy], center=true );
            translate ( [0, th/2, -((161+th*2)-139)/2+th] ) cube( [139, 24.5+gap2, 139], center=true );
            translate ( [0, -((24.5+th)/2)+th, -((161+th*2)-139)/2+th] ) rotate( [90, 0, 0] ) cylinder( th*2, 135/2, 135/2, $fn=100 );
            translate ( [161/2-(157-139)/4-th/2, th/2, -((161+th*2)-139)/2+th] ) cube( [(157-139)/2-th, 24.5+gap2, 139], center=true );
            translate ( [-(161/2-(157-139)/4-th/2), th/2, -((161+th*2)-139)/2+th] ) cube( [(157-139)/2-th, 24.5+gap2, 139], center=true );
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
                translate ( [0, 0, -30/2] ) cube( [cx, 25, cy], center=true );
                translate ( [0, -25/2-th/2, 0] ) cube( [157+th*2, th, 161+th*2], center=true );
            }
            translate ( [0, -th/2, -30/2] ) cube( [cx-th, 25+th+gap2, cy-th], center=true );
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
            translate ( [0, th, -161/2-th/2] ) cube( [cx+4, 35+2, th*2], center=true );
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