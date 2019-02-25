Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gyFjy-0001Bi-Uc
	for mharc-qemu-trivial@gnu.org; Mon, 25 Feb 2019 07:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gyFjw-0001AC-SI
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 07:52:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gyFjv-00072V-Ru
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 07:52:12 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45006)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gyFjv-0006xy-Hf
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 07:52:11 -0500
Received: by mail-ot1-x343.google.com with SMTP id g1so7662128otj.11
	for <qemu-trivial@nongnu.org>; Mon, 25 Feb 2019 04:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=H3MckSYZiRqU2eoh3K/Vcq8TwyWuR0ToIOdV9GVb7No=;
	b=wsOpCiaeBCaFHogIYNwvSXEyBXdAAdhMYYXZK+rYpOz3WDlbV7vZMs9QLvhzK4GTQt
	zXoTnq2OrOwl8UKy3+bxMCF7gT9uXZFK8I6B13iTdhENdMNXW5/rEbkyFEG0QAWtUjGx
	GL5HU3FsdqQZ8We6metp/pGwswpGibhIEvXlTdzI68Oxj+oWLg2UJu0+VV1vlWRU3eiK
	q2Mfp6w+4GE6xlUAiW73xYTfprcBZDIh7302Cb/18iCu/752AYENoDsszOhUOPrMX9vl
	wm4y6+6nNZdR0P349rr5MitpUR1irWXWXNgwW+scjpekxlYu64La8CfekSS0ipAhbvae
	0+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=H3MckSYZiRqU2eoh3K/Vcq8TwyWuR0ToIOdV9GVb7No=;
	b=FKWr8px2mvPKYwyVHzmp6cHKifLxbMHr3cEqBPXXTrksq+jNb8pemynZpYPsFhlPtd
	Md8GjJ7FlCowA8ZFs3S7lKvFQ8gdpJA9iPPjQyFrAlGArgNDQrCsDY5Oxm0nKpEi9uaa
	klPryOj6O33BwsJswOWZo+GPs6uhdXTBijPsl6lLYjTr6Skibm7WxzE8BYUi/+z6ktOv
	EfJKPMwwM/fhjXdT3/DfrEZHulm0lJ+R8xozwGsECyo24uSYcmcp/hmk7KizYNlEqjxT
	nIWskuTq5WzcIVisp/2eABepxGQOXQLEEJCssVa/sWhvNPL38W+fjWccLxssOlu0iXMn
	ZcHQ==
X-Gm-Message-State: AHQUAuaHcvwUsEV4Rj6w7cOwwCZNRls5aJ1XIbuxcKjhfU6PJ7UTb6nl
	Ii3a6y91YdNQ0W+I4L9A1w5FrQjIjPy7zEX9yKTBHA==
X-Google-Smtp-Source: AHgI3IabIqNsnWBMXenNbK51/v7TGnqF2MF5lSvpfudKVXB/dMwFrsUiq2wBbBRLzjknIFza/+mK7E6BbyK/aRjLsic=
X-Received: by 2002:a05:6830:128f:: with SMTP id
	z15mr10684884otp.151.1551099128881; 
	Mon, 25 Feb 2019 04:52:08 -0800 (PST)
MIME-Version: 1.0
References: <1551095970-14645-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1551095970-14645-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Feb 2019 12:51:57 +0000
Message-ID: <CAFEAcA-YP_S36ZtmC-1LtuJN95Y5J1h5wmRgxLZFKwDrEmuvtA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>, 
	Qemu-block <qemu-block@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [PATCH] block/nvme: Remove QEMU_PACKED from
 naturally aligned NVMeRegs struct
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2019 12:52:13 -0000

On Mon, 25 Feb 2019 at 11:59, Thomas Huth <thuth@redhat.com> wrote:
>
> The QEMU_PACKED is causing a compiler warning/error with GCC 9:
>
>   CC      block/nvme.o
> block/nvme.c: In function =E2=80=98nvme_create_queue_pair=E2=80=99:
> block/nvme.c:209:22: error: taking address of packed member of
>  =E2=80=98struct <anonymous>=E2=80=99 may result in an unaligned pointer =
value
>  [-Werror=3Daddress-of-packed-member]
>   209 |     q->sq.doorbell =3D &s->regs->doorbells[idx * 2 * s->doorbell_=
scale];
>
> All members of the struct are naturally aligned, so there should
> not be the need for QEMU_PACKED here, and the following QEMU_BUILD_BUG_ON
> also ensures that there is no padding. Thus simply remove the QEMU_PACKED
> here.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1817525
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/nvme.c b/block/nvme.c
> index b5952c9..6c2ce7d 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -82,7 +82,7 @@ typedef volatile struct {
>      uint8_t  reserved1[0xec0];
>      uint8_t  cmd_set_specfic[0x100];
>      uint32_t doorbells[];
> -} QEMU_PACKED NVMeRegs;
> +} NVMeRegs;
>
>  QEMU_BUILD_BUG_ON(offsetof(NVMeRegs, doorbells) !=3D 0x1000);
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

