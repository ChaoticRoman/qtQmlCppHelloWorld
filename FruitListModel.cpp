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

    if (!inBounds(index.row()))
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

QVariantMap FruitListModel::get(int i) const {
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
    if (!inBounds(i)) return;

     fruitList_[i].name = name;
     QModelIndex index = createIndex(i, 0);
     emit dataChanged(index, index);
}

void FruitListModel::setPrice(int i, double price)
{
    if (!inBounds(i)) return;
    fruitList_[i].price = price;
    QModelIndex index = createIndex(i, 0);
    emit dataChanged(index, index);
}

void FruitListModel::addItem()
{
    int index = fruitList_.length();
    beginInsertRows(QModelIndex(), index, index);
    fruitList_ << Fruit {QString("Item #%0").arg(index), 0};
    endInsertRows();
}

void FruitListModel::removeItem(int i)
{
    if (!inBounds(i)) return;

    beginRemoveRows(QModelIndex(), i, i);
    fruitList_.removeAt(i);
    endRemoveRows();
}

bool FruitListModel::inBounds(int i) const
{
    if (i >= 0 && i < fruitList_.length())
        return true;

    qDebug() << "Out of bound access to index" << i;
    return false;
}
