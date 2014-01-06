Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W0A0W-0002QQ-6K
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2014 08:14:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W0A0N-0002E9-T3
	for qemu-trivial@nongnu.org; Mon, 06 Jan 2014 08:14:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W0A0H-0008Tf-UY
	for qemu-trivial@nongnu.org; Mon, 06 Jan 2014 08:14:07 -0500
Received: from mail-la0-f49.google.com ([209.85.215.49]:48729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W0A0H-0008TW-NA
	for qemu-trivial@nongnu.org; Mon, 06 Jan 2014 08:14:01 -0500
Received: by mail-la0-f49.google.com with SMTP id er20so9604767lab.8
	for <qemu-trivial@nongnu.org>; Mon, 06 Jan 2014 05:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yiJU9lkmbjwuPRcxquD6Db3gk5ueTXNQl1Hs9PCQfc4=;
	b=ULfWrs7hkWMSbjg4xaqxVzVXb5IV3iGgHSYOPMxuruHJRaeiFaqWJx0M8NPgNqAnfi
	61dsJDb1UL8NQLGl/g6fFQ/Vo6igfyFoygFumfUoIcXmjHznAODgxuHUqhv6Sf7vBVxW
	5Bn5agYicxw/mQBep6+63rP6LJchax3JGyK8SFW+7lW+yholMS7ZSpEhIYuDOq28Lqfq
	NT84UZMno0vgNXX+TkliAwrVYItYw0aETLay8GKBm1dJg36oscCzxuoMxSklCRNbfx/T
	CL7C13mFbDfM3Wh50C/aQxJJfkvQCwFT0OrJAlZ6V0e5eZKnJTabfBIJNs4/qC0QM42J
	Z5Sw==
X-Gm-Message-State: ALoCoQndZpJL5c2r4Cm9o3bhstMLzouT1jPI0Y5wqj0ir4d/qIpYxzJKHkkUeBE0IOE9w++qwPJB
X-Received: by 10.152.219.133 with SMTP id po5mr985705lac.34.1389014040729;
	Mon, 06 Jan 2014 05:14:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.125.3 with HTTP; Mon, 6 Jan 2014 05:13:40 -0800 (PST)
In-Reply-To: <20131209233334.GC27737@otherpad.lan.raisama.net>
References: <1386322527-23148-1-git-send-email-kraxel@redhat.com>
	<1386322527-23148-9-git-send-email-kraxel@redhat.com>
	<20131209233334.GC27737@otherpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2014 13:13:40 +0000
Message-ID: <CAFEAcA_W7MXEPT7p8M0oqPkHsBe4ZZKcmS5B-r6L1Z-NABUHAw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add bios-256k.bin to BLOBS
	on Makefile
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
X-List-Received-Date: Mon, 06 Jan 2014 13:14:14 -0000

Ping -- who's going to take this patch? Maybe it should
go via -trivial?

thanks
-- PMM

On 9 December 2013 23:33, Eduardo Habkost <ehabkost@redhat.com> wrote:
> The default machine-type (pc-i440fx-2.0) now requires bios-256k.bin, but
> "make install" isn't installing it, so qemu-system-x86_64 won't run out
> of the box. Add it to BLOBS so it gets installed.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index bdff4e4..807054b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -290,7 +290,7 @@ common  de-ch  es     fo  fr-ca  hu     ja  mk  nl-be      pt  sl     tr \
>  bepo    cz
>
>  ifdef INSTALL_BLOBS
> -BLOBS=bios.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
> +BLOBS=bios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
>  vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin \
>  acpi-dsdt.aml q35-acpi-dsdt.aml \
>  ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin \
> --
> 1.8.3.1

