Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK6TV-0003sw-E5
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 07:53:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6TP-0003dY-HM
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 07:53:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6TO-0002zc-I3
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 07:53:43 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:46190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK6TG-0002xp-TJ; Fri, 05 Oct 2012 07:53:35 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so751734bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 04:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=GlKRMPGRH2u28XtgKfLE3eVuS9xA2qghx0GDm9KxV1Y=;
	b=A68VTtZHrAHdLOtHkLzreRwdAyu5krTBZGXhxRITwG4L7QTdCpSv1aPCFu/ZqoX4FL
	sCuoDnCgBWVYV4uiMKAw3QdYuJLZgRjmjdpnqkZtJhGjMijfTavn6JXvXjuUmjeprwoH
	VeMrOvpG+ANEVJ3QTCRkjhGz/ngUYeIO6f/5F3RmTzkO19gbjBlBTISueSLhp+fl8mue
	oRh+mYyiFcVtitLH3xyzNN8ts3jdqxAWllzDxDLciHn7qHKCA7Z8rbBdm9Qrq/jXnIvd
	iBf3CgpJxtN26sR6ghr8NAawzWVbJY7babA2QHE80uJDQedODQTk+Z39wwHihFw4DG+j
	EQVg==
Received: by 10.204.6.75 with SMTP id 11mr28878bky.10.1349438013732;
	Fri, 05 Oct 2012 04:53:33 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id x13sm7548072bkv.16.2012.10.05.04.53.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 04:53:32 -0700 (PDT)
Date: Fri, 5 Oct 2012 13:53:30 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005115330.GA7068@stefanha-thinkpad.redhat.com>
References: <1348382492-8342-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1348382492-8342-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw: Disable code after return statement
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
X-List-Received-Date: Fri, 05 Oct 2012 11:53:47 -0000

On Sun, Sep 23, 2012 at 08:41:32AM +0200, Stefan Weil wrote:
> Report from smatch:
> microdrive.c:212 md_common_read(34) info: ignoring unreachable code.
> microdrive.c:273 md_common_write(33) info: ignoring unreachable code.
> sd.c:343 sd_req_crc_validate(9) info: ignoring unreachable code.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/ide/microdrive.c |    3 ++-
>  hw/sd.c             |    2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
> index 64810f7..07c6f97 100644
> --- a/hw/ide/microdrive.c
> +++ b/hw/ide/microdrive.c
> @@ -207,7 +207,7 @@ static uint16_t md_common_read(void *opaque, uint32_t at)
>      case 0x0:	/* Even RD Data */
>      case 0x8:
>          return ide_data_readw(&s->bus, 0);
> -
> +#if 0
>          /* TODO: 8-bit accesses */
>          if (s->cycle)
>              ret = s->io >> 8;
> @@ -217,6 +217,7 @@ static uint16_t md_common_read(void *opaque, uint32_t at)
>          }
>          s->cycle = !s->cycle;
>          return ret;
> +#endif
>      case 0x9:	/* Odd RD Data */
>          return s->io >> 8;
>      case 0xd:	/* Error */
> diff --git a/hw/sd.c b/hw/sd.c
> index ec26407..62a7751 100644
> --- a/hw/sd.c
> +++ b/hw/sd.c
> @@ -340,7 +340,9 @@ static int sd_req_crc_validate(SDRequest *req)
>      buffer[3] = (req->arg >> 8) & 0xff;
>      buffer[4] = (req->arg >> 0) & 0xff;
>      return 0;
> +#if 0
>      return sd_crc7(buffer, 5) != req->crc;	/* TODO */
> +#endif

hw/sd.c:336:13: error: variable ‘buffer’ set but not used [-Werror=unused-but-set-variable]

I suggest we drop this dead code completely instead of using #if 0.

Stefan

