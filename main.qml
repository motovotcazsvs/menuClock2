import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Window {
    id: winn
    visible: true
    //visibility: Window.FullScreen //для малинки
    width: 600 //для пк
    height: 1024 //для пк
    flags: Qt.FramelessWindowHint

    //property real buttons_width: 230
    //property real buttons_height: 240
    //property real buttons_width: 171
    //property real buttons_height: 196
    //property real buttons_width: 157
    //property real buttons_height: 180
    //property real buttons_width: 191
    //property real buttons_height: 219
    property real buttons_width: 191
    property real buttons_height: 210

    property real mouse_range1_x: 18
    property real mouse_range1_y: 48
    property real mouse_range1_width: 169
    property real mouse_range1_height: 100
    property real mouse_range2_width: 130
    property real mouse_range2_height: 18
    property real mouse_range3_width: 110
    property real mouse_range3_height: 18
    property real mouse_range4_width: 60
    property real mouse_range4_height: 20
    property real mouse_range5_width: 50
    property real mouse_range5_height: 17

    property real recBut148X: 161
    property real recBut26X: 70
    property real recBut37X: 252
    property real recBut23Y: 263
    property real recBut45Y: 415
    property real recBut67Y: 566
    property real shiftX: 0
    property real shiftY: 0
    property real clearances: 0

    property int hours
    property int minutes
    property int seconds

    property real but_text_size: 15
    property bool rec_range_color_set: false

    property real shiftXPage2: -60
    property real shiftYPage2: 0

    function timeChanged() {
        var date = new Date();
        hours = date.getHours();
        minutes = date.getMinutes();
        seconds = date.getSeconds();
    }

    function rec_range_color(){
        return rec_range_color_set ? "red" : "transparent"
    }

    Timer {
        interval: 100
        repeat: true
        running: true
        onTriggered: timeChanged()
    }


    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
/*
        delegate: StackViewDelegate { //переход со средины
            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 500
                }
                PropertyAnimation {
                    target: exitItem
                    property: "scale"
                    from: 1
                    to: 0
                    duration: 10
                }
            }
        }
*/
        delegate: StackViewDelegate {//горизонтальный переход
            function transitionFinished(properties)
            {
                properties.exitItem.x = 0
            }

            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "x"
                    from: enterItem.width
                    to: 0
                    duration: 500
                }
                PropertyAnimation {
                    target: exitItem
                    property: "x"
                    from: 0
                    to: exitItem.width
                    duration: 500
                }
            }
        }
    }

    Page {
        id: mainView

        Rectangle {
            id: recB1
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: recBut148X + shiftX
            y: ((112 + shiftY) + (clearances * 2))

            Image {
                id: imBye1
                anchors.fill: recB1
                anchors.margins: 1
                source: (recB1But1.pressed || recB1But2.pressed || recB1But3.pressed || recB1But4.pressed || recB1But5.pressed)
                    ? "images/МЕНЮ Измерения 1 страница2.png"
                    : "images/МЕНЮ Измерения 1 страница.png"
            }

            Rectangle {
                id:recB1Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB1But1
                    anchors.fill: recB1Rec1
                    onClicked: {
                        console.log("Button 11111111 clicked." + hours);
                        stack.push(viewPage2);
                    }
                }

                Text {
                    id: nameButton1
                    anchors.bottom: recB1Rec1.bottom
                    anchors.bottomMargin: 8
                    anchors.horizontalCenter: recB1Rec1.horizontalCenter
                    text: qsTr("ИЗМЕРЕНИЕ")
                    color: (recB1But1.pressed || recB1But2.pressed || recB1But3.pressed || recB1But4.pressed || recB1But5.pressed)
                    ? "white"
                    : "#A84A84"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut1
                      visible: (recB1But1.pressed || recB1But2.pressed || recB1But3.pressed || recB1But4.pressed || recB1But5.pressed)
                        ? false : true
                      anchors.fill: nameButton1
                      source: nameButton1
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

            }

            Rectangle {
                id:recB1Rec2
                anchors.horizontalCenter: recB1Rec1.horizontalCenter
                anchors.bottom: recB1Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()
                MouseArea {
                    id: recB1But2
                    anchors.fill: recB1Rec2
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(viewPage2);
                    }
                }
            }

            Rectangle {
                id:recB1Rec3
                anchors.horizontalCenter: recB1Rec1.horizontalCenter
                anchors.top: recB1Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB1But3
                    anchors.fill: recB1Rec3
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(viewPage2);
                    }
                }
            }

            Rectangle {
                id:recB1Rec4
                anchors.bottom: recB1Rec2.top
                anchors.horizontalCenter: recB1Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB1But4
                    anchors.fill: recB1Rec4
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(viewPage2);
                    }
                }
            }

            Rectangle {
                id:recB1Rec5
                anchors.top: recB1Rec3.bottom
                anchors.horizontalCenter: recB1Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB1But5
                    anchors.fill: recB1Rec5
                    onClicked: {
                        console.log("Button 11111111 clicked.");
                        stack.push(viewPage2);
                    }
                }
            }

        }

        Rectangle {
            id: recB2
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut26X + shiftX) + clearances)
            y: ((recBut23Y + shiftY) + clearances)
            //z: -1

            Image {
                id: imBye2
                anchors.fill: recB2
                anchors.margins: 1
                source: "images/МЕНЮ Часы 1 страница.png"

                Image {
                    id: imArrow1
                    x: 98
                    y: 68
                    width: 18
                    height: 28
                    source: "images/МЕНЮ Часы 1 страница маленькая стрелка.png"

                    transform: Rotation {
                        id: hourRotation
                        angle: ((hours * 30) - 31) + (minutes * 0.5)
                        origin.x: 3
                        origin.y: 24
                    }
                }

                Image {
                    id: imArrow2
                    x: 70
                    y: 59
                    width: 36
                    height: 38

                    source: "images/МЕНЮ Часы 1 страница большая стрелка.png"

                    transform: Rotation {
                        id: minuteRotation
                        angle: (minutes * 6) + 43
                        origin.x: 31
                        origin.y: 33
                    }
                }

                Rectangle {
                    id: recImArrow3
                    color: "#818282"
                    x: 100
                    y: 53
                    width: 2
                    height: 40
                    //radius: 2

                    transform: Rotation {
                        id: secondRotation
                        angle: seconds * 6
                        origin.x: 1
                        origin.y: 39
                    }
                }

                Rectangle {
                    //color: "red"
                    color: "transparent"
                    x: 101
                    y: 92
                    z: 1
                    width: 1
                    height: 1
                }

            }
        }

        Rectangle {
            id: recB3
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut37X + shiftX) - clearances)
            y: ((recBut23Y + shiftY) + clearances)
            z: -1
            Image {
                id: imBye3
                anchors.fill: recB3
                anchors.margins: 1
                source: (recB3But1.pressed || recB3But2.pressed || recB3But3.pressed || recB3But4.pressed || recB3But5.pressed)
                    ? "images/МЕНЮ Результаты 1 страница2.png"
                    : "images/МЕНЮ Результаты 1 страница.png"
            }

            Rectangle {
                id:recB3Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                Text {
                    id: nameButton3
                    anchors.bottom: recB3Rec1.bottom
                    anchors.bottomMargin: 10
                    anchors.horizontalCenter: recB3Rec1.horizontalCenter
                    text: qsTr("РЕЗУЛЬТАТЫ")
                    color: (recB3But1.pressed || recB3But2.pressed || recB3But3.pressed || recB3But4.pressed || recB3But5.pressed)
                    ? "white"
                    : "#5F9ECE"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut3
                      visible: (recB3But1.pressed || recB3But2.pressed || recB3But3.pressed || recB3But4.pressed || recB3But5.pressed)
                               ? false : true
                      anchors.fill: nameButton3
                      source: nameButton3
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

                MouseArea {
                    id: recB3But1
                    anchors.fill: recB3Rec1
                    onClicked: {
                        console.log("Button 3333333 clicked.");
                        stack.push(viewClock);
                    }
                }
            }

            Rectangle {
                id:recB3Rec2
                anchors.horizontalCenter: recB3Rec1.horizontalCenter
                anchors.bottom: recB3Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB3But2
                    anchors.fill: recB3Rec2
                    onClicked: {
                        console.log("Button 3333333 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB3Rec3
                anchors.horizontalCenter: recB3Rec1.horizontalCenter
                anchors.top: recB3Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB3But3
                    anchors.fill: recB3Rec3
                    onClicked: {
                        console.log("Button 3333333 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB3Rec4
                anchors.bottom: recB3Rec2.top
                anchors.horizontalCenter: recB3Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB3But4
                    anchors.fill: recB3Rec4
                    onClicked: {
                        console.log("Button 33333 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB3Rec5
                anchors.top: recB3Rec3.bottom
                anchors.horizontalCenter: recB3Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB3But5
                    anchors.fill: recB3Rec5
                    onClicked: {
                        console.log("Button 333333 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB4
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: recBut148X + shiftX
            y: recBut45Y + shiftY
            //z: -1
            Image {
                id: imBye4
                anchors.fill: recB4
                anchors.margins: 1
                source: (recB4But1.pressed || recB4But2.pressed || recB4But3.pressed || recB4But4.pressed || recB4But5.pressed)
                    ? "images/МЕНЮ Контроль качества 1 страница2.png"
                    : "images/МЕНЮ Контроль качества 1 страница.png"



            }

            Rectangle {
                id:recB4Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But1
                    anchors.fill: recB4Rec1
                    onClicked: {
                        console.log("Button 4444 clicked.");
                    }
                }

                Text {
                    id: nameButton4
                    anchors.top: recB4Rec1.top
                    anchors.topMargin: 59
                    anchors.horizontalCenter: recB4Rec1.horizontalCenter
                    text: qsTr("КОНТРОЛЬ")
                    color: (recB4But1.pressed || recB4But2.pressed || recB4But3.pressed || recB4But4.pressed || recB4But5.pressed)
                    ? "white"
                    : "#9A8DCC"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut4
                      visible: (recB4But1.pressed || recB4But2.pressed || recB4But3.pressed || recB4But4.pressed || recB4But5.pressed)
                             ? false : true
                      anchors.fill: nameButton4
                      source: nameButton4
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

                Text {
                    id: nameButton4NextText
                    anchors.top: nameButton4.bottom
                    anchors.horizontalCenter: recB4Rec1.horizontalCenter
                    text: qsTr("КАЧЕСТВА")
                    color: (recB4But1.pressed || recB4But2.pressed || recB4But3.pressed || recB4But4.pressed || recB4But5.pressed)
                    ? "white"
                    : "#9A8DCC"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut4NextText
                      visible: (recB4But1.pressed || recB4But2.pressed || recB4But3.pressed || recB4But4.pressed || recB4But5.pressed)
                             ? false : true
                      anchors.fill: nameButton4NextText
                      source: nameButton4NextText
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB4Rec2
                anchors.horizontalCenter: recB4Rec1.horizontalCenter
                anchors.bottom: recB4Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But2
                    anchors.fill: recB4Rec2
                    onClicked: {
                        console.log("Button 44444 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB4Rec3
                anchors.horizontalCenter: recB4Rec1.horizontalCenter
                anchors.top: recB4Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But3
                    anchors.fill: recB4Rec3
                    onClicked: {
                        console.log("Button 444444 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB4Rec4
                anchors.bottom: recB4Rec2.top
                anchors.horizontalCenter: recB4Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But4
                    anchors.fill: recB4Rec4
                    onClicked: {
                        console.log("Button 444444 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB4Rec5
                anchors.top: recB4Rec3.bottom
                anchors.horizontalCenter: recB4Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB4But5
                    anchors.fill: recB4Rec5
                    onClicked: {
                        console.log("Button 444444 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB5
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((343 + shiftX) - (clearances * 2))
            y: recBut45Y + shiftY
            z: -1

            Image {
                id: imBye5
                anchors.fill: recB5
                anchors.margins: 1
                source: {
                    if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed || recB5But5.pressed){
                        return "images/МЕНЮ Разогрев 1 страница2.png"
                    }
                    else {
                        if(0) return "images/МЕНЮ Разогрев 1 страница3.png"
                        else return "images/МЕНЮ Разогрев 1 страница.png"
                    }
                }
            }

            Rectangle {
                id:recB5Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()


                MouseArea {
                    id: recB5But1
                    anchors.fill: recB5Rec1
                    onClicked: {
                        console.log("Button 5555 clicked.");
                    }
                }

                Text {
                    id: nameButton5
                    anchors.bottom: textTemperatureBut5.top
                    anchors.horizontalCenter: textTemperatureBut5.horizontalCenter
                    text: qsTr("РАЗОГРЕВ")
                    color: {
                        if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed|| recB5But5.pressed){
                            return "white"
                        }
                        else {
                            if(0) return "#EF4C26"
                            else return "#979A9B"
                        }
                    }
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                Text {
                    id: textTemperatureBut5
                    anchors.bottom: recB5Rec1.bottom
                    anchors.bottomMargin: 3
                    anchors.horizontalCenter: recB5Rec1.horizontalCenter
                    text: "-0.8 °C"
                    color: {
                        if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed|| recB5But5.pressed){
                            return "white"
                        }
                        else {
                            if(0) return "#EF4C26"
                            else return "#979A9B"
                        }
                    }
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut5
                      visible: {
                          if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed|| recB5But5.pressed){
                              return false
                          }
                          else {
                              return true
                          }
                      }
                      anchors.fill: nameButton5
                      source: nameButton5
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

                DropShadow {
                      id: shadowTexTemperatBut5
                      visible: {
                          if(recB5But1.pressed || recB5But2.pressed || recB5But3.pressed || recB5But4.pressed|| recB5But5.pressed){
                              return false
                          }
                          else {
                              return true
                          }
                      }
                      anchors.fill: textTemperatureBut5
                      source: textTemperatureBut5
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB5Rec2
                anchors.horizontalCenter: recB5Rec1.horizontalCenter
                anchors.bottom: recB5Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB5But2
                    anchors.fill: recB5Rec2
                    onClicked: {
                        console.log("Button 55555 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB5Rec3
                anchors.horizontalCenter: recB5Rec1.horizontalCenter
                anchors.top: recB5Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB5But3
                    anchors.fill: recB5Rec3
                    onClicked: {
                        console.log("Button 5555 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB5Rec4
                anchors.bottom: recB5Rec2.top
                anchors.horizontalCenter: recB5Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB5But4
                    anchors.fill: recB5Rec4
                    onClicked: {
                        console.log("Button 55555 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB5Rec5
                anchors.top: recB5Rec3.bottom
                anchors.horizontalCenter: recB5Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB5But5
                    anchors.fill: recB5Rec5
                    onClicked: {
                        console.log("Button 55555 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB6
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut26X + shiftX) + clearances)
            y: ((recBut67Y + shiftY) - clearances)
            //z: -1
            Image {
                id: imBye6
                anchors.fill: recB6
                anchors.margins: 1
                source: {
                    if(recB6But1.pressed || recB6But2.pressed || recB6But3.pressed || recB6But4.pressed || recB6But5.pressed){
                        return "images/МЕНЮ Ошибка 1 страница2.png"
                    }
                    else {
                        if(0){
                            return "images/МЕНЮ Ошибка 1 страница3.png"
                        }
                        else {
                            return "images/МЕНЮ Ошибка 1 страница.png"
                        }
                    }
                }
            }

            Rectangle {
                id:recB6Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But1
                    anchors.fill: recB6Rec1
                    onClicked: {
                        console.log("Button 666666 clicked.");
                    }
                }

                Text {
                    id: nameButton6
                    anchors.bottom: recB6Rec1.bottom
                    anchors.bottomMargin: 8
                    anchors.horizontalCenter: recB6Rec1.horizontalCenter
                    text: qsTr("ОШИБКА")
                    color: {
                        if(recB6But1.pressed || recB6But2.pressed || recB6But3.pressed || recB6But4.pressed || recB6But5.pressed){
                            return "white"
                        }
                        else {
                            if(0) {
                               return "#D82B2B"
                            }
                            else {
                                return "#979A9B"
                            }
                        }
                    }
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut6
                      visible: {
                          if(recB6But1.pressed || recB6But2.pressed || recB6But3.pressed || recB6But4.pressed || recB6But5.pressed){
                              return false
                          }
                          else {
                              return true
                          }
                      }
                      anchors.fill: nameButton6
                      source: nameButton6
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB6Rec2
                anchors.horizontalCenter: recB6Rec1.horizontalCenter
                anchors.bottom: recB6Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But2
                    anchors.fill: recB6Rec2
                    onClicked: {
                        console.log("Button 6666 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB6Rec3
                anchors.horizontalCenter: recB6Rec1.horizontalCenter
                anchors.top: recB6Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But3
                    anchors.fill: recB6Rec3
                    onClicked: {
                        console.log("Button 666666 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB6Rec4
                anchors.bottom: recB6Rec2.top
                anchors.horizontalCenter: recB6Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But4
                    anchors.fill: recB6Rec4
                    onClicked: {
                        console.log("Button 66666 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB6Rec5
                anchors.top: recB6Rec3.bottom
                anchors.horizontalCenter: recB6Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB6But5
                    anchors.fill: recB6Rec5
                    onClicked: {
                        console.log("Button 66666 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB7
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut37X + shiftX) - clearances)
            y: ((recBut67Y + shiftY) - clearances)
            z: -1
            Image {
                id: imBye7
                anchors.fill: recB7
                anchors.margins: 1
                source: (recB7But1.pressed || recB7But2.pressed || recB7But3.pressed || recB7But4.pressed|| recB7But5.pressed)
                    ? "images/МЕНЮ Служебные 1 страница2.png"
                    : "images/МЕНЮ Служебные 1 страница.png"
            }

            Rectangle {
                id:recB7Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But1
                    anchors.fill: recB7Rec1
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }

                Text {
                    id: nameButton7
                    anchors.bottom: recB7Rec1.bottom
                    anchors.bottomMargin: 7
                    anchors.horizontalCenter: recB7Rec1.horizontalCenter
                    text: qsTr("СЛУЖЕБНЫЕ")
                    color: (recB7But1.pressed || recB7But2.pressed || recB7But3.pressed || recB7But4.pressed|| recB7But5.pressed)
                    ? "white"
                    : "#66B2CC"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut7
                      visible: (recB7But1.pressed || recB7But2.pressed || recB7But3.pressed || recB7But4.pressed|| recB7But5.pressed)
                           ? false : true
                      anchors.fill: nameButton7
                      source: nameButton7
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB7Rec2
                anchors.horizontalCenter: recB7Rec1.horizontalCenter
                anchors.bottom: recB7Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But2
                    anchors.fill: recB7Rec2
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB7Rec3
                anchors.horizontalCenter: recB7Rec1.horizontalCenter
                anchors.top: recB7Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But3
                    anchors.fill: recB7Rec3
                    onClicked: {
                        console.log("Button 7777 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB7Rec4
                anchors.bottom: recB7Rec2.top
                anchors.horizontalCenter: recB7Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But4
                    anchors.fill: recB7Rec4
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB7Rec5
                anchors.top: recB7Rec3.bottom
                anchors.horizontalCenter: recB7Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB7But5
                    anchors.fill: recB7Rec5
                    onClicked: {
                        console.log("Button 77777 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB8
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: recBut148X + shiftX
            y: ((718 + shiftY) - (clearances * 2))
            //z: -1
            Image {
                id: imBye8
                anchors.fill: recB8
                anchors.margins: 1
                source: {
                    if(recB8But1.pressed || recB8But2.pressed || recB8But3.pressed || recB8But4.pressed || recB8But5.pressed){
                        return "images/МЕНЮ Калибровка 1 страница2.png"
                    }
                    else {
                        if(0){
                            return "images/МЕНЮ Калибровка 1 страница3.png"
                        }
                        else {
                            return "images/МЕНЮ Калибровка 1 страница.png"
                        }
                    }
                }
            }

            Rectangle {
                id:recB8Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But1
                    anchors.fill: recB8Rec1
                    onClicked: {
                        console.log("Button 88888 clicked.");
                    }
                }

                Text {
                    id: nameButton8
                    anchors.bottom: textTimerBut8.top
                    anchors.horizontalCenter: textTimerBut8.horizontalCenter
                    text: qsTr("КАЛИБРОВКА")
                    color: {
                        if(recB8But1.pressed || recB8But2.pressed || recB8But3.pressed || recB8But4.pressed|| recB8But5.pressed){
                            return "white"
                        }
                        else {
                            if(0) return "#C93D76"
                            else return "#979A9B"
                        }
                    }
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut8
                      anchors.fill: nameButton8
                      source: nameButton8
                      visible: {
                          if(recB8But1.pressed || recB8But2.pressed || recB8But3.pressed || recB8But4.pressed|| recB8But5.pressed){
                              return false
                          }
                          else {
                              return true
                          }
                      }
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

                Text {
                    id: textTimerBut8
                    anchors.bottom: recB8Rec1.bottom
                    anchors.horizontalCenter: recB8Rec1.horizontalCenter
                    text: "00:00"
                    color: {
                        if(recB8But1.pressed || recB8But2.pressed || recB8But3.pressed || recB8But4.pressed|| recB8But5.pressed){
                            return "white"
                        }
                        else {
                            if(0) return "#C93D76"
                            else return "#979A9B"
                        }
                    }
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTexTimerBut8
                      visible: {
                          if(recB8But1.pressed || recB8But2.pressed || recB8But3.pressed || recB8But4.pressed|| recB8But5.pressed){
                              return false
                          }
                          else {
                              return true
                          }
                      }
                      anchors.fill: textTimerBut8
                      source: textTimerBut8
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB8Rec2
                anchors.horizontalCenter: recB8Rec1.horizontalCenter
                anchors.bottom: recB8Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But2
                    anchors.fill: recB8Rec2
                    onClicked: {
                        console.log("Button 888 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB8Rec3
                anchors.horizontalCenter: recB8Rec1.horizontalCenter
                anchors.top: recB8Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But3
                    anchors.fill: recB8Rec3
                    onClicked: {
                        console.log("Button 8888 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB8Rec4
                anchors.bottom: recB8Rec2.top
                anchors.horizontalCenter: recB8Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But4
                    anchors.fill: recB8Rec4
                    onClicked: {
                        console.log("Button 88888 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB8Rec5
                anchors.top: recB8Rec3.bottom
                anchors.horizontalCenter: recB8Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB8But5
                    anchors.fill: recB8Rec5
                    onClicked: {
                        console.log("Button 88888 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB9
            width: buttons_width / 2
            height: buttons_height / 2
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((350 + shiftX) - clearances)
            y: ((185 + shiftY) + (clearances * 2))
            //z: -1

            Image {
                id: imBye9
                anchors.fill: recB9
                anchors.margins: 1
                source: "images/МЕНЮ пустой шестиугольник 1 страница.png"
            }

            Rectangle {
                id:recB9Rec1
                x: mouse_range1_x / 2
                y: mouse_range1_y / 2
                z: 1
                width: mouse_range1_width / 2
                height: mouse_range1_height / 2
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB9But1
                    anchors.fill: recB9Rec1
                    onClicked: {
                        console.log("Button 9999999 clicked.");
                        stack.push(viewPage2);
                        Qt.quit();
                    }
                }
            }

            Rectangle {
                id:recB9Rec2
                anchors.horizontalCenter: recB9Rec1.horizontalCenter
                anchors.bottom: recB9Rec1.top
                z: 1
                width: mouse_range2_width / 2
                height: mouse_range2_height / 2
                color: "transparent"
                border.color: rec_range_color()
                MouseArea {
                    id: recB9But2
                    anchors.fill: recB9Rec2
                    onClicked: {
                        console.log("Button 999999 clicked.");

                    }
                }
            }

            Rectangle {
                id:recB9Rec3
                anchors.horizontalCenter: recB9Rec1.horizontalCenter
                anchors.top: recB9Rec1.bottom
                z: 1
                width: mouse_range3_width / 2
                height: mouse_range3_height / 2
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB9But3
                    anchors.fill: recB9Rec3
                    onClicked: {
                        console.log("Button 999999 clicked.");

                    }
                }
            }

            Rectangle {
                id:recB9Rec4
                anchors.bottom: recB9Rec2.top
                anchors.horizontalCenter: recB9Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width / 2
                height: mouse_range4_height / 2
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB9But4
                    anchors.fill: recB9Rec4
                    onClicked: {
                        console.log("Button 999999 clicked.");

                    }
                }
            }

            Rectangle {
                id:recB9Rec5
                anchors.top: recB9Rec3.bottom
                anchors.horizontalCenter: recB9Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width / 2
                height: mouse_range5_height / 2
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB9But5
                    anchors.fill: recB9Rec5
                    onClicked: {
                        console.log("Button 9999999 clicked.");

                    }
                }
            }

        }

        Rectangle {
            id: recLeftHexagon
            width: buttons_width / 4
            height: buttons_height / 4
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((122 + shiftX) + clearances)
            y: ((219 + shiftY) + (clearances * 2))
            //z: -1

            Image {
                id: imLeftHexagon
                anchors.fill: recLeftHexagon
                anchors.margins: 1
                source: "images/МЕНЮ пустой шестиугольник 1 страница.png"
            }
        }

        Rectangle {
            id: recLowerHexagon
            width: buttons_width / 2
            height: buttons_height / 2
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((350 + shiftX) - clearances)
            y: ((742 + shiftY) - (clearances * 2))
            //z: -1

            Image {
                id: imLowerHexagon
                anchors.fill: recLowerHexagon
                anchors.margins: 1
                source: "images/МЕНЮ пустой шестиугольник 1 страница.png"
            }
        }

    }

    Page {
        id: viewPage2
        visible: false
        //property real shiftXPage2: 0
        //property real shiftYPage2: 0

        Rectangle {
            id: recB10
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut37X + shiftXPage2) - clearances)
            y: ((recBut23Y + shiftYPage2) + clearances)
            z: -1
            Image {
                id: imBye10
                anchors.fill: recB10
                anchors.margins: 1
                source: (recB10But1.pressed || recB10But2.pressed || recB10But3.pressed || recB10But4.pressed || recB10But5.pressed)
                    ? "images/МЕНЮ Кровь 2 страница2.png"
                    : "images/МЕНЮ Кровь 2 страница.png"
            }

            Rectangle {
                id:recB10Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                Text {
                    id: nameButton10
                    anchors.bottom: recB10Rec1.bottom
                    anchors.bottomMargin: 10
                    anchors.horizontalCenter: recB10Rec1.horizontalCenter
                    text: qsTr("КРОВЬ")
                    color: (recB10But1.pressed || recB10But2.pressed || recB10But3.pressed || recB10But4.pressed || recB10But5.pressed)
                    ? "white"
                    : "#D82B2B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut10
                      visible: (recB10But1.pressed || recB10But2.pressed || recB10But3.pressed || recB10But4.pressed || recB10But5.pressed)
                               ? false : true
                      anchors.fill: nameButton10
                      source: nameButton10
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }

                MouseArea {
                    id: recB10But1
                    anchors.fill: recB10Rec1
                    onClicked: {

                        console.log("Button 2.1 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB10Rec2
                anchors.horizontalCenter: recB10Rec1.horizontalCenter
                anchors.bottom: recB10Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB10But2
                    anchors.fill: recB10Rec2
                    onClicked: {
                        onClicked: stack.pop(mainView);
                        console.log("Button 2.1 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB10Rec3
                anchors.horizontalCenter: recB10Rec1.horizontalCenter
                anchors.top: recB10Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB10But3
                    anchors.fill: recB10Rec3
                    onClicked: {
                        onClicked: stack.pop(mainView);
                        console.log("Button 2.1 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB10Rec4
                anchors.bottom: recB10Rec2.top
                anchors.horizontalCenter: recB10Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB10But4
                    anchors.fill: recB10Rec4
                    onClicked: {
                        onClicked: stack.pop(mainView);
                        console.log("Button 2.1 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB10Rec5
                anchors.top: recB10Rec3.bottom
                anchors.horizontalCenter: recB10Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB10But5
                    anchors.fill: recB10Rec5
                    onClicked: {
                        onClicked: stack.pop(mainView);
                        console.log("Button 333333 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB11
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: recBut148X + shiftXPage2
            y: recBut45Y + shiftYPage2
            //z: -1
            Image {
                id: imBye11
                anchors.fill: recB11
                anchors.margins: 1
                source: (recB11But1.pressed || recB11But2.pressed || recB11But3.pressed || recB11But4.pressed || recB11But5.pressed)
                    ? "images/МЕНЮ Сыворотка 2 страница2.png"
                    : "images/МЕНЮ Сыворотка 2 страница.png"
            }

            Rectangle {
                id:recB11Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB11But1
                    anchors.fill: recB11Rec1
                    onClicked: {
                        console.log("Button 4444 clicked.");
                    }
                }

                Text {
                    id: nameButton11
                    anchors.bottom: recB11Rec1.bottom
                    anchors.bottomMargin: 10
                    anchors.horizontalCenter: recB11Rec1.horizontalCenter
                    text: qsTr("СЫВОРОТКА")
                    color: (recB11But1.pressed || recB11But2.pressed || recB11But3.pressed || recB11But4.pressed || recB11But5.pressed)
                    ? "white"
                    : "#F4B12A"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut11
                      visible: (recB11But1.pressed || recB11But2.pressed || recB11But3.pressed || recB11But4.pressed || recB11But5.pressed)
                             ? false : true
                      anchors.fill: nameButton11
                      source: nameButton11
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB11Rec2
                anchors.horizontalCenter: recB11Rec1.horizontalCenter
                anchors.bottom: recB11Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB11But2
                    anchors.fill: recB11Rec2
                    onClicked: {
                        console.log("Button 2.2 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB11Rec3
                anchors.horizontalCenter: recB11Rec1.horizontalCenter
                anchors.top: recB11Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB11But3
                    anchors.fill: recB11Rec3
                    onClicked: {
                        console.log("Button 2.2 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB11Rec4
                anchors.bottom: recB11Rec2.top
                anchors.horizontalCenter: recB11Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB11But4
                    anchors.fill: recB11Rec4
                    onClicked: {
                        console.log("Button 2.2 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB11Rec5
                anchors.top: recB11Rec3.bottom
                anchors.horizontalCenter: recB11Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB11But5
                    anchors.fill: recB11Rec5
                    onClicked: {
                        console.log("Button 2.2 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB12
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((343 + shiftXPage2) - (clearances * 2))
            y: recBut45Y + shiftYPage2
            z: -1

            Image {
                id: imBye12
                anchors.fill: recB12
                anchors.margins: 1
                source: (recB12But1.pressed || recB12But2.pressed || recB12But3.pressed || recB12But4.pressed || recB12But5.pressed)
                    ? "images/МЕНЮ Стандарт 2 страница2.png"
                    : "images/МЕНЮ Стандарт 2 страница.png"
            }

            Rectangle {
                id:recB12Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()


                MouseArea {
                    id: recB12But1
                    anchors.fill: recB12Rec1
                    onClicked: {
                        console.log("Button 2.3 clicked.");
                    }
                }

                Text {
                    id: nameButton12
                    anchors.bottom: recB12Rec1.bottom
                    anchors.bottomMargin: 10
                    anchors.horizontalCenter: recB12Rec1.horizontalCenter
                    text: qsTr("СТАНДАРТ")
                    color: (recB12But1.pressed || recB12But2.pressed || recB12But3.pressed || recB12But4.pressed || recB12But5.pressed)
                        ? "white"
                        : "#66B2CC"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut12
                      visible: {
                          if(recB12But1.pressed || recB12But2.pressed || recB12But3.pressed || recB12But4.pressed|| recB12But5.pressed){
                              return false
                          }
                          else {
                              return true
                          }
                      }
                      anchors.fill: nameButton12
                      source: nameButton12
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB12Rec2
                anchors.horizontalCenter: recB12Rec1.horizontalCenter
                anchors.bottom: recB12Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB12But2
                    anchors.fill: recB12Rec2
                    onClicked: {
                        console.log("Button 2.3 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB12Rec3
                anchors.horizontalCenter: recB12Rec1.horizontalCenter
                anchors.top: recB12Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB12But3
                    anchors.fill: recB12Rec3
                    onClicked: {
                        console.log("Button 2.3 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB12Rec4
                anchors.bottom: recB12Rec2.top
                anchors.horizontalCenter: recB12Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB12But4
                    anchors.fill: recB12Rec4
                    onClicked: {
                        console.log("Button 2.3 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB12Rec5
                anchors.top: recB12Rec3.bottom
                anchors.horizontalCenter: recB12Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB12But5
                    anchors.fill: recB12Rec5
                    onClicked: {
                        console.log("Button 2.3 clicked.");
                    }
                }
            }

        }

        Rectangle {
            id: recB13
            width: buttons_width
            height: buttons_height
            color: "transparent"
            border.color: rec_range_color_set ? "black" : "transparent"
            x: ((recBut37X + shiftXPage2) - clearances)
            y: ((recBut67Y + shiftYPage2) - clearances)
            z: -1
            Image {
                id: imBye13
                anchors.fill: recB13
                anchors.margins: 1
                source: (recB13But1.pressed || recB13But2.pressed || recB13But3.pressed || recB13But4.pressed|| recB13But5.pressed)
                    ? "images/МЕНЮ Назад 2 страница2.png"
                    : "images/МЕНЮ Назад 2 страница.png"
            }

            Rectangle {
                id:recB13Rec1
                x: mouse_range1_x
                y: mouse_range1_y
                z: 1
                width: mouse_range1_width
                height: mouse_range1_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB13But1
                    anchors.fill: recB13Rec1
                    onClicked: {
                        console.log("2.4");
                        stack.pop(mainView);
                    }
                }

                Text {
                    id: nameButton13
                    anchors.bottom: recB13Rec1.bottom
                    anchors.bottomMargin: 11
                    anchors.horizontalCenter: recB13Rec1.horizontalCenter
                    text: qsTr("НАЗАД")
                    color: (recB13But1.pressed || recB13But2.pressed || recB13But3.pressed || recB13But4.pressed|| recB13But5.pressed)
                    ? "white"
                    : "#979A9B"
                    font.family: "Helvetica"
                    font.bold: true
                    font.pixelSize: but_text_size
                    font.letterSpacing: 1
                }

                DropShadow {
                      id: shadowTextBut13
                      visible: (recB13But1.pressed || recB13But2.pressed || recB13But3.pressed || recB13But4.pressed|| recB13But5.pressed)
                           ? false : true
                      anchors.fill: nameButton13
                      source: nameButton13
                      horizontalOffset: 2
                      color: "white"
                      radius: 0
                      samples: 3
                }
            }

            Rectangle {
                id:recB13Rec2
                anchors.horizontalCenter: recB13Rec1.horizontalCenter
                anchors.bottom: recB13Rec1.top
                z: 1
                width: mouse_range2_width
                height: mouse_range2_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB13But2
                    anchors.fill: recB13Rec2
                    onClicked: {
                        console.log("Button 2.4 clicked.");
                        onClicked: stack.pop(mainView);
                    }
                }
            }

            Rectangle {
                id:recB13Rec3
                anchors.horizontalCenter: recB13Rec1.horizontalCenter
                anchors.top: recB13Rec1.bottom
                z: 1
                width: mouse_range3_width
                height: mouse_range3_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB13But3
                    anchors.fill: recB13Rec3
                    onClicked: {
                        onClicked: stack.pop(mainView);
                        console.log("Button 2.4 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB13Rec4
                anchors.bottom: recB13Rec2.top
                anchors.horizontalCenter: recB13Rec2.horizontalCenter
                z: 1
                width: mouse_range4_width
                height: mouse_range4_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB13But4
                    anchors.fill: recB13Rec4
                    onClicked: {
                        onClicked: stack.pop(mainView);
                        console.log("Button 2.4 clicked.");
                    }
                }
            }

            Rectangle {
                id:recB13Rec5
                anchors.top: recB13Rec3.bottom
                anchors.horizontalCenter: recB13Rec3.horizontalCenter
                z: 1
                width: mouse_range5_width
                height: mouse_range5_height
                color: "transparent"
                border.color: rec_range_color()

                MouseArea {
                    id: recB13But5
                    anchors.fill: recB13Rec5
                    onClicked: {
                        onClicked: stack.pop(mainView);
                        console.log("Button 2.4 clicked.");
                    }
                }
            }

        }
    }

    Page {
        id: viewClock
        visible: false

        Rectangle {
            id: recBackgraundClock
            width: 600
            height: 1024
            color: "black"

            Image {
                id: imageBackgroundClock
                anchors.centerIn: recBackgraundClock
                source: "images/Часы в полный экран.png"

                Rectangle {
                    //color: "red"
                    color: "transparent"
                    x: 276
                    y: 479
                    z: 1
                    width: 1
                    height: 1
                }

                Image {
                    id: imageBackgroundArrow1
                    source: "images/Стрелка часы.png"
                    x: 265
                    y: 406
                    width: 55
                    height: 85

                    transform: Rotation {
                        id: hourRotationB
                        angle: ((hours * 30) - 30) + (minutes * 0.5)
                        origin.x: 11
                        origin.y: 73
                    }
                }

                Image {
                    id: imageBackgroundArrow2
                    source: "images/Стрелка минута.png"
                    x: 186.5
                    y: 383.5
                    width: 103
                    height: 109

                    transform: Rotation {
                        id: minuteRotationB
                        angle: (minutes * 6) + 43
                        origin.x: 89.5
                        origin.y: 95.5
                    }

                }

                Rectangle {
                    id: recBackgroundArrow3
                    color: "white"
                    x: 273
                    y: 372
                    width: 5
                    height: 110
                    radius: 5

                    transform: Rotation {
                        id: secondRotationB
                        angle: seconds * 6
                        origin.x: 3
                        origin.y: 107
                    }
                }
            }

            MouseArea {
                id: recClockBut1
                anchors.fill: recBackgraundClock
                onClicked: {
                    stack.pop(mainView);
                }
            }

        }
    }

    Page {
        id: setLanguage
        visible: false
    }
}
