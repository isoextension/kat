package main

import (
	"log"
	"os"
	"os/exec"

	"github.com/therecipe/qt/core"
	"github.com/therecipe/qt/qml"
	"github.com/therecipe/qt/widgets"
)

func main() {
	widgets.NewQApplication(len(os.Args), os.Args)

	engine := qml.NewQQmlApplicationEngine(nil)
	engine.Load(core.NewQUrl3("main.qml", 0))

	if engine.RootObjects().Length() == 0 {
		log.Fatal("Error loading QML file")
	}

	// Expose Go function to QML
	root := engine.RootObjects().At(0)
	ctx := engine.RootContext()
	ctx.SetContextProperty("archiver", &Archiver{})

	widgets.QApplication_Exec()
}

type Archiver struct{}

// Extract function exposed to QML
func (a *Archiver) Extract(file string, dest string) {
	cmd := exec.Command("tar", "-xf", file, "-C", dest)
	if err := cmd.Run(); err != nil {
		log.Println("Extraction failed:", err)
	}
}
