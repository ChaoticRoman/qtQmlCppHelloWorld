import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    property string name
    property double price

    MyTextField {
        id: name
        text: parent.name

        anchors.top: parent.top
        anchors.left: parent.left
    }

    MyTextField {
        id: price
        text: parent.price

        anchors.top: name.bottom
        anchors.left: parent.left
    }

    border.width: 1
}
