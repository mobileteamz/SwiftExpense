 //
//  ADdSpendVC.swift
//  sExpenses
//
//  Created by Nacho on 1/4/16.
//  Copyright © 2016 LandhGames™. All rights reserved.
//

import UIKit
 
protocol AddSpendVCProtocol{
    func didAddNewSpending(exp : LGExpense)
}

class AddSpendVC : UIViewController {
    
    
    var delegate : AddSpendVCProtocol!
    @IBOutlet weak var spendTitle: UITextField!
    @IBOutlet weak var spendPrice: UITextField!


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.spendPrice.keyboardType = UIKeyboardType.DecimalPad
        self.spendPrice.returnKeyType = UIReturnKeyType.Done
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    var categories : [String] = ["Personal domestico", "Pago Servicios/Impuestos", "Comida hecha",  "Insumos música", "Clase de Música", "Taxi",  "Restaurant", "Chino/Super", "Cancel"]
    
    @IBAction func showActionSheet(sender: AnyObject) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        
        for e in self.categories{
            let newCateogy = UIAlertAction(title: e, style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
            })
            optionMenu.addAction(newCateogy)
        }
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    
    func returnToBackVie()
    {
        if(allFieldOK())
        {
            let exp = LGExpense(title: self.spendTitle.text!, cat: "Restaurant", price:Double(self.spendPrice.text!)!, curr: LGExpense.Currency.ars)
            self.delegate.didAddNewSpending(exp)
            self.navigationController?.dismissViewControllerAnimated(false, completion: nil)
        }
    
    }
    
    func allFieldOK() -> Bool{
        return true
    }
    
    @IBAction func didTouchAddSpend(sender: UIButton) {
        returnToBackVie()
    }
    
    @IBAction func didTouchCancel(sender: UIButton) {
        self.navigationController?.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func resignFirstResponder() -> Bool {
        return true
    }
}
