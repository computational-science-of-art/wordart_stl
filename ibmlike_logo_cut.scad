char_size = 100;
char_h = 10;

line_width = 18/3;
line_pitch = 18/3 - 0.2;
line_offset = 3;

base_h = 5;

union() {
// 文字から横線部分を抜く
difference() {

    // 文字
    linear_extrude(char_h)
    text("CSA", font="IBM Block Serif", size=char_size);
    
    // 横線部分
    translate([0, 0, base_h])
    union() {
        translate([0, line_offset, 0])
            for (i = [-20:20]) {
                translate([0, i * (line_pitch + line_width) + line_offset, 0])
                    cube([char_size * 10, line_width, char_h + base_h]);
            }
    }
}

translate([150, 38, 0])
    cube([30, 3, char_h]);
}