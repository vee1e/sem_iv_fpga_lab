// UDP for a 2-input AND gate
primitive udp_and2 (z1, x1, x2); // Output is listed first
    input x1, x2;
    output z1;

    // Define state table
    table
        // Inputs are the same order as the input list
        // x1 x2 : z1; comment is for readability
        0 0 : 0;
        0 1 : 0;
        1 0 : 0;
        1 1 : 1;
    endtable
endprimitive

// UDP for a 3-input OR gate
primitive udp_or3 (z1, x1, x2, x3); // Output is listed first
    input x1, x2, x3;
    output z1;

    // Define state table
    table
        // Inputs are the same order as the input list
        // x1 x2 x3 : z1; comment is for readability
        0 0 0 : 0;
        0 0 1 : 1;
        0 1 0 : 1;
        0 1 1 : 1;
        1 0 0 : 1;
        1 0 1 : 1;
        1 1 0 : 1;
        1 1 1 : 1;
    endtable
endprimitive

// Sum of products using UDPs for the AND gate and OR gate
module udp_sop (x1, x2, x3, x4, z1);
    input x1, x2, x3, x4;
    output z1;

    // Define internal nets
    wire net1, net2, net3;

    // Instantiate the UDPs
    udp_and2 (net1, x1, x2);
    udp_and2 (net2, x3, x4);
    udp_and2 (net3, ~x2, ~x3);
    udp_or3 (z1, net1, net2, net3);
endmodule