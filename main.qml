import QtQuick 2.14
import QtQuick.Window 2.14
import "Components"

Window {
    id: window
    visible: true
    width: 640
    height: 480
    color: "#000000"
    title: qsTr("Hello World")

    property int pr_s32MainSize : width<height?width:height
    property int pr_s32Meter : 0
    property bool flag: false

    onWindowStateChanged: {
        timerOnStart.start()
    }

    Timer {
        id: timerOnStart
        interval: 100/2
        running: true
        repeat: true
        onTriggered: {
            pr_s32Meter += flag?-1:+1
            if(pr_s32Meter == 120)
                flag = true
            else if(pr_s32Meter == 0)
                flag = false
            timerOnStart.restart()
        }
    }

    OuterArc {
        id: outerArc
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        pr_s32Size: parent.width<parent.height?parent.width:parent.height //always smaller value between width and height
        z: 1
        InnerRect {
            id: innerRing
            anchors.centerIn: parent
            pr_s32Size: parent.pr_s32Size/2 //always smaller value between width and height
        }
    }

    LeftMeters {
        width: pr_s32MainSize/3
        height: width*1.5
        anchors.right: outerArc.left
        anchors.rightMargin: 0.18*pr_s32MainSize
        anchors.verticalCenter: parent.verticalCenter
    }

    RightMeters {
        width: pr_s32MainSize/3
        height: width*1.5
        anchors.left: outerArc.left
        anchors.leftMargin: 0.18*pr_s32MainSize
        anchors.verticalCenter: parent.verticalCenter
    }


}
/*


    RightFuelArch {
        id :leftMeters
        x: 320
        y: 119
        height: 0.504167*pr_s32MainSize
        anchors.verticalCenterOffset: 0
        //242
        anchors.verticalCenter: outerArc.verticalCenter
        visible: true
        Guage {
            id: upperL1
            y: -36
            width: 0.48*pr_s32MainSize
            height: width
            anchors.left: parent.left
            anchors.leftMargin: -270
            rotation: -45
            z: 0
        }
        Guage {
            id: lowerL1
            y: 34
            width: 0.48*pr_s32MainSize
            height: width
            anchors.left: parent.left
            anchors.leftMargin: -270
            rotation: -135
            z: 0
        }
    }


    RightMeters {
        id : rightMeters
        y: 119
        height: 0.504167*pr_s32MainSize
        anchors.verticalCenterOffset: 0
        anchors.left: outerArc.right
        anchors.leftMargin: -96
        //242
        anchors.verticalCenter: outerArc.verticalCenter
        visible: true
        Guage {
            id: upperR1
            y: -35
            width: 0.48*pr_s32MainSize
            height: width
            anchors.left: parent.left
            anchors.leftMargin: 44
            rotation: 45
            z: 0
        }
        Guage {
            id: lowerR2
            y: 35
            width: 0.48*pr_s32MainSize
            height: width
            anchors.left: parent.left
            anchors.leftMargin: 44
            rotation: 135
            z: 0
        }
    }


    ExtraDials {
        id: kk
        x: 174
        y: 165
        pr_s32Size: parent.width<parent.height?0.25*parent.width:0.25*parent.height //always smaller value between width and height
    }
    */


