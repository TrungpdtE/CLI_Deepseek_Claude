#!/bin/bash
# chmod +x CLI.command

cd "$(dirname "$0")"
# ==================================
# Claude / DeepSeek Launcher
# macOS Version
# ==================================

# =========================
# Auto Install Homebrew
# =========================

if ! command -v brew &> /dev/null
then
    echo ""
    echo "Installing Homebrew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# =========================
# Auto Install Node.js
# =========================

if ! command -v node &> /dev/null
then
    echo ""
    echo "Installing Node.js..."

    brew install node
fi

# =========================
# Auto Install Claude CLI
# =========================

if ! command -v claude &> /dev/null
then
    echo ""
    echo "Installing Claude CLI..."

    npm install -g @anthropic-ai/claude-code
fi

# =========================
# Auto Install DeepSeek CLI
# =========================

if ! command -v deepseek &> /dev/null
then
    echo ""
    echo "Installing DeepSeek CLI..."

    npm install -g deepseek-tui
fi

# =========================
# Main Loop
# =========================

while true
do

    clear

    echo "=================================="
    echo " Claude / DeepSeek Launcher"
    echo "=================================="

    echo ""

    # Claude Key Status
    if command -v claude &> /dev/null
    then
        echo "Claude CLI: Installed"
    else
        echo "Claude CLI: Missing"
    fi

    # DeepSeek Key Status
    if grep -q "DEEPSEEK_API_KEY" ~/.zshrc 2>/dev/null
    then
        echo "DeepSeek API Key: OK"
    else
        echo "DeepSeek API Key: Missing"
    fi

    echo ""
    echo "=================================="
    echo " MENU"
    echo "=================================="

    echo "0. Setup API Key"
    echo "1. Remove API Key"
    echo "2. Claude"
    echo "3. DeepSeek"
    echo "4. Exit"

    echo ""

    read -p "Choose: " choice

    # =========================
    # Setup API Key
    # =========================

    if [ "$choice" = "0" ]; then

        echo ""
        echo "1. Claude API Key"
        echo "2. DeepSeek API Key"

        echo ""

        read -p "Choose key type: " key_choice

        # Claude API Key
        if [ "$key_choice" = "1" ]; then

            echo ""

            read -p "Paste Claude API Key: " claude_key

            # remove old key
            sed -i '' '/ANTHROPIC_API_KEY/d' ~/.zshrc 2>/dev/null

            # save new key
            echo "" >> ~/.zshrc
            echo "export ANTHROPIC_API_KEY=\"$claude_key\"" >> ~/.zshrc

            export ANTHROPIC_API_KEY="$claude_key"

            echo ""
            echo "Claude API Key saved"

        fi

        # DeepSeek API Key
        if [ "$key_choice" = "2" ]; then

            echo ""

            read -p "Paste DeepSeek API Key: " deepseek_key

            # remove old key
            sed -i '' '/DEEPSEEK_API_KEY/d' ~/.zshrc 2>/dev/null

            # save new key
            echo "" >> ~/.zshrc
            echo "export DEEPSEEK_API_KEY=\"$deepseek_key\"" >> ~/.zshrc

            export DEEPSEEK_API_KEY="$deepseek_key"

            echo ""
            echo "DeepSeek API Key saved"

        fi

        echo ""
        read -p "Press Enter to return menu..."

    fi

    # =========================
    # Remove API Key
    # =========================

    if [ "$choice" = "1" ]; then

        echo ""
        echo "1. Remove Claude API Key"
        echo "2. Remove DeepSeek API Key"

        echo ""

        read -p "Choose: " remove_choice

        # Remove Claude Key
        if [ "$remove_choice" = "1" ]; then

            sed -i '' '/ANTHROPIC_API_KEY/d' ~/.zshrc 2>/dev/null

            unset ANTHROPIC_API_KEY

            echo ""
            echo "Claude API Key removed"

        fi

        # Remove DeepSeek Key
        if [ "$remove_choice" = "2" ]; then

            sed -i '' '/DEEPSEEK_API_KEY/d' ~/.zshrc 2>/dev/null

            unset DEEPSEEK_API_KEY

            echo ""
            echo "DeepSeek API Key removed"

        fi

        echo ""
        read -p "Press Enter to return menu..."

    fi

    # =========================
    # Launch Claude
    # =========================

    if [ "$choice" = "2" ]; then

        if grep -q "ANTHROPIC_API_KEY" ~/.zshrc 2>/dev/null
        then

            clear

            echo "Launching Claude..."
            echo ""

            claude

        else

            echo ""
            echo "Claude API Key not found"
            echo "Please setup API key first"

            echo ""
            read -p "Press Enter to return menu..."

        fi

    fi

    # =========================
    # Launch DeepSeek
    # =========================

    if [ "$choice" = "3" ]; then

        if grep -q "DEEPSEEK_API_KEY" ~/.zshrc 2>/dev/null
        then

            clear

            echo "Launching DeepSeek..."
            echo ""

            deepseek

        else

            echo ""
            echo "DeepSeek API Key not found"
            echo "Please setup API key first"

            echo ""
            read -p "Press Enter to return menu..."

        fi

    fi

    # =========================
    # Exit
    # =========================

    if [ "$choice" = "4" ]; then

        clear

        echo "Goodbye!"
        echo ""

        exit

    fi

done