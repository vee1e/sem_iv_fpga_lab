module testbench;
  reg [64:1] M;
  reg [64:1] K;
  wire [64:1] ENC_OUT;
  wire [64:1] DEC_OUT;

  // Instantiate Encryption and Decryption Modules
  DES_enc des_enc_inst(M, K, ENC_OUT);
  DES_dec des_dec_inst(ENC_OUT, K, DEC_OUT);

  integer i;

  initial begin
    for (i = 1; i <= 5; i = i + 1) begin
      M = {$random, $random};  // Generate random message
      K = {$random, $random};  // Generate random key
      #1; // Allow time for encryption
      #1; // Allow time for decryption

      $display("Test %d:", i);
      $display("M       = 0x%x", M);
      $display("K       = 0x%x", K);
      $display("ENC_OUT = 0x%x", ENC_OUT);
      $display("DEC_OUT = 0x%x", DEC_OUT);

      // Verify correctness
      if (DEC_OUT !== M)
        $display("ERROR: Decryption failed!");
      else
        $display("Decryption successful.");
    end
    $finish;
  end
endmodule

