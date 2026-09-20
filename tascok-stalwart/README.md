<p align="left">
  <img src="https://github.com/user-attachments/assets/2c02c26d-0505-47dc-a290-67bce1bd42f4" alt="Stalwart Logo" width="120" />
</p>


# Stalwart Setup Guide for Umbrel

## 🔐 Log in to the Web Interface

Once Stalwart is installed, open the web interface at:  
`http://umbrel.local:18080`

The first time it starts, Umbrel will show you the administrator login credentials in the app logs (right-click on troubleshooting). They will look like this:  
**Username:** `admin`  
**Password:** something like `w95Yuiu36E`

Use these credentials to log in.

---

## 💾 Choose Where to Store Your Data

After logging in, go to **Settings > Storage**. There, you can define where Stalwart stores data, blobs, full-text indexes, and in-memory storage.

By default, Stalwart uses RocksDB, which is already preconfigured. If you’re happy with the default, you can skip this step.

---

## 🌐 Set Hostname and Domain

Go to **Settings > Server > Network** and make sure your server’s hostname is correct.  
Then open **Management > Directory > Domains** and add your main domain (e.g., `example.org`).

After adding the domain, Stalwart will show you the necessary **DNS records** to add to your domain settings – including MX, DKIM, SPF, and DMARC.

---

## 🔒 Enable TLS

To secure communication between the server and clients, you need a valid TLS certificate:

- If you already have a TLS certificate, upload it under **Settings > Server > TLS > Certificates**.
- If not, you can enable automatic certificates from **Let’s Encrypt** under **Settings > Server > TLS > ACME Providers**. Make sure your server’s hostname is listed correctly.
- If you’re using a reverse proxy (like **Traefik**, **NGINX**, or **Caddy**), you can skip this step and configure TLS directly in your proxy.

---

### 📡 Ports and Their Usage

Stalwart Mail uses the following ports for its various services. Make sure these are correctly mapped and accessible as needed:

- **1443**: HTTPS (alternative to port 443)  
- **25**: Standard SMTP (used for mail transfer between servers)  
- **587**: SMTP Submission (used by mail clients to send mail)  
- **465**: SMTPS (SMTP over SSL, legacy but still supported)  
- **143**: IMAP (used by mail clients to retrieve emails without SSL)  
- **993**: IMAPS (IMAP over SSL)  
- **4190**: Sieve (used for mail filtering rules)  
- **110**: POP3 (retrieve emails without SSL, legacy protocol)  
- **995**: POP3S (POP3 over SSL)

Make sure your network or firewall configuration allows traffic through the ports you plan to use.

---

## ✅ Finish Setup

Once your configuration is complete, restart the app from Umbrel’s menu.

That’s it – your self-hosted mail and collaboration server is now up and running.

---

![screencast-setup-eaaa5ec230e33ea7507c0db48aca8fc5](https://github.com/user-attachments/assets/b8eeacaa-731f-4ba9-8e4d-aab3b4bb7671)

---

For more information and detailed instructions, please visit the official documentation:  
https://stalw.art/docs/category/getting-started
