import FruitListModel 1.0

import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: "Hello World"

    ItemList {
        id: list

        model: FruitListModel {}

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 12
    }

    ItemDetail {
        model: list.model
        index: list.currentIndex

        anchors.left: list.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 12
    }
}
