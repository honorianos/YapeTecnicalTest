//
//  DetailMapReceta.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 26/11/22.
//

import UIKit
import MapKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class DetailMapReceta: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cellMapView: UITableViewCell!
    @IBOutlet var cellNombre: UITableViewCell!
    @IBOutlet var cellLatitud: UITableViewCell!
    @IBOutlet var cellLongitud: UITableViewCell!
    @IBOutlet var cellDescripcion: UITableViewCell!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var labelNombre: UILabel!
    @IBOutlet var labelLatitud: UILabel!
    @IBOutlet var labelLongitud: UILabel!
    @IBOutlet var labelDescripcion: UILabel!
    private let presenter = DetailMapRecetaPresenter()
    let annotation = MKPointAnnotation()
    var origen: Receta!

    let locationManager = CLLocationManager()

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        
        title = "Origen \(origen.nombre)"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        
         //Create the pin location of your restaurant(you need the GPS coordinates for this)
         let restaurantLocation = CLLocationCoordinate2D(latitude: Double(origen.detalle.latitud)!, longitude: Double(origen.detalle.longitud)!)

         //Center the map on the place location
         mapView.setCenter(restaurantLocation, animated: true)
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: Double(origen.detalle.latitud)!, longitude: Double(origen.detalle.longitud)!)
        
        mapView.addAnnotation(annotation)
      }
    
    func setPermission() {
    }

    // MARK: - Data methods
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func loadData() {

        labelNombre.text = origen.nombre
        labelLatitud.text = origen.detalle.latitud
        labelLongitud.text = origen.detalle.longitud
        labelDescripcion.text = origen.detalle.descripcion
    }

    // MARK: - User actions
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @objc func actionFeedback(_ sender: UIButton) {

        print(#function)
        dismiss(animated: true)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func actionFacebook(_ sender: UIButton) {

        print(#function)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func actionTwitter(_ sender: UIButton) {

        print(#function)
    }
}

// MARK: - UITableViewDataSource
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension DetailMapReceta: UITableViewDataSource {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) { return cellMapView    }
        if (indexPath.row == 1) { return cellNombre    }
        if (indexPath.row == 2) { return cellLatitud        }
        if (indexPath.row == 3) { return cellLongitud        }
        if (indexPath.row == 4) { return cellDescripcion        }

        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
//-----------------------------------------------------------------------------------------------------------------------------------------------
extension DetailMapReceta: UITableViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(#function)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if (indexPath.row == 0) { return 200    }
        if (indexPath.row == 1) { return 45        }
        if (indexPath.row == 2) { return 45        }
        if (indexPath.row == 3) { return 45        }
        if (indexPath.row == 4) { return 100        }

        return 0
    }
}
