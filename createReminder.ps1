[reflection.assembly]::loadwithpartialname('System.Windows.Forms');
[reflection.assembly]::loadwithpartialname('System.Drawing');

$screenIndex = $args[0]
$textToDisplay = $args[1]

$screen = [System.Windows.Forms.Screen]::AllScreens[$screenIndex]

$formWindow = New-Object System.Windows.Forms.Form;

$bigFullScreenButton = New-Object System.Windows.Forms.Button;
$formWindow.SuspendLayout();

# Button 

$bigFullScreenButton.AutoSize = $true;
$bigFullScreenButton.Dock = [System.Windows.Forms.DockStyle]::Fill;
$bigFullScreenButton.Font = [System.Drawing.Font]::new("Microsoft Sans Serif", 100, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point);
$bigFullScreenButton.Location = [System.Drawing.Point]::new(0, 0);
$bigFullScreenButton.Name = "BigFullScreenButton";
$bigFullScreenButton.Size = [System.Drawing.Size]::new(1445, 856);
$bigFullScreenButton.TabIndex = 0;
$bigFullScreenButton.Text = $textToDisplay;
$bigFullScreenButton.UseVisualStyleBackColor = $true;

$button_click = {$formWindow.Close()}
$bigFullScreenButton.Add_Click($button_click)

# Form

$formWindow.AutoScaleDimensions = [System.Drawing.SizeF]::new(8, 16);
$formWindow.AutoScaleMode = [System.Windows.Forms.AutoScaleMode]::Font;
$formWindow.ClientSize = [System.Drawing.Size]::new(1445, 856);
$formWindow.ControlBox = $false;
$formWindow.Controls.Add($bigFullScreenButton);
$formWindow.maximizeBox = $false;
$formWindow.minimizeBox = $false;
$formWindow.Name = "ReminderWindow";
$formWindow.ShowIcon = $false;

$formWindow.ResumeLayout($false);
$formWindow.TopMost = $true
$formWindow.PerformLayout();

$formWindow.Location = $screen.WorkingArea.Location
$formWindow.StartPosition = [System.Windows.Forms.FormStartPosition]::Manual;

$formWindow.WindowState = [System.Windows.Forms.FormWindowState]::Maximized;

$formWindow.ShowDialog();