//
//  SceneDelegate.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


/*func fetchData(urlString: String) {
    
    if let url = URL(string: urlString) {
        let session = URLSession.shared
       let task = session.dataTask(with: url) { data, response, error in
            if  let error = error {
                print(error)
            }
            if let safedata = data {
                do {
                    let decoder = try JSONDecoder().decode(WeatherDate.self, from: safedata)
                    let id = decoder.weather[0].id
                    let cityName = decoder.name
                    let temperature = decoder.main.temp
                    
                   let weatherModel =  WeatherModel(conditionId: id, cityName: cityName, temperature: temperature)
                   print( weatherModel.conditionName)
                }
                catch {
                    print(error)
                }
                
            }
            }
        task.resume() }
}
}
 struct WeatherModel {
     let conditionId: Int
     let cityName:  String
     let temperature: Double
     var conditionName: String {
         switch conditionId {
         case 200...232:
             return "cloud.bolt"
         case 300...321:
             return "cloud.drizzle"
         case 500...531:
             return "cloud.rain"
         case 600...622:
             return "clound.snow"
         case 700...781:
             return "cloud.fog"
         case 800:
             return "sun.max"
         case 801...804:
             return "cloud.bolt"
         default:
             return "cloud"

*/

