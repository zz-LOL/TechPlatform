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
import com.jspsmart.upload.SmartUpload;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import javax.servlet.ServletException;
import javax.servlet.jsp.PageContext;
import java.io.FileOutputStream;
import java.util.List;

public class updateText {
    public void setText(List<lbText> list){
        try{
            Document doc=DocumentHelper.createDocument();
            Element root=doc.addElement("Text");
            for (int i=0;i<list.size();i++) {
                lbText txt=list.get(i);
                root.addElement("id").setText("" + txt.getId());
                root.addElement("content").setText(txt.getContent());
            }
            OutputFormat format=new OutputFormat("  ",true);
            format.setEncoding("UTF-8");
            XMLWriter xmlWriter=new XMLWriter(new FileOutputStream("lbText.xml"),format);
            xmlWriter.write(doc);
            xmlWriter.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
