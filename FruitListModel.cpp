#include "FruitListModel.h"

FruitListModel::FruitListModel(QObject *parent):
    QAbstractListModel(parent)
{
    for (int i=0; i < 10000; i++)
        fruitList_ << Fruit {QString("Banana #%0").arg(i), 1.01 * i};
}

int FruitListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return fruitList_.length();
}

QVariant FruitListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (index.row() < 0 || fruitList_.size() <= index.row())
        return QVariant();

    if (role == nameRole)
        return QVariant::fromValue(fruitList_[index.row()].name);
    else if (role == priceRole)
        return QVariant::fromValue(fruitList_[index.row()].price);
    else
        return QVariant();
}

QHash<int, QByteArray> FruitListModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[nameRole] = "nameRole";
    names[priceRole] = "priceRole";
    return names;
}

QVariantMap FruitListModel::get(int row) {
    QHash<int, QByteArray> names = roleNames();
    QHashIterator<int, QByteArray> i(names);
    QVariantMap res;
    while (i.hasNext()) {
        i.next();
        QModelIndex idx = index(row, 0);
        QVariant data = idx.data(i.key());
        res[i.value()] = data;
    }
    return res;
}
