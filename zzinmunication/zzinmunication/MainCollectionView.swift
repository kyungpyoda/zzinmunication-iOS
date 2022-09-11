//
//  MainCollectionView.swift
//  zzinmunication
//
//  Created by itzel.du on 2022/09/11.
//

import UIKit

final class MainCollectionView: UICollectionView {

  init(frame: CGRect) {
    super.init(
      frame: frame,
      collectionViewLayout: UICollectionViewCompositionalLayout(
        sectionProvider: Self.sectionProvider
      )
    )

    registerViews()
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  enum ElementKind {
    static let advertisement = "advertisement-element-kind"
  }
}

private extension MainCollectionView {

  func registerViews() {
    registerCell(ofType: MainTopicCell.self)
//    registerSupplementaryView(
//      ofType: TitleSupplementaryView.self,
//      ofKind: ElementKind.advertisement
//    )
  }

  func setupView() {
    backgroundColor = .systemBackground
    showsVerticalScrollIndicator = false

    layer.masksToBounds = false
  }
}

private extension MainCollectionView {

  static func sectionProvider(
    sectionIndex: Int,
    layoutEnvironment: NSCollectionLayoutEnvironment
  ) -> NSCollectionLayoutSection? {
    switch sectionIndex {
    case 0: return layoutSectionForTopic()
    default: return nil
    }
  }

  static func layoutSectionForTopic() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .fractionalWidth(143/158/2)
    )
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: item, count: 2)
    group.interItemSpacing = .fixed(13)

    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    section.interGroupSpacing = 14
//    section.boundarySupplementaryItems = [
//      titleSupplementaryItem(heightDimension: .estimated(68))
//    ]

    return section
  }

//  static func titleSupplementaryItem(
//    heightDimension: NSCollectionLayoutDimension
//  ) -> NSCollectionLayoutBoundarySupplementaryItem {
//    let layoutSize = NSCollectionLayoutSize(
//      widthDimension: .fractionalWidth(1.0),
//      heightDimension: heightDimension
//    )
//    return NSCollectionLayoutBoundarySupplementaryItem(
//      layoutSize: layoutSize,
//      elementKind: ElementKind.advertisement,
//      alignment: .topLeading
//    )
//  }
}