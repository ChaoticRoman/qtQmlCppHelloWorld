import QtQuick 2.0

Rectangle {
    property var index
    property var model

    property var name: if (index >= 0) model.get(index).nameRole; else ""
    property var price: if (index >= 0) model.get(index).priceRole; else -1;


    MyTextField {
        id: nameField
        text: parent.name

        anchors.top: parent.top
        anchors.left: parent.left

        onEditingFinished: parent.model.setName(index, text)
    }

    MyTextField {
        id: priceField
        text: if (parent.index >= 0) parent.price.toFixed(2); else "";

        anchors.top: nameField.bottom
        anchors.left: parent.left

        onEditingFinished: parent.model.setPrice(index, text)
    }

    MyButton {
        id: removeButton
        text: "Remove..."

        anchors.bottom: parent.bottom
        anchors.left: parent.left

        onClicked: parent.model.removeItem(index)
    }
}
