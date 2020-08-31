#include "FruitListModel.h"
#include <QDebug>

FruitListModel::FruitListModel(QObject *parent):
    QAbstractListModel(parent)
{
    fruitList_ << Fruit {"Apple", 0.6};
    fruitList_ << Fruit {"Banana", 1.1};
    fruitList_ << Fruit {"Lemon", 1.4};
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

QVariantMap FruitListModel::get(int i) {
    QHash<int, QByteArray> names = roleNames();
    QHashIterator<int, QByteArray> iter(names);
    QVariantMap res;
    while (iter.hasNext()) {
        iter.next();
        QModelIndex idx = index(i, 0);
        QVariant data = idx.data(iter.key());
        res[iter.value()] = data;
    }
    return res;
}

void FruitListModel::setName(int i, QString name)
{
     fruitList_[i].name = name;
     QModelIndex index = createIndex(i, 0);
     emit dataChanged(index, index);
}

void FruitListModel::setPrice(int i, double price)
{
    fruitList_[i].price = price;
    QModelIndex index = createIndex(i, 0);
    emit dataChanged(index, index);
}

void FruitListModel::addItem()
{
    int index = fruitList_.length();
    emit beginInsertRows(QModelIndex(), index, index);
    fruitList_ << Fruit {QString("Item #%0").arg(index), 0};
    emit endInsertRows();
}
