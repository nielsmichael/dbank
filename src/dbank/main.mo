import Debug "mo:base/Debug";

actor DBank {
  stable var currentValue = 300;
  //currentValue := 100;

  public func topUp(amt: Nat) {
    currentValue += amt;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawal(num: Nat) {
    let tempVal = currentValue - num;
    if (tempVal >= 0) {
    currentValue -= num;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Error, withdrawal amount cannot be greater than balance");
    }
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  }

}