#!/bin/bash

echo "Parent start..."

echo "Parent starting child script."

/home/user/Git/Linux/async-child.sh &
pid=$!

echo "Child script starts PID=$pid"

echo "Parent continuing"
sleep 1

echo "Pause wait for child script"

wait $pid

echo "Child finiched. Continuing"
echo "Finish"


