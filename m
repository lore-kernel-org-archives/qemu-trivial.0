Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIXvS-0001pI-J1
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:34:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXvR-0001n0-8I
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:34:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXvQ-00078G-D3
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:34:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIXvL-00077X-VA; Mon, 11 Jan 2016 03:34:00 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 848D140375;
	Mon, 11 Jan 2016 11:33:59 +0300 (MSK)
To: Ashley Jonathan <jonathan.ashley@altran.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <AC19797808C8D548ABDE0CA4A97AA30A30DEB409@XMB-DCFR-37.europe.corp.altran.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <569368F6.3050704@msgid.tls.msk.ru>
Date: Mon, 11 Jan 2016 11:33:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <AC19797808C8D548ABDE0CA4A97AA30A30DEB409@XMB-DCFR-37.europe.corp.altran.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Keep pty slave file descriptor open
 until the master is closed
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
X-List-Received-Date: Mon, 11 Jan 2016 08:34:06 -0000

11.12.2015 14:29, Ashley Jonathan wrote:
> I have experienced a minor difficulty using QEMU with the "-serial pty" option:
> 
> If a process opens the slave pts device, writes data to it, then immediately closes it, the data doesn't reliably get delivered to the emulated serial port. This seems to be because a read of the master pty device returns EIO on Linux if no process has the pts device open, even when data is waiting "in the pipe".
> 
> A fix seems to be for QEMU to keep the pts file descriptor open until the pty is closed, as per the below patch.

The patch looks fine, so

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>

but I'd love to have an ACK from the maintainer about this one,
or for it to pick it up.

Thanks,

/mjt

> ---
>  qemu-char.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/qemu-char.c b/qemu-char.c
> index 2969c44..ed03ba0 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -1198,6 +1198,7 @@ typedef struct {
>      int connected;
>      guint timer_tag;
>      guint open_tag;
> +    int slave_fd;
>  } PtyCharDriver;
>  
>  static void pty_chr_update_read_handler_locked(CharDriverState *chr);
> @@ -1373,6 +1374,7 @@ static void pty_chr_close(struct CharDriverState *chr)
>  
>      qemu_mutex_lock(&chr->chr_write_lock);
>      pty_chr_state(chr, 0);
> +    close(s->slave_fd);
>      fd = g_io_channel_unix_get_fd(s->fd);
>      g_io_channel_unref(s->fd);
>      close(fd);
> @@ -1401,7 +1403,6 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
>          return NULL;
>      }
>  
> -    close(slave_fd);
>      qemu_set_nonblock(master_fd);
>  
>      chr = qemu_chr_alloc();
> @@ -1422,6 +1423,7 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
>      chr->explicit_be_open = true;
>  
>      s->fd = io_channel_from_fd(master_fd);
> +    s->slave_fd = slave_fd;
>      s->timer_tag = 0;
>  
>      return chr;
> 


