import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: "Hello World"

    FruitList {
        id: list

        anchors.left: parent.left

        anchors.top: parent.top
        anchors.bottom: parent.bottom

        anchors.margins: 12
    }

    FruitDetail {
        anchors.left: list.right

        anchors.top: parent.top
        anchors.bottom: parent.bottom

        anchors.margins: 12
    }
}
