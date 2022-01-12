import Foundation

class TimerRound {
    
    static var countSecondToRound = 0
    static var timerRound: Timer?
    
    class func startTimer() {
        
        countSecondToRound = 0
        guard timerRound == nil else { return }
        
        timerRound =  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { Timer in
            TimerRound.countSecondToRound += 1
            print(TimerRound.countSecondToRound)
        })
    }
    
    class func stopTimer() {
        guard timerRound != nil else { return }
        timerRound?.invalidate()
        timerRound = nil
    }
    
}
