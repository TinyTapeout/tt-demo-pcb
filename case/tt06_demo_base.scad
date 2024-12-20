/* 
 * Base for Tiny Tapeout 06+ Demoboard
 *
 * Design: hxr.social/@thomasflummer
 *
 * License: CC-BY-SA
 *
 */

/*
 * Variables for Customizer
 * ==================================================================
 *
 */

// select type of mounting hardware
Screw_Type = "M2 with insert"; // [M3 direct, M2 with insert]

//-----------------
/* [AdditionalSettings] */ 

// total height (in mm)
Height = 8;

module pcb_base(width, length, pcb_thickness, corner_radius, height, mounting_hole_diameter)
{
    difference()
    {
        union()
        {
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(width/2 - corner_radius), y*(length/2 - corner_radius), height/2])
                            cylinder(r = corner_radius + 2, h = height, center = true, $fn = 150);
                    }
                }

                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(width/2 - corner_radius), y*(length/2 - corner_radius), height/2])
                            cylinder(r = corner_radius + 2 + 0.5, h = height-1, center = true, $fn = 150);
                    }
                }
            }        
        }
        union()
        {
            // PCB cutout
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(width/2 - corner_radius), y*(length/2 - corner_radius), height - pcb_thickness/2])
                            cylinder(r = corner_radius + 0.4, h = pcb_thickness + 0.01, center = true, $fn = 150);
                    }
                }
            }

            // space for PTH pins and rubber feet
            hull()
            {
                for(x = [-1, 1])
                {
                    for(y = [-1, 1])
                    {
                        translate([x*(width/2 - corner_radius), y*(length/2 - corner_radius), height/2 + 1.5])
                            cylinder(r = corner_radius - 1, h = height, center = true, $fn = 150);
                    }
                }
            }
        }
    }
    // studs for screws/inserts
    
    for(x = [-1, 1])
    {
        for(y = [-1, 1])
        {
            if(x == 1 && y == -1)
            {
                difference()
                {
                    translate([x*(width/2 - 3.5), y*(length/2 - 8), (height - pcb_thickness)/2])
                        cylinder(d = 6, h = height - pcb_thickness, center = true, $fn = 150);

                    translate([x*(width/2 - 3.5), y*(length/2 - 8), (height - pcb_thickness)/2])
                        cylinder(d = mounting_hole_diameter, h = height - pcb_thickness + 0.01, center = true, $fn = 150);
                }
            }
            else
            {
                difference()
                {
                    translate([x*(width/2 - 3.5), y*(length/2 - 3.5), (height - pcb_thickness)/2])
                        cylinder(d = 6, h = height - pcb_thickness, center = true, $fn = 150);

                    translate([x*(width/2 - 3.5), y*(length/2 - 3.5), (height - pcb_thickness)/2])
                        cylinder(d = mounting_hole_diameter, h = height - pcb_thickness + 0.01, center = true, $fn = 150);
                }
            }
        }
    }

    
}


if(Screw_Type == "M2 with insert")
{
    pcb_base(99.5, 78, 1.6, 3.0, Height, 3.3);
}

if(Screw_Type == "M3 direct")
{
    pcb_base(99.5, 78, 1.6, 3.0, Height, 2.9);
}