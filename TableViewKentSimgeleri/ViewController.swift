//
//  ViewController.swift
//  TableViewKentSimgeleri
//
//  Created by Ios Developer on 1.10.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
// bunları ekliyoruz table view fonskyionlarını çağırabilmemiz için. Hata verecek. classın içinde ama en aşagıdaki şeyleri ekleyince düzelicek.
    var kentSimgeleri = [String]()
    var kentSimgeleriResimleri = [UIImage]()
    
    var secilmisisim = ""
    var secilmisİsimResmi = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self   // bunları aşağıdaki numberofrows ve cell forwatstan sonra yazıoz viewcontrollere  tanıtıyoz.
        tableView.dataSource = self
        
        
        
        kentSimgeleri.append("Collosseum")
        kentSimgeleri.append("Great Wall")
        kentSimgeleri.append("Kremlin")
        kentSimgeleri.append("Stonehenge")
        kentSimgeleri.append("Taj Mahal")
        
       
        kentSimgeleriResimleri.append(UIImage(named: "colosseum")!)
        kentSimgeleriResimleri.append(UIImage(named: "greatwall")!)
        kentSimgeleriResimleri.append(UIImage(named: "kremlin")!)
        kentSimgeleriResimleri.append(UIImage(named: "stonehenge")!)
        kentSimgeleriResimleri.append(UIImage(named: "tacmahal")!)
        
    }
    // numberofrows kaçtane girdi olacagını sorar bize
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kentSimgeleri.count
    }
    // cellforrow bize ne gösterecegini sorar.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell() // hücre oluşturmamız gerekiyor
        //cell.textLabel?.text ="test"    // yukarda kaçtane seçtiysek o kadar hücre oluştur ve içinde test yazsın demek eskiden vardı bu oyuzden hata verir.
        
        var content = cell.defaultContentConfiguration()
       
        content.text = kentSimgeleri[indexPath.row] // yukardaki indexpath . hangi sıradaysa o gözükür demek bu .row falan.
        //content.secondaryText = "test" 2. satırı ekleyebilirsin kafana göre
        
        //content.image = kentSimgeleriResimleri[indexPath.row]  yaparak resimleri görebilirdin.
        
        
        cell.contentConfiguration = content
        return cell
    }
    // tableview da tıklama işlemi alttaki gibi yapılır.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // hangi ismin ve resmin seçildigini burdan anlarız ve segueye atarız.
        secilmisisim = kentSimgeleri[indexPath.row]
        secilmisİsimResmi = kentSimgeleriResimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil) //to detailsvc yi mainde biz belirlemiştik.
        
    }
    //segueyi hazırla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC //secilmisVC = secilen segue dailsVC ye gitsin eminim.
            destinationVC.secilenİsim = secilmisisim
            destinationVC.secilenResim = secilmisİsimResmi
            
        }
    }
    
    //commit yazarsan cıkar bu fonskyinu verileri silmek için çağırırız.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            kentSimgeleri.remove(at: indexPath.row)
            kentSimgeleriResimleri.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
}
 
