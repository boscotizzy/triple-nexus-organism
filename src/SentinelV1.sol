// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {console} from "forge-std/console.sol";

contract SentinelV1 {
    address public mlOracle; // Engine 2 model oracle address (future ZK-verified)
    uint256 public protectedTvl;  // fixed naming
    uint256 public revenueShareBps = 150; // 1.5% insurance premium

    event AnomalyDetected(bytes32 proofHash, uint256 severity);
    event ProtectionTriggered(uint256 payout);

    constructor(address _mlOracle) {
        mlOracle = _mlOracle;
    }

    function triggerDefense(bytes calldata anomalyProof) external {
        // In full version: verify ZK proof from Engine 2 model
        emit AnomalyDetected(keccak256(anomalyProof), 1);
        // Auto-mint insurance payout + evolve weights (simulation)
        protectedTvl += 1 ether;
        emit ProtectionTriggered(protectedTvl * revenueShareBps / 10000);
    }
}
