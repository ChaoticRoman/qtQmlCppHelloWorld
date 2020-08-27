import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: "Hello World"

    FruitList {
        id: list

        model: FruitListModel {}

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 12
    }

    FruitDetail {
        property int index: list.currentIndex
        property var item: list.model.get(index)

        text: item.name + "\nPrice: " + item.price

        anchors.left: list.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 12
    }
}
