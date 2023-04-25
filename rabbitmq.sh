script=$(realpath $0)
script_path=$(dirname $script)
source ${script_path}/common.sh
RABBIT_MQ_PASSWD=$1

curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
yum install erlang -y
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
yum install rabbitmq-server -y
systemctl enable rabbitmq-server
systemctl start rabbitmq-server
rabbitmqctl add_user $app_user ${RABBIT_MQ_PASSWD}
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"