Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X8L8t-0004jo-A6
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 23:16:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrey@xdel.ru>) id 1X892D-0007hA-Lx
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:21:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrey@xdel.ru>) id 1X892B-0000h2-TK
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:21:17 -0400
Received: from mail-oa0-x22d.google.com ([2607:f8b0:4003:c02::22d]:35372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrey@xdel.ru>) id 1X892B-0000ft-KQ
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:21:15 -0400
Received: by mail-oa0-f45.google.com with SMTP id i7so3323072oag.32
	for <qemu-trivial@nongnu.org>; Fri, 18 Jul 2014 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xdel.ru; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MulcWFK6K7Dc4M1Z6Py0T89vXbR2tA61lm8Jz2J15f4=;
	b=VDpDDkPqA4JwuIp2FAgv7nF/T0HdAxN5XC/ocoC/5bc/BRYxM/Su5kpr5PcVsOEoSH
	aK/sZI0osscGAqq8DfdMtzJLuQ9qLODwj57QJio1e98zlsduPfTO8buROFSHFDFLkt6L
	1jJ0bw4HvBOtg6Yfhs3qKQ767mie8VcsGvDIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MulcWFK6K7Dc4M1Z6Py0T89vXbR2tA61lm8Jz2J15f4=;
	b=YGIe7RpdGZyYANc3ugOMX6eNCHmKalYVx0Iob8U34dyAcLQHltNrkZugH6gLcD05q8
	NDhvDalVWh8qFqDco81rTGAU5fX6tPW9y5bZ7SYh2F2RGrSD8W41aRohAzLYFoar4OYR
	Ev78Bnku5t1Nc3JU3z2RDRbcMKm0w9RO+cYZX7+OGIhis1Plm+XiLIy3uT0zR1xb3WpM
	lDZnXkYnqhWFyMYLUdcvHnOehwbqczuojDKvmhTMLKkCGYg1GZ89EHAusfvg/wEb6jm6
	OyiMKBe/ZE+sGxbfg+CHQjdRpwpjH+T+CdUGOBXF7/Abe9K/SE8ZxWywpXvecNfQJtw8
	Qxyw==
X-Gm-Message-State: ALoCoQmfVnqZcEwFuek0PDWDGEcLAxAilVkXck1oLlnhDaQsPmj2+5yj32Nx1FhlCArk7vlvYCYa
X-Received: by 10.60.136.229 with SMTP id qd5mr7571395oeb.10.1405693273876;
	Fri, 18 Jul 2014 07:21:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.49.101 with HTTP; Fri, 18 Jul 2014 07:20:53 -0700 (PDT)
In-Reply-To: <1405692553-564-3-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1405692553-564-3-git-send-email-mjt@msgid.tls.msk.ru>
From: Andrey Korolyov <andrey@xdel.ru>
Date: Fri, 18 Jul 2014 18:20:53 +0400
Message-ID: <CABYiri-0tw_QZbwxBh4YuDud5+NzV=xu6dCLN0k=oGuO3GJjpg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::22d
X-Mailman-Approved-At: Fri, 18 Jul 2014 23:16:57 -0400
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 2/8] Fix new typos in
	comments (found by codespell)
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
X-List-Received-Date: Fri, 18 Jul 2014 14:21:18 -0000

On Fri, Jul 18, 2014 at 6:09 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> From: Stefan Weil <sw@weilnetz.de>
>
> arbitary -> arbitrary
> basicly -> basically
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/i386/pc_piix.c                     |    2 +-
>  hw/i386/pc_q35.c                      |    2 +-
>  include/libdecnumber/decNumberLocal.h |    2 +-
>  xen-hvm.c                             |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index ec8ccdb..7081c08 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -114,7 +114,7 @@ static void pc_init1(MachineState *machine,
>          lowmem = 0xe0000000;
>      }
>
> -    /* Handle the machine opt max-ram-below-4g.  It is basicly doing
> +    /* Handle the machine opt max-ram-below-4g.  It is basically doing
>       * min(qemu limit, user limit).
>       */
>      if (lowmem > pc_machine->max_ram_below_4g) {
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 36b6ab0..f551961 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -103,7 +103,7 @@ static void pc_q35_init(MachineState *machine)
>          lowmem = 0xb0000000;
>      }
>
> -    /* Handle the machine opt max-ram-below-4g.  It is basicly doing
> +    /* Handle the machine opt max-ram-below-4g.  It is basically doing
>       * min(qemu limit, user limit).
>       */
>      if (lowmem > pc_machine->max_ram_below_4g) {
> diff --git a/include/libdecnumber/decNumberLocal.h b/include/libdecnumber/decNumberLocal.h
> index cd4eb79..71ed77b 100644
> --- a/include/libdecnumber/decNumberLocal.h
> +++ b/include/libdecnumber/decNumberLocal.h
> @@ -153,7 +153,7 @@
>
>
>    /* ---------------------------------------------------------------- */
> -  /* Definitions for arbitary-precision modules (only valid after     */
> +  /* Definitions for arbitrary-precision modules (only valid after    */
>    /* decNumber.h has been included)                                  */
>    /* ---------------------------------------------------------------- */
>
> diff --git a/xen-hvm.c b/xen-hvm.c
> index c928b36..a2486cf 100644
> --- a/xen-hvm.c
> +++ b/xen-hvm.c
> @@ -165,7 +165,7 @@ static void xen_ram_init(ram_addr_t *below_4g_mem_size,
>                                                     PC_MACHINE_MAX_RAM_BELOW_4G,
>                                                     &error_abort);
>
> -    /* Handle the machine opt max-ram-below-4g.  It is basicly doing
> +    /* Handle the machine opt max-ram-below-4g.  It is basically doing
>       * min(xen limit, user limit).
>       */
>      if (HVM_BELOW_4G_RAM_END <= user_lowmem) {
> --
> 1.7.10.4
>
>

Please consider including typo bits from
http://patchwork.ozlabs.org/patch/251038/ as well.

