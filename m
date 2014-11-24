Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XsqUr-0005QU-E2
	for mharc-qemu-trivial@gnu.org; Mon, 24 Nov 2014 05:03:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XsqUl-0005Pj-7x
	for qemu-trivial@nongnu.org; Mon, 24 Nov 2014 05:03:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XsqUg-0002E9-4W
	for qemu-trivial@nongnu.org; Mon, 24 Nov 2014 05:03:47 -0500
Received: from mail-la0-f54.google.com ([209.85.215.54]:33138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XsqUf-0002Dc-UV
	for qemu-trivial@nongnu.org; Mon, 24 Nov 2014 05:03:42 -0500
Received: by mail-la0-f54.google.com with SMTP id gf13so7377808lab.13
	for <qemu-trivial@nongnu.org>; Mon, 24 Nov 2014 02:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=niPL8f68TkTb4x3nBMYe49gxb+hOfnM/qIoduDy3Ro0=;
	b=TBdICGzkotrw8ugVdHqSP6g0Xt/GkyWgvAMaDvVQPeAAfBuJ2CQaEGeRIVlhb2l/2y
	aYptJAm3ADRFI3BU2d9XZGcR5lZFl07oX537qwWOezN5BZ1wAA3ccH8z6Nu5fQVmTjPF
	X+oVaXE3E442zjPEcjJg7XmubjCoEPxlIj+WGNUKODCfZsnUOknA5I8O/fq2RRxAHxxj
	pOGNdRzFiF0dyE5lYZiJX1nzHIJmWeFJLug225U0kOHSnMX+6fZjcIb8pQefVj/gaLDg
	k2EVWF4X0z57dtmSkpwht9fWp5Mw1PYQyO/VmWGJ8qSI7IG2OLG0P/ihp1i19vNwgYBJ
	xvTA==
X-Gm-Message-State: ALoCoQlp+/KwYQOnr90wE8ua83iFEu5WKkFC9A5oI9iQsBPkR1BJ5tu+KiVnbpah+mf75SK93IEW
X-Received: by 10.152.5.100 with SMTP id r4mr19657211lar.26.1416823421066;
	Mon, 24 Nov 2014 02:03:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.150.135 with HTTP; Mon, 24 Nov 2014 02:03:20 -0800 (PST)
In-Reply-To: <1416799833-9972-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1416799833-9972-1-git-send-email-zhang.zhanghailiang@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Nov 2014 10:03:20 +0000
Message-ID: <CAFEAcA_epH7Hcqd3uhzs-tjtTi8Y1gC3UUk5hZHsRaTAUje5dg@mail.gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.54
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/boot: fix
 uninitialized scalar variable warning reported by coverity
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
X-List-Received-Date: Mon, 24 Nov 2014 10:03:52 -0000

On 24 November 2014 at 03:30, zhanghailiang
<zhang.zhanghailiang@huawei.com> wrote:
> Coverity reports the 'size' may be used uninitialized, but that can't happen,
> because the caller has checked "if (binfo->dtb_filename || binfo->get_dtb)"
> before call 'load_dtb'.
>
> Here we simply remove the 'if (binfo->get_dtb)' to satisfy coverity.
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hw/arm/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 0014c34..4f515b5 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -352,7 +352,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>              goto fail;
>          }
>          g_free(filename);
> -    } else if (binfo->get_dtb) {
> +    } else {
>          fdt = binfo->get_dtb(binfo, &size);
>          if (!fdt) {
>              fprintf(stderr, "Board was unable to create a dtb blob\n");

If we do this I would prefer it if we add a clarifying note to the
doc comment for load_dtb:
 Must not be called unless have_dtb(binfo) is true.

thanks
-- PMM

