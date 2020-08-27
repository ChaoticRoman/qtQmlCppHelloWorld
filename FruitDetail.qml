import QtQuick 2.0

Rectangle {
    property string text: "Hello"

    Text {
        text: parent.text

        color: "white"
        font.pointSize: 20

        anchors.fill: parent
        anchors.margins: 12
    }

    color: "blue";
}
