Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKl3O-0001vP-5c
	for mharc-qemu-trivial@gnu.org; Fri, 22 Aug 2014 05:22:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XKl3H-0001nD-8i
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 05:22:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XKl3A-0001uv-So
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 05:22:31 -0400
Received: from mail-la0-f42.google.com ([209.85.215.42]:41808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XKl3A-0001uH-E4
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 05:22:24 -0400
Received: by mail-la0-f42.google.com with SMTP id pv20so9819862lab.29
	for <qemu-trivial@nongnu.org>; Fri, 22 Aug 2014 02:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=i/U/KjHZ5hI6/08dY1h/EULEaodqaQC5FxxbBbJecZA=;
	b=OmS2BbZgRbWdjlCJWc4M9i0zIurinVK8Al9zRpctEOeFKzfeeMjRlheap5Km17CWZL
	aW8sh6EqVPfcS+DKOC7liB9VlRdDegTqdgq89Ov9N6oACpKUHXyQsy8s3howtarQ0mou
	jtfwh4wsCJxE4BBc6mnD+fSVgDDWhQpxVa9fRdPx7CKEMApz8OrrfqFwQiz8Bc+FF06l
	sl3kXv64/ibzHNyFlelm02N8aKvXwmylov5DrGXOD65ExgZbioL560Wi1EaUNjX0+yHn
	Y+AXKhgfBLq1UMwWQCq221sKjr4BsAZDDfGxOiD022uVkrwyOxWx2SQnHSW4mbGQv1Ek
	8Wpw==
X-Gm-Message-State: ALoCoQkEwEtFvBTEOgIl+Q+VlCb74+OHkkAFCqSVqHaKATnb7dfkbErhJQ+cNSarB+Zm6Dpa7qyq
X-Received: by 10.152.9.100 with SMTP id y4mr3729812laa.26.1408699341893; Fri,
	22 Aug 2014 02:22:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Fri, 22 Aug 2014 02:22:01 -0700 (PDT)
In-Reply-To: <53F704BE.6000407@mrs.ro>
References: <53F704BE.6000407@mrs.ro>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Aug 2014 10:22:01 +0100
Message-ID: <CAFEAcA87YqhdciCxnGkvFcv57tQ-dy35SxxQQGqCxiEzsSNfMg@mail.gmail.com>
To: Valentin Manea <qemu@mrs.ro>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.42
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Wenchao Xia <xiawenc@linux.vnet.ibm.com>,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] IDE: MMIO IDE device control should be
	little endian
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
X-List-Received-Date: Fri, 22 Aug 2014 09:22:36 -0000

You forgot to cc qemu-devel...

On 22 August 2014 09:52, Valentin Manea <qemu@mrs.ro> wrote:
> Set the IDE MMIO memory type to little endian. The ATA specs identify
> words part of the control commands encoded as little endian.
> While this has no impact on little endian systems, it's required for big
> endian systems(eg OpenRisc).
>
> Signed-off-by: Valentin Manea <valentin.manea@gmail.com>
> ---
>  hw/ide/mmio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
> index 01c1d0e..334c8cc 100644
> --- a/hw/ide/mmio.c
> +++ b/hw/ide/mmio.c
> @@ -82,7 +82,7 @@ static void mmio_ide_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps mmio_ide_ops = {
>      .read = mmio_ide_read,
>      .write = mmio_ide_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
>  static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,
> @@ -102,7 +102,7 @@ static void mmio_ide_cmd_write(void *opaque, hwaddr
> addr,
>  static const MemoryRegionOps mmio_ide_cs_ops = {
>      .read = mmio_ide_status_read,
>      .write = mmio_ide_cmd_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
>  static const VMStateDescription vmstate_ide_mmio = {
> --
> 1.9.1

thanks
-- PMM

