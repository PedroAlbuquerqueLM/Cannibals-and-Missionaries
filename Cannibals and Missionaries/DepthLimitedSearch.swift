//
//  DepthLimitedSearch.swift
//  Cannibals and Missionaries
//

import Foundation

class DepthLimitedSearch: NSObject {
    
    func execute(_ initialState: State) -> State? {
        let limit = 20
        return recursiveDLS(initialState, with: limit)
    }
    
    func recursiveDLS(_ state: State, with limit: Int) -> State? {
        if state.isGoal() {
            return state
        } else if (limit == 0) {
            return nil
        } else {
            let successors = state.generateSuccessors()
            for child in successors {
                let result = recursiveDLS(child, with: limit - 1)
                if result != nil {
                    return result
                }
            }
            return nil
        }
    }
    
}
