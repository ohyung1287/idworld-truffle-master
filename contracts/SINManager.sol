pragma solidity ^0.5.0;
import './Zeppelin/ownership/Ownable.sol';

// TODO
// only manager ethereum account have access of this contract

contract SINManager is Ownable{
	mapping (string => bool) private SINToCredit; 
    function updateCredit(string memory SIN, bool credit) public onlyOwner{  
        SINToCredit[SIN] = credit;
    }
    function getCredit(string memory SIN) public returns(bool credit){
        return SINToCredit[SIN];
    }
}