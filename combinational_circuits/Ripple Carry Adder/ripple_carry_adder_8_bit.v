module ripple_carry_adder_8_bit (cout,sum,a,b,cin);
output cout;
output [7:0]sum;
input [7:0]a,b;
input cin;
wire c0,c1,c2,c3,c4,c5,c6;
fulladder FA0(c0  ,sum[0],a[0],b[0],cin);
fulladder FA1(c1  ,sum[1],a[1],b[1],c0);
fulladder FA2(c2  ,sum[2],a[2],b[2],c1);
fulladder FA3(c3  ,sum[3],a[3],b[3],c2);
fulladder FA4(c4  ,sum[4],a[4],b[4],c3);
fulladder FA5(c5  ,sum[5],a[5],b[5],c4);
fulladder FA6(c6  ,sum[6],a[6],b[6],c5);
fulladder FA7(cout,sum[7],a[7],b[7],c6);
endmodule
