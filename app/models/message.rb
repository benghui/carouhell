class Message < ApplicationRecord
    # after_create_commit { MessageBroadcastJob.perform_later self } #remove callback from model
end