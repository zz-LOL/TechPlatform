/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.dspace.lunbo;

/**
 *
 * @author Administrator
 */
public class lbText {
    private int id;
    private String content;

    public lbText(){

    }

    public lbText(lbText txt){
        this.id=txt.getId();
        this.content=txt.getContent();
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

