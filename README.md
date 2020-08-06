# テーブル設計

## users テーブル

| Column       | Type   | Option      |
| ___________  | ______ | ___________ |
| name         | string | null:false  |
| email        | string | null:false  |
| password     | string | null:false  |

### Association

- has_many :room-users
- has_many :rooms, through: room-users
- has_many :messages


## rooms テーブル
| Column       | Type   | Option      |
| ___________  | ______ | ___________ |
| name         | string | null:false  |

### Association

- has_many :room-users
- has_many :users, through: room-users
- has_many :messages

## room_user テーブル
| Column      | Type       | Option                         |
| ___________ | __________ | ______________________________ |
| user        | references | null:false, foreign_key: true  |
| room        | references | null:false, foreign_key: true  |

### Association

- belongs_to: room
- belongs_to: user

## messages テーブル
| Column      | Type          | Option                         |
| ___________ | __________    | ______________________________ |
| content        | string     |                                |
| user           | references | null:false, foreign_key: true  |
| name           | references | null:false, foreign_key: true  |

### Association

- belongs_to: room
- belongs_to: user