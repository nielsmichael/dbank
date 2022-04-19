import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  public func topUp(amt: Nat) {
    currentValue += amt;
    Debug.print(debug_show(currentValue));
  };

}