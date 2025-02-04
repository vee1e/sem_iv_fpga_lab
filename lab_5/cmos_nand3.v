module cmos_nand3(output Y, input A, B, C);
    pmos p1(Y, vdd, A);
    pmos p2(Y, vdd, B);
    pmos p3(Y, vdd, C);

    wire net1, net2;
    nmos n1(Y, net1, A);
    nmos n2(net1, net2, B);
    nmos n3(net2, gnd, C);
endmodule

