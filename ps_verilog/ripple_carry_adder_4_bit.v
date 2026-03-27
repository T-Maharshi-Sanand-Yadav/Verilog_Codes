module ripple_carry_adder_4_bit (cout,sum,a,b,cin);
output cout;
output [3:0]sum;
input [3:0]a,b;
input cin;
wire c0,c1,c2;
fulladder FA0(c0  ,sum[0],a[0],b[0],cin);
fulladder FA1(c1  ,sum[1],a[1],b[1],c0);
fulladder FA2(c2  ,sum[2],a[2],b[2],c1);
fulladder FA3(cout,sum[3],a[3],b[3],c2);
endmodule
