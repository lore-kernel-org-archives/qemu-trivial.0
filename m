Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk8hS-0001Ze-HS
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 05:08:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wk8hL-0001O7-Qc
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 05:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wk8hF-0007Sf-St
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 05:08:31 -0400
Received: from mail-ee0-x22c.google.com ([2a00:1450:4013:c00::22c]:46556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Wk8h3-0007PH-QD; Tue, 13 May 2014 05:08:13 -0400
Received: by mail-ee0-f44.google.com with SMTP id c41so168208eek.17
	for <multiple recipients>; Tue, 13 May 2014 02:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=mQd/+BcnUroeRH70mKpxowliS0jS496HgnAy1ZB0oQA=;
	b=plq0H+ibJSmIl5eLSDFQkYrA5x/KomakJ5ZLe0AtmYk8OWO5zdrVo0h+CDeiDztQEW
	cIvef6cpHvLrmz06e2V3JJjjD91Qvq2D/Nh/aFzP31CIyQRTZJfz5LptCjpFwBa1Rl1H
	KAK3y3JYeD2c1mK9hJtcJ0DMSHdMoXWH7Jhh+nrooSE7MCDE2GoPXSG+X7PNuNCdglJr
	v1U/xJiR55ySvwN75V/X/uUWUtpsa4bnwWegZO74niIVeNCVMYmwugZOPKFbQwGoR34S
	jHSzU0X2Ro+mtJji2K6cTGG8b7WivpaogsQLQUHgIodug4U80hdhkZiJetnsizLbp4av
	RQ3A==
X-Received: by 10.15.67.142 with SMTP id u14mr39569451eex.19.1399972092937;
	Tue, 13 May 2014 02:08:12 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-117-141-58.cust.vodafonedsl.it.
	[37.117.141.58]) by mx.google.com with ESMTPSA id
	x42sm38782236eel.41.2014.05.13.02.08.11 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 May 2014 02:08:12 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5371E0F9.3030105@redhat.com>
Date: Tue, 13 May 2014 11:08:09 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1399937716-6086-1-git-send-email-kroosec@gmail.com>
	<1399937716-6086-2-git-send-email-kroosec@gmail.com>
In-Reply-To: <1399937716-6086-2-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22c
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] nbd: Miscellaneous typo fixes.
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
X-List-Received-Date: Tue, 13 May 2014 09:08:37 -0000

Il 13/05/2014 01:35, Hani Benhabiles ha scritto:
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  nbd.c         | 2 +-
>  qemu-nbd.c    | 2 +-
>  qemu-nbd.texi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/nbd.c b/nbd.c
> index e5084b6..e0d032c 100644
> --- a/nbd.c
> +++ b/nbd.c
> @@ -306,7 +306,7 @@ static int nbd_send_negotiate(NBDClient *client)
>          [ 8 ..  15]   magic        (NBD_CLIENT_MAGIC)
>          [16 ..  23]   size
>          [24 ..  25]   server flags (0)
> -        [24 ..  27]   export flags
> +        [26 ..  27]   export flags
>          [28 .. 151]   reserved     (0)
>
>         Negotiation header with options, part 1:
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index f70e4b0..cd6bd50 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -294,7 +294,7 @@ static void *nbd_client_thread(void *arg)
>      fd = open(device, O_RDWR);
>      if (fd < 0) {
>          /* Linux-only, we can use %m in printf.  */
> -        fprintf(stderr, "Failed to open %s: %m", device);
> +        fprintf(stderr, "Failed to open %s: %m\n", device);
>          goto out_socket;
>      }
>
> diff --git a/qemu-nbd.texi b/qemu-nbd.texi
> index 0a7e013..46fd483 100644
> --- a/qemu-nbd.texi
> +++ b/qemu-nbd.texi
> @@ -15,7 +15,7 @@ Export QEMU disk image using NBD protocol.
>  @item @var{filename}
>   is a disk image filename
>  @item -p, --port=@var{port}
> -  port to listen on (default @samp{1024})
> +  port to listen on (default @samp{10809})
>  @item -o, --offset=@var{offset}
>    offset into the image
>  @item -b, --bind=@var{iface}
>


Acked-by: Paolo Bonzini <pbonzini@redhat.com>


