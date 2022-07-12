Source Code : SR-FF
    module SRFF_POSEDGE_TRIGGER(q,qbar,s,r,clk);
    output reg q=1'b0;
    output reg qbar=1'b1;
    input s,r,clk;
    always@(posedge clk)

    if(clk==0)
    begin
    q=q;
    q=qbar;
    end

    else if((s==0)&(r==0)&(clk==1))
    begin
      q=q;
      qbar=qbar;
    end

    else if((s==0)&(r==1)&(clk==1))
    begin
      q=0;
      qbar=1;
    end

    else if((s==1)&(r==0)&(clk==1))
    begin
      q=1;
      qbar=0;
    end

    else if((s==1)&(r==1)&(clk==1))
    begin
      q=1'bx;
      qbar=1'bx;
    end

    endmodule

Test Bench : SR-FF
    module SRFF_POSEDGE_TRIGGER_TB;

      // Inputs
      reg s;
      reg r;
      reg clk;

      // Outputs
      wire q;
      wire qbar;

      // Instantiate the Unit Under Test (UUT)
      SRFF_POSEDGE_TRIGGER uut (
        .q(q), 
        .qbar(qbar), 
        .s(s), 
        .r(r), 
        .clk(clk)
      );

      initial 
      begin
      $monitor($time,"clk=%b,s=%b,r=%b,q=%b,qbar=%b",clk,s,r,q,qbar);
        // Initialize Inputs
        s = 0;
        r = 0;
        clk = 0;
      end
      always #5 clk = ~clk;
      always #10 s = s + 1;
      always #20 r = r + 1;

    endmodule
______________________________________________________________________________________________________________________________________________________________________

Source Code : D-FF
    module DFF_POSEDGE_TRIGGER(q,qbar,d,clk);
    output reg q=1'b0;
    output reg qbar=1'b1;
    input d,clk;
    always@(posedge clk)
    if (clk==0)
    begin
    q=q;
    qbar=qbar;
    end

    else if ((d==0)&(clk==1))
    begin
      q=0;
      qbar=1;
    end

    else 
    begin
      q=1;
      qbar=0;
    end

    endmodule
Test Bench : D-F
    module DFF_POSEDGE_TRIGGER_TB;

      // Inputs
      reg d;
      reg clk;

      // Outputs
      wire q;
      wire qbar;

      // Instantiate the Unit Under Test (UUT)
      DFF_POSEDGE_TRIGGER uut (
        .q(q), 
        .qbar(qbar), 
        .d(d), 
        .clk(clk)
      );

      always #5 clk=~clk;
      initial 
      begin
      $monitor($time,"q=%b,qbar=%b,d=%b,clk=%b",q,qbar,d,clk);
        // Initialize Inputs
        d = 0;
        clk = 0;
      end
    always #12 d = d + 1;
    endmodule
______________________________________________________________________________________________________________________________________________________________________
______________________________________________________________________________________________________________________________________________________________________

Source Code : JK-FF
    module JKFF_POSEDGE_TRIGGER(q,qbar,j,k,clk);
    output reg q=1'b0;
    output reg qbar=1'b1;
    input j,k,clk;
    always@(posedge clk)

    if(clk==0)
    begin
    q=q;
    q=qbar;
    end

    else if((j==0)&(k==0)&(clk==1))
    begin
      q=q;
      qbar=qbar;
    end

    else if((j==0)&(k==1)&(clk==1))
    begin
      q=0;
      qbar=1;
    end

    else if((j==1)&(k==0)&(clk==1))
    begin
      q=1;
      qbar=0;
    end

    else if((j==1)&(k==1)&(clk==1))
    begin
      q=~q;
      qbar=~qbar;
    end

    endmodule
Test Bench : JK-F
    module JKFF_POSEDGE_TRIGGER_TB;

      // Inputs
      reg j;
      reg k;
      reg clk;

      // Outputs
      wire q;
      wire qbar;

      // Instantiate the Unit Under Test (UUT)
      JKFF_POSEDGE_TRIGGER uut (
        .q(q), 
        .qbar(qbar), 
        .j(j), 
        .k(k), 
        .clk(clk)
      );

      initial 
      begin
      $monitor($time,"clk=%b,j=%b,k=%b,q=%b,qbar=%b",clk,j,k,q,qbar);
        // Initialize Inputs
        j = 0;
        k = 0;
        clk = 0;
      end
      always #5 clk = ~clk;
      always #10 j = j + 1;
      always #20 k = k + 1;

    endmodule
______________________________________________________________________________________________________________________________________________________________________
______________________________________________________________________________________________________________________________________________________________________

Source Code : T-FF
    module TFF_POSEDGE_TRIGGER(q,qbar,t,clk);
    output reg q=1'b0;
    output reg qbar=1'b1;
    input t,clk;
    always@(posedge clk)

    if(clk==0)
    begin
    q=q;
    q=qbar;
    end

    else if((t==0)&(clk==1))
    begin
      q=q;
      qbar=qbar;
    end

    else if((t==1)&(clk==1))
    begin
      q=~q;
      qbar=~qbar;
    end

    endmodule
Test Bench : T-F
    module TFF_POSEDGE_TRIGGER_TB;

      // Inputs
      reg t;
      reg clk;

      // Outputs
      wire q;
      wire qbar;

      // Instantiate the Unit Under Test (UUT)
      TFF_POSEDGE_TRIGGER uut (
        .q(q), 
        .qbar(qbar), 
        .t(t), 
        .clk(clk)
      );

      initial 
      begin
      $monitor($time,"clk=%b,t=%b,q=%b,qbar=%b",clk,t,q,qbar);
        // Initialize Inputs
        t = 0;
        clk = 0;
      end
      always #5 clk = ~clk;
      always #10 t = t + 1;

    endmodule
______________________________________________________________________________________________________________________________________________________________________
