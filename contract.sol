pragma solidity ^0.4.18;

contract cards{
   
   struct Card{
       string cardType;
       string cardName;
       string name;
       string email;
       string addr;
       string mno;
       string adhaarnumber;
   }
   
   

   mapping (address => string[]) UserCardNameMapping;
   mapping (address => Card[]) UserCardsMapping;
   
   
   function AddCard(address useraddr,string cardType, string cardName, string name, string email, string addr, string mno, string adhaarnumber) public{
       uint index = isCardPresent(useraddr, cardName);
       UserCardsMapping[useraddr][index] = Card(cardType, cardName, name, email, addr, mno, adhaarnumber);
       
       
       //UserCardsMapping[useraddr].push(Card(cardType, cardName, name, email, addr, mno, adhaarnumber));
   }
   
   function isCardPresent(address useraddr, string cardtype) public view returns(uint index){
       for(uint i=0; i< UserCardNameMapping[useraddr].length; i++ ){
           if(keccak256(cardtype) == keccak256(UserCardNameMapping[useraddr][i])){
               return i;
           }
       }
       return UserCardNameMapping[useraddr].length;
   }
   
   
   
   function getCard(address useraddr, uint index) public view returns(string cardType, string cardName, string name, string email, string addr,  string mno){
       return (UserCardsMapping[useraddr][index].cardType,UserCardsMapping[useraddr][index].cardName
       ,UserCardsMapping[useraddr][index].name,UserCardsMapping[useraddr][index].email,
       UserCardsMapping[useraddr][index].addr,UserCardsMapping[useraddr][index].mno);
   }
   
   function getCardAdhaarNumber(address useraddr, uint index) public view returns(string adhaarnumber){
       return (UserCardsMapping[useraddr][index].adhaarnumber);
   }
   
}
