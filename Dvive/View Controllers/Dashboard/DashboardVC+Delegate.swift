//
//  DashboardVC+Delegate.swift
//  Dvive
//
//  Created by BS01550 on 27/8/24.
//

import Foundation
import UIKit

extension DashboardVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.33
        return CGSize(width: width , height: width * 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 0)
    }
}

extension DashboardVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        getContentHeightWithRespectToDevice(contentHeight: 70)
    }
    
}
