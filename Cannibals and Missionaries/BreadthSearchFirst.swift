//
//  BreadthSearchFirst.swift
//  Cannibals and Missionaries
//

import Foundation

class BreadthFirstSearch {
    
    var bool: Bool?
    
    func execute(_ initialState: State) -> State? {
        if initialState.isGoal() {
            return initialState
        }
        
        let frontier = LinkedList<State>()
        var explored = HashSet<State>()
        
        frontier.append(initialState)
        
        while true {
            if frontier.isEmpty {
                return nil
            }
            let state = frontier.first?.value
            explored.insert(element: state!)
            
            let successors = state?.generateSuccessors()
            
            for child in successors! {
                
                // Ajeitar saporra
                
//                self.bool = !(frontier.filter(predicate: {$0 == child}).count >= 1)
                
                if !explored.contains(element: child) || bool! {
                    if child.isGoal() {
                        return child
                    }
                    frontier.append(child)
                }
            }
        }
    }
}
