package com.struts.lifeRewardscard;

public class CardStatusForm {
String custId;
String lifewardsCard;
String cardExpiryDate;
int status;
String clientNo;
String custName;
public String getCustName() {
	return custName;
}
public void setCustName(String custName) {
	this.custName = custName;
}
public String getClientNo() {
	return clientNo;
}
public void setClientNo(String clientNo) {
	this.clientNo = clientNo;
}
public String getCustId() {
	return custId;
}
public void setCustId(String custId) {
	this.custId = custId;
}
public String getLifewardsCard() {
	return lifewardsCard;
}
public void setLifewardsCard(String lifewardsCard) {
	this.lifewardsCard = lifewardsCard;
}
public String getCardExpiryDate() {
	return cardExpiryDate;
}
public void setCardExpiryDate(String cardExpiryDate) {
	this.cardExpiryDate = cardExpiryDate;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}

}
