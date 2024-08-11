import Foundation

extension MPVPlayer {

    public protocol Delegate: AnyObject {

        func player(_ player: MPVPlayer, stateChanged state: MPVPlayer.State)
    }

}
