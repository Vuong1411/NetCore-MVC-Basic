using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Options;
using MimeKit;
using MailKit.Net.Smtp;

using Classwork.Utils.ConfigOptions;

public class EmailSenderService : IEmailSender
{
    private readonly EmailSettings _emailSettings;

    public EmailSenderService(IOptions<EmailSettings> emailSettings)
    {
        _emailSettings = emailSettings.Value;
    }

    public async Task SendEmailAsync(string email, string subject, string message)
    {
        var emailMessage = new MimeMessage();

        emailMessage.From.Add(new MailboxAddress(_emailSettings.FromName, _emailSettings.FromEmail));

        var emailList = email.Split(",");
        foreach (var e in emailList)
        {
            emailMessage.To.Add(new MailboxAddress("", e));
        }

        emailMessage.Subject = subject;
        emailMessage.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = message };

        using (var client = new SmtpClient())
        {
            await client.ConnectAsync(_emailSettings.SmtpServer, _emailSettings.SmtpPort, false);
            await client.AuthenticateAsync(_emailSettings.FromEmail, _emailSettings.Password);
            await client.SendAsync(emailMessage);
            await client.DisconnectAsync(true);
        }
    }
}
