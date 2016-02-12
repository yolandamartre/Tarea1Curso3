//
//  ViewController.swift
//  tarea1Curso3Swift
//
//  Created by Yolanda Martínez on 2/11/16.
//  Copyright © 2016 Yolanda Martínez. All rights reserved.
//


// Ejemplo de ISBN que existen en la pagina 	9789990084467, 9780439023528

// Liga a github  https://github.com/yolandamartre/Tarea1Curso3.git

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ISBN: UITextField!
    
    @IBOutlet weak var textoDescrip: UITextView!
    
    func llamada()
    {
        let isbn = ISBN.text!
        
        let urlStr = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + isbn
        let url = NSURL(string: urlStr)
        
        do
        {
            let datos = try NSData(contentsOfURL: url!, options: NSDataReadingOptions())
            if datos.length != 2   // si regresa {} quiero que salga el mensaje
            {
                let texto = NSString(data: datos, encoding: NSUTF8StringEncoding)
                textoDescrip.text = texto as! String
            }
            else
            {
                let alerta = UIAlertController(title: "Error", message: "Ese libro no existe", preferredStyle: UIAlertControllerStyle.Alert)
                alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                presentViewController(alerta, animated: true, completion: nil)
            }
        }
        catch
        {
            print ("Error")
        }
    }


    @IBAction func botonLimpiar(sender: AnyObject)
    {
        ISBN.text = ""
        textoDescrip.text = ""
    }
    
    @IBAction func oprimioIr(sender: AnyObject?)
    {
        llamada()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

