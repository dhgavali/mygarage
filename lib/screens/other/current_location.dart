class CurrentLocation {
   String? location;
  // CurrentLocation(this.location);

  set address(mycity) {
    this.location = mycity;
  }

  get mylocation => this.location;
}
