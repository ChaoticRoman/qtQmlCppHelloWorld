#ifndef FRUITLISTMODEL_H
#define FRUITLISTMODEL_H

#include <QAbstractListModel>
#include <QList>

struct Fruit {
    QString name;
    double price;
};

class FruitListModel: public QAbstractListModel
{
    Q_OBJECT

public:
    FruitListModel(QObject *parent = nullptr);

    enum {
        nameRole = Qt::UserRole,
        priceRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    virtual QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE QVariantMap get(int i);
    Q_INVOKABLE void setName(int i, QString name);
    Q_INVOKABLE void setPrice(int i, double price) { fruitList_[i].price = price; }

private:
    QList<Fruit> fruitList_;
};
#endif // FRUITLISTMODEL_H
