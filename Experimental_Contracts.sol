pragma solidity 0.8.0;
pragma experimental ABIEncoderV2;

// This contract converts the characters inside a string to lowercase
contract Test{
    
   string public s;
   
    constructor(){
        s="PaVanKUmaR";
    }
    
    function f1() public  {
        string memory str = s;
        bytes memory bStr = bytes(str);
		bytes memory bLower = new bytes(bStr.length);
		for (uint i = 0; i < bStr.length; i++) {
			// Uppercase character...
			if ((uint8(bStr[i]) >= 65) && (uint8(bStr[i]) <= 90)) {
				// So we add 32 to make it lowercase
				bLower[i] = bytes1(uint8(bStr[i]) + 32);
			} else {
				bLower[i] = bStr[i];
			}
		}
		s = string(bLower);
    } 
}

**************************************************************

// This contract converts the bytes to string(more than 32 bytes)
contract test2{
    bytes32 public a;
    bytes32 public d;
    string public b;
    uint8 public sz;
    string public c;

    
    constructor(){
        b = 'abcdefghijklmnopqrstuvwxyz12345678';
    }
    
    function f1() public{
        bytes32  x;
        bytes32 z;
        string memory y = b;
        
        assembly {
			x := mload( add(y, 32) )
			z := mload( add(y, 64) )
		}
		
		a = x;
		d = z;
		sz = z.length;
		c = string(abi.encodePacked(x,z));
		// c = string(x);
    }
}

**************************************************************************

contract Test{
    
    string public s;
    bool public b;
    uint public num;
    bytes public by;
    bytes1 public b1;
   
    constructor(){
        s="Pavan";
    }
    
    function f1() public {
        string memory a = "abcdefghijklmnopqrstuvwxyz123456";
        bool b = true;
        uint16 c = 255;
        bytes memory p = bytes(abi.encodePacked(a,b,c));
        //f2(p);
        by = p;
        b1 = p[34];
    }
    
    function f2(bytes memory params) public{
        string memory x;
        bool y;
        uint z;
        assembly {
			x := mload(add(params, 0x20))
			y := byte(0, mload(add(params, 0x40)) )
			z := mload(add(params, 0x60))
		}
		s = x;
		b = y;
		num = z;
    }  
}