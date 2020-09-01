import QtQuick 2.0

Rectangle {
    property var index
    property var model

    property var name: model.get(index).nameRole
    property var price: model.get(index).priceRole

    Connections {
        target: model
        onDataChanged: {
            if (!nameField.focus)
                name = model.get(index).nameRole ? model.get(index).nameRole : "";
            if (!priceField.focus)
                price = model.get(index).priceRole ? model.get(index).priceRole : "";
        }
    }

    MyTextField {
        id: nameField
        text: parent.name

        anchors.top: parent.top
        anchors.left: parent.left

        onEditingFinished: parent.model.setName(index, text)
    }

    MyTextField {
        id: priceField
        text: if (price && parent.index >= 0) parent.price.toFixed(2); else "";

        anchors.top: nameField.bottom
        anchors.left: parent.left

        // The originalValue stuff is for changes to take effect as nothing
        // is happening when user does not change the field and change
        // the value if he or she does.
        property string originalValue
        onFocusChanged: if (focus) originalValue = text
        onEditingFinished: if (text != originalValue) parent.model.setPrice(index, text)
    }

    MyButton {
        id: removeButton
        text: "Remove..."

        anchors.bottom: parent.bottom
        anchors.left: parent.left

        onClicked: parent.model.removeItem(index)
    }
}
