char_size = 100;
char_h = 10;

line_width = 10;
line_pitch = 16;
line_offset = 5;

base_h = 5;

difference() {
    linear_extrude(char_h)
    text("CSA", font="Ricty", size=char_size);
    translate([0, 0, base_h])
    union() {
        translate([0, line_offset, 0])
            for (i = [-20:20]) {
                translate([0, i * (line_pitch + line_width) + line_offset, 0])
                    cube([char_size * 10, line_width, char_h + base_h]);
            }
    }
}
