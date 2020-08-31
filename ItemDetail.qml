import QtQuick 2.0
import QtQuick.Controls 2.12

Rectangle {
    property var index
    property var model

    property var name: model.get(index).nameRole
    property var price: model.get(index).priceRole


    MyTextField {
        id: name
        text: parent.name

        anchors.top: parent.top
        anchors.left: parent.left

        onEditingFinished: {
            console.log(index, text)
            parent.model.setName(index, text)
        }
    }

    MyTextField {
        id: price
        text: parent.price

        anchors.top: name.bottom
        anchors.left: parent.left

        onEditingFinished: {
            console.log(index, text)
            parent.model.setPrice(index, text)
        }
    }

    border.width: 1
}
