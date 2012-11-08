package br.com.almana.domain

class Contract {

    String  text
    Date    creationDate
    Boolean enabled

    static constraints = {
        text blank: false, maxSize: 10000
        creationDate nullable: false
        enabled nullable: false
    }
}
