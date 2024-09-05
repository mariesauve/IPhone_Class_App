//
//  DataItem.swift
//  BentoBoxBuilder
//
//  Created by user265215 on 8/22/24.
//

//

import Foundation
import SwiftUI

struct DataItem: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let imageName: String
    
    var image: Image {
        Image(imageName)
    }
}

let bentoItems = [
    DataItem(name: "Grilled Chicken", category: "Protein", imageName: "mark-deyoung-mjcJ0FFgdWI-unsplash"),
    DataItem(name: "Black Beans", category: "Protein",  imageName: "mikey-frost-Rq9eUgGy_eA-unsplash"),
    DataItem(name: "Beef", category: "Protein"  ,  imageName: "jeremy-gallagher-Cuiu5jbtZtI-unsplash"),
    DataItem(name: "Bean Mix", category: "Protein"  ,  imageName: "milada-vigerova-FW7Amhh_B8A-unsplash"),
    DataItem(name: "White Beans", category: "Protein"  ,  imageName: "lukasz-rawa-b6h5nTVD1Hw-unsplash"),
    DataItem(name: "Orange Chicken", category: "Protein"  ,  imageName: "drew-taylor-jFu2L04tMBc-unsplash"),

    DataItem(name: "Noodles", category: "Carb", imageName: "bruna-branco-t8hTmte4O_g-unsplash"),
    DataItem(name: "Nachos", category: "Carb" ,  imageName: "natasha-bhogal-7sStoaxfJh0-unsplash"),
    DataItem(name: "Rice", category: "Carb"  ,  imageName: "mgg-vitchakorn-zXNC_lBBVGE-unsplash"),
    DataItem(name: "Flat Bread", category: "Carb"  ,  imageName: "vicky-ng-SnsV0T5dWOk-unsplash"),
    DataItem(name: "Carrot Muffin", category: "Carb"  ,  imageName: "joseph-gonzalez-TAegVkFYIqo-unsplash"),
    DataItem(name: "Mac N Cheese", category: "Carb"  ,  imageName: "tina-witherspoon-A8Gze997X-E-unsplash"),



    DataItem(name: "Broccoli", category: "Vegetable", imageName: "reinaldo-kevin-UrqPUe3zUzw-unsplash"),
    DataItem(name: "Corn", category: "Vegetable" ,  imageName: "hari-nandakumar-Uy0rpZRYFOQ-unsplash"),
    DataItem(name: "Peas", category: "Vegetable"   ,  imageName: "giovanna-gomes-iExF6pqPmFo-unsplash"),
    DataItem(name: "Avocado Salad", category: "Vegetable"  ,  imageName: "heather-ford-Ug7kk0kThLk-unsplash"),
    DataItem(name: "Caesar Salad", category: "Vegetable"  ,  imageName: "raphael-nogueira-63mHpYEyjCA-unsplash"),
    DataItem(name: "Green Bean Salad", category: "Vegetable"  ,  imageName: "joyce-LalntMdtdbc-unsplash"),

    DataItem(name: "Orange Slices", category: "Fruit" ,  imageName: "xiaolong-wong-5DTM9y7vUp0-unsplash"),
    DataItem(name: "Apple Slices", category: "Fruit", imageName: "natalie-kinnear-YEWRUrFuNCc-unsplash"),
    DataItem(name: "Strawberries", category: "Fruit"  ,  imageName: "arturrro-GdTLaWamFHw-unsplash"),
    DataItem(name: "Watermelon", category: "Fruit"  ,  imageName: "tanalee-youngblood-ZTAhoW9W3ms-unsplash"),
    DataItem(name: "Pear Slices", category: "Fruit"  ,  imageName: "dose-juice--FKE4iLtDUo-unsplash"),
    DataItem(name: "Grapes", category: "Fruit"  ,  imageName: "sergiu-valena-CFrBKQBuRKw-unsplash"),

    DataItem(name: "Cupcake", category: "Snack", imageName: "isabella-fischer-sQoIRY84a2E-unsplash"),
    DataItem(name: "Jelly Beans", category: "Snack"  ,  imageName: "patrick-fore-0u_vbeOkMpk-unsplash"),
    DataItem(name: "Cookies", category: "Snack",  imageName: "erol-ahmed-AmzKuEnr1VY-unsplash"),
    DataItem(name: "Brownie", category: "Snack",  imageName: "toa-heftiba-WPRuXYLNY68-unsplash"),
    DataItem(name: "Trail Mix", category: "Snack",  imageName: "maksim-shutov-pUa1On18Jno-unsplash"),
    DataItem(name: "Mini Cheesecakes", category: "Snack",  imageName: "aneta-voborilova-fufQEm4MzBY-unsplash"),

    
]
    
    
   
    
    
    
    
   
   



