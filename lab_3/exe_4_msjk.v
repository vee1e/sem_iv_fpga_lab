module exe_4_msjk(
    input J,
    input K,
    input clk,
    input reset,
    output wire Q,
    output wire Q_bar
);

    reg master_Q, master_Q_bar, slave_Q, slave_Q_bar;
    reg master_clk, slave_clk;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            master_Q <= 0;
            master_Q_bar <= 1;
        end else begin
            if (J && ~K)
                master_Q <= 1;
            else if (~J && K)
                master_Q <= 0;
            else if (J && K)
                master_Q <= ~master_Q;
            else
                master_Q <= master_Q;
            master_Q_bar <= ~master_Q;
        end
    end

    always @(negedge clk or posedge reset) begin
        if (reset) begin
            slave_Q <= 0;
            slave_Q_bar <= 1;
        end else begin
            slave_Q <= master_Q;
            slave_Q_bar <= master_Q_bar;
        end
    end

    assign Q = slave_Q;
    assign Q_bar = slave_Q_bar;

endmodule
