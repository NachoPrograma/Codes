Add-Type -Assembly PresentationFramework # Ensamblado necesario para Windows
[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window" Title="Mi aplicacion" Width="300" Height="300">
    <StackPanel>
    <TextBlock Text="APLICACIÓN" FontSize="30" FontWeight="Bold" TextAlignment="Center" Margin="10"/>
        <TextBox x:Name = "MyTextBox" Width="150"/>
        <TextBlock x:Name = "MyTextBlock" Width = "200"/>
        <Button x:Name = "MyButton" Content="ACEPTAR" Width = "120"/>
        
    </StackPanel>
</Window>
"@
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)
# Asignacion de variables. Se obtiene del codigo XAML
$MyButton = $window.FindName("MyButton")
$MyTextBox = $window.FindName("MyTextBox")
$MyTextBlock = $window.FindName("MyTextBlock")

$MyButton.Add_Click({
    If($MyTextBox.Text.Equals("1234")){
        $MyTextBlock.Text = "CORRECTO!"
    }else {
        $MyTextBlock.Text = "INCORRECTO"
    }
})



$window.ShowDialog()