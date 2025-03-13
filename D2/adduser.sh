name="Naman"

echo "Greeting from $name"

read -p "Enter Username: " username

echo "Your username : $username"

sudo useradd -m $username

echo "New User $username added"
