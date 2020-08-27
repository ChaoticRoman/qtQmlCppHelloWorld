import QtQuick 2.0

ListView {
    id: list
    width: 200

    model: FruitListModel {}

    delegate: Rectangle
    {
        // it is very important for a delegate to have dimensions
        // for ListView's stacking order to work
        height: 30
        width: 200

        // highlight has z-order 0 so our item goes over it thus we need
        // to make it transparent for highlight colorto have any effect
        color: "transparent"

        border.width: 1

        Text
        {
            anchors.fill: parent
            anchors.margins: 4

            text: name
            font.pointSize: 14
        }

        MouseArea {
            anchors.fill: parent
            onClicked: list.currentIndex = index
        }
    }
    spacing: 6

    highlight: Rectangle {
        color: "lightsteelblue"
    }
}
