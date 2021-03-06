#include "FruitListModel.h"

#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QTimer>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<FruitListModel>("FruitListModel", 1, 0, "FruitListModel");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    FruitListModel fruitListModel;
    engine.rootContext()->setContextProperty("fruitListModel", &fruitListModel);

    QTimer timer;
    QObject::connect(&timer, &QTimer::timeout, &fruitListModel, &FruitListModel::inflatePrices);
    timer.start(1000);

    engine.load(url);

    return app.exec();
}
