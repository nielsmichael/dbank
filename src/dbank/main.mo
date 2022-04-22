import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  //currentValue := 300;

  stable var startTime = Time.now();
  //startTime := Time.now();
  Debug.print(debug_show(startTime));

  public func topUp(amt: Float) {
    currentValue += amt;
    Debug.print(debug_show(currentValue));
  };

  //Allows users to withdraw from their account
  public func withdrawal(num: Float) {
    let tempVal: Float = currentValue - num;
    if (tempVal >= 0) {
    currentValue -= num;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Error, withdrawal amount cannot be greater than balance");
    }
  };

  //Allows users to check the balance of their account
  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS)); // use Float fromInt because 1.01 val has decimals
    startTime := currentTime;
  };

}