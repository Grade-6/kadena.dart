class Meta {
  final String sender;
  final String chainId;
  final double gasPrice;
  final int gasLimit;
  final int creationTime;
  final int ttl;

  const Meta(this.sender, this.chainId, this.gasPrice, this.gasLimit,
      this.creationTime, this.ttl);

  Map<String, Object> toMap() {
    return {
      'sender': sender,
      'chainId': chainId,
      'gasPrice': gasPrice,
      'gasLimit': gasLimit,
      'creationTime': creationTime,
      'ttl': ttl,
    };
  }
}
