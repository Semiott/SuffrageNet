include "../node_modules/circomlib/circuits/mux1.circom";
include "../node_modules/circomlib/circuits/bitify.circom";
include "../node_modules/circomlib/circuits/comparators.circom";
include "./trees/incrementalQuinTree.circom";
include "./trees/incrementalMerkleTree.circom";
include "./hasherPoseidon.circom";
include "./trees/calculateTotal.circom";
include "./trees/checkRoot.circom";
include "./quadVoteTally.circom"

template QuadHackPrizeResult() {

    signal private input ParticipantPublicKey;
    signal private input OrganizerPublicKey;
    signal input OrganizerReviewInput;
    signal input AttendeeInput;
    signal input ProjectIdentifier;
    
    signal output PrizeSponsorPublishedResults;
    signal output PrizeSponsorPublishedPending;

    signal aux;

    aux <== (OrganizerReviewInput-AttendeeInput)*ProjectIdentifier;   
    PrizeSponsorPublishedResults <==  aux + OrganizerReviewInput;
    PrizeSponsorPublishedPending <== -aux + AttendeeInput;
}

component main = QuadHackPrizeResult();
