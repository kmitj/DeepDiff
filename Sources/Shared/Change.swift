//
//  Change.swift
//  DeepDiff
//
//  Created by Khoa Pham.
//  Copyright © 2018 Khoa Pham. All rights reserved.
//

import Foundation

public struct Insert<T> {
    public init(item: T, index: Int) {
        self.item = item
        self.index = index
    }
    
  public let item: T
  public let index: Int
}

public struct Delete<T> {
    public init(item: T, index: Int) {
        self.item = item
        self.index = index
    }
    
  public let item: T
  public let index: Int
}

public struct Replace<T> {
    public init(oldItem: T, newItem: T, index: Int) {
        self.oldItem = oldItem
        self.newItem = newItem
        self.index = index
    }
    
  public let oldItem: T
  public let newItem: T
  public let index: Int
}

public struct Move<T> {
    public init(item: T, fromIndex: Int, toIndex: Int) {
        self.item = item
        self.fromIndex = fromIndex
        self.toIndex = toIndex
    }
  public let item: T
  public let fromIndex: Int
  public let toIndex: Int
}

/// The computed changes from diff
///
/// - insert: Insert an item at index
/// - delete: Delete an item from index
/// - replace: Replace an item at index with another item
/// - move: Move the same item from this index to another index
public enum Change<T> {
  case insert(Insert<T>)
  case delete(Delete<T>)
  case replace(Replace<T>)
  case move(Move<T>)

  public var insert: Insert<T>? {
    if case .insert(let insert) = self {
      return insert
    }

    return nil
  }

  public var delete: Delete<T>? {
    if case .delete(let delete) = self {
      return delete
    }

    return nil
  }

  public var replace: Replace<T>? {
    if case .replace(let replace) = self {
      return replace
    }

    return nil
  }

  public var move: Move<T>? {
    if case .move(let move) = self {
      return move
    }

    return nil
  }
}
