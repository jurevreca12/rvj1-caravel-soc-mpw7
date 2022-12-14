////////////////////////////////////////////////////////////////////////////////                                          
// SPDX-FileCopyrightText: 2022, Jure Vreca                                   //                                          
//                                                                            //                                          
// Licenseunder the Apache License, Version 2.0(the "License");               //                                          
// you maynot use this file except in compliance with the License.            //                                           
// You may obtain a copy of the License at                                    //                                          
//                                                                            //                                          
//      http://www.apache.org/licenses/LICENSE-2.0                            //                                          
//                                                                            //                                          
// Unless required by applicable law or agreed to in writing, software        //                                          
// distributed under the License is distributed on an "AS IS" BASIS,          //                                          
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   //                                          
// See the License for the specific language governing permissions and        //                                          
// limitations under the License.                                             //                                          
// SPDX-License-Identifier: Apache-2.0                                        //                                          
// SPDX-FileContributor: Jure Vreca <jurevreca12@gmail.com>                   //                                          
////////////////////////////////////////////////////////////////////////////////      
////////////////////////////////////////////////////////////////////////////////
// Engineer:       Jure Vre??a - jurevreca12@gmail.com                       //
//                                                                            //
//                                                                            //
//                                                                            //
// Design Name:    less_than_sign_Nb                                          //
// Project Name:   riscv-jedro-1                                              //
// Language:       Verilog                                                    //
//                                                                            //
// Description:    The module checks if a is less than b (a < b).             //
//                 This is for signed (2's complement numbers)                //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module less_than_sign_Nb #(parameter N = 32) (
	input  [N-1:0] a,
	input  [N-1:0] b,
	output reg [N-1:0] r
);

wire [N-2:0]  res_abs;

// This comparator module compares all but the signed bit.
less_than_unsign_Nb #(.N(31)) less_than_unsign_31b_inst ( a[N-2:0], b[N-2:0], res_abs);

always@ (*)
begin
	case ({a[N-1], b[N-1]})
		2'b00 	: r = {1'b0, res_abs};
		2'b10 	: r = 32'b1;
		2'b01	: r = 32'b0;
		default : r = {1'b0, res_abs};
	endcase
end

endmodule
