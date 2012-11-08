package br.com.almana.domain

/**
 * This class is for contract audit purposes
 */
class ContractAudit {

    User        user
    Contract    contract
    Date        dateOfAcceptance

    static constraints = {
        user nullable:false
        contract nullable:false
        dateOfAcceptance nullable:false
    }
}
