Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aStkj-0000fp-4S
	for mharc-qemu-trivial@gnu.org; Mon, 08 Feb 2016 16:53:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1aStkg-0000cy-6a
	for qemu-trivial@nongnu.org; Mon, 08 Feb 2016 16:53:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1aStkd-0000cP-15
	for qemu-trivial@nongnu.org; Mon, 08 Feb 2016 16:53:46 -0500
Received: from s16892447.onlinehome-server.info ([82.165.15.123]:51114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1aStkc-0000cK-Pz; Mon, 08 Feb 2016 16:53:42 -0500
Received: from host86-137-255-7.range86-137.btcentralplus.com ([86.137.255.7]
	helo=[192.168.1.65]) by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1aStka-000173-4i; Mon, 08 Feb 2016 21:53:41 +0000
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1454939707-10869-1-git-send-email-berrange@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <56B90E5D.3010105@ilande.co.uk>
Date: Mon, 8 Feb 2016 21:53:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1454939707-10869-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.137.255.7
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] char: fix repeated
 registration of tcp chardev I/O handlers
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Feb 2016 21:53:47 -0000

On 08/02/16 13:55, Daniel P. Berrange wrote:

> In previous commit:
> 
>   commit f2001a7e0555b66d6db25a3ff1801540814045bb
>   Author: Daniel P. Berrange <berrange@redhat.com>
>   Date:   Tue Jan 19 11:14:30 2016 +0000
> 
>     char: don't assume telnet initialization will not block
> 
> The code which writes the telnet initialization sequence moved
> to an event loop callback. If the TCP chardev is opened as a
> server in blocking mode (ie -serial telnet:0.0.0.0:3000,server,wait)
> this results in a state where the TCP chardev is connected, but not
> yet ready to send/recv data when virtual hardware is created.
> 
> When the virtual hardware initialization registers its chardev
> callbacks, it triggers tcp_chr_update_read_handler, which will
> add I/O watches to the connection.
> 
> When the telnet initialization finally runs, it will then call
> tcp_chr_connect to finish the connection setup. This will in
> turn add I/O watches to the connection too.
> 
> There are now two sets of I/O watches registered on the same
> connection. This ultimately causes data loss on the connection,
> for example, when typing into the telnet console only every
> second byte is echoed back to the client.
> 
> The same flaw can affect channels running with TLS encryption
> too, since they also have delayed connection setup completion.
> 
> The fix is to update tcp_chr_update_read_handler so that it
> avoids registering watches if the connection is not fully
> setup yet.
> 
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  qemu-char.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/qemu-char.c b/qemu-char.c
> index 927c47e..9060f8a 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -2856,6 +2856,10 @@ static void tcp_chr_update_read_handler(CharDriverState *chr)
>  {
>      TCPCharDriver *s = chr->opaque;
>  
> +    if (!s->connected) {
> +        return;
> +    }
> +
>      remove_fd_in_watch(chr);
>      if (s->ioc) {
>          chr->fd_in_tag = io_add_watch_poll(s->ioc,
> 

Hi Daniel,

Yes I can confirm that this patch fixes the issue for me - thanks a lot
for debugging!


ATB,

Mark.


