import QtQuick 2.0

Column {
    property var model // be carreful on direction of binding
    property var currentIndex: list.currentIndex

    width: 200
    height: parent.height
    spacing: 30

    ListView {
        id: list
        width: parent.width
        height: parent.height - addButton.height - parent.spacing

        model: parent.model // model is read from Column's model

        highlightMoveDuration: 200

        delegate: ItemDelegate {
            text: nameRole  // name must be provided by model's items
        }

        spacing: 6

        highlight: Rectangle {
            color: "lightsteelblue"
        }

        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true // [1]
            onClicked: {
                parent.focus = true
                mouse.accepted = false // [1]
            }
        }
        // [1] https://stackoverflow.com/questions/42505727/qt-qml-can-a-mousearea-see-events-but-pass-them-all-to-parent-without-affectin
    }

    MyButton {
        id: addButton
        text: "Add new..."
        onClicked: parent.model.addItem()
    }
}
