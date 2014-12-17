class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :events_participants do |t|
      t.integer :participant_id
      t.references :event

      t.timestamps
    end

    create_table :events_hosts do |t|
      t.integer :host_id
      t.references :event

      t.timestamps
    end
  end
end
