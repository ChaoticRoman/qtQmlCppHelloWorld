import QtQuick 2.0

Rectangle {
    property string text

    Text {
        text: parent.text

        font.pointSize: 20

        anchors.fill: parent
        anchors.margins: 12
    }

    border.width: 1
}
