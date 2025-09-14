import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 400
    height: 200
    title: "kat"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        TextField {
            id: archivePath
            placeholderText: "Archive file path"
        }

        TextField {
            id: destPath
            placeholderText: "Destination folder"
        }

        Button {
            text: "Extract"
            onClicked: {
                archiver.Extract(archivePath.text, destPath.text)
            }
        }
    }
}
