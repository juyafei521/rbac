<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%s_category}}".
 *
 * @property string $id
 * @property string $pid
 * @property string $name
 * @property string $sort_order
 * @property integer $status
 * @property string $date
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%s_category}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid', 'sort_order', 'status', 'date'], 'integer'],
            [['name'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pid' => 'Pid',
            'name' => 'Name',
            'sort_order' => 'Sort Order',
            'status' => 'Status',
            'date' => 'Date',
        ];
    }
}
