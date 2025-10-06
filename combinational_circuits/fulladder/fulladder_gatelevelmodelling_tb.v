module fulladder_gatelevel_tb;
    reg a, b, cin;
    wire carry, sum;

    fulladder_gatelevel uut(carry, sum, a, b, cin);

    initial begin
        $dumpfile("fulladder_gatelevel.vcd");
        $dumpvars(0, fulladder_gatelevel_tb);

        $monitor($time, " a=%b b=%b cin=%b | Carry=%b Sum=%b", a, b, cin, carry, sum);

        // Apply all combinations
        a=0;b=0;cin=0; #50;
        a=0;b=0;cin=1; #50;
        a=0;b=1;cin=0; #50;
        a=0;b=1;cin=1; #50;
        a=1;b=0;cin=0; #50;
        a=1;b=0;cin=1; #50;
        a=1;b=1;cin=0; #50;
        a=1;b=1;cin=1; #50;

        $finish;
    end
endmodule