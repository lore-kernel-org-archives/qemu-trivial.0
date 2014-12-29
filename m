Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y5X6j-0002jg-4w
	for mharc-qemu-trivial@gnu.org; Mon, 29 Dec 2014 04:59:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Y5X6g-0002hw-Rw
	for qemu-trivial@nongnu.org; Mon, 29 Dec 2014 04:59:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Y5X6g-00081B-2R
	for qemu-trivial@nongnu.org; Mon, 29 Dec 2014 04:59:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46925)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Y5X6Z-0007iP-Tf; Mon, 29 Dec 2014 04:59:16 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E53A2440C3;
	Mon, 29 Dec 2014 12:59:02 +0300 (MSK)
Message-ID: <54A125E6.4050807@msgid.tls.msk.ru>
Date: Mon, 29 Dec 2014 12:59:02 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Don Slutz <dslutz@verizon.com>, qemu-devel@nongnu.org, 
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1419260640-2922-1-git-send-email-dslutz@verizon.com>
In-Reply-To: <1419260640-2922-1-git-send-email-dslutz@verizon.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH 1/1] Do not hang on full PTY
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
X-List-Received-Date: Mon, 29 Dec 2014 09:59:23 -0000

22.12.2014 18:04, Don Slutz wrote:

> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -1387,6 +1387,7 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
>      }
>  
>      close(slave_fd);
> +    qemu_set_nonblock(master_fd);
>  
>      chr = qemu_chr_alloc();


Hm.  I'm not sure at all this is a trivial change.  While the
patch itself is trivial indeed, it changes behavour of the file
descriptor significantly.  Are all the places where this fd is
subsequently used prepared for it being non-blocking?  Oh well... ;)

Thanks,

/mjt

