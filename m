Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnCBD-0004af-UH
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 19:13:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnCBA-0004Yk-1I
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 19:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnCB9-0007sN-1c
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 19:13:48 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dnCB8-0007s5-S0; Wed, 30 Aug 2017 19:13:46 -0400
Received: by mail-wm0-x241.google.com with SMTP id e204so3254898wma.2;
	Wed, 30 Aug 2017 16:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=Dmvshpqmd96tZPnt0bnHLAXVYQTxZ1JxhIZCPpV6fbU=;
	b=bU9ZpVTRmG2DHQBr0ENTSMBqPwHHTcnL35rBQ7GocLOIr1q5GGQjd6Z+1tGQpxchGs
	/7stjoUYqJnDY6ilWQqw5mQL4UhvvQITxjwEjOQN/FiA99PKOuWpbHoiB+/TDUGtLgPg
	IBjlxlA7SnuogZYAKTO42iOy9Q6ARQfizY1IYVysl0lblaHiSWrb+m1lzm2o1wTcUumo
	DelYL7BPaOVX6c/Wipsxp7FLc1E+E/d+jNFF25dQnSArDf0x5kUZVgh4Z4Aaac+wcrdj
	Paa0f48GPI+w7kxjv5iW75ESRphsjuFyN5yqe++0KXAwY7LFBe8B33BbTvjWQoZpuUL4
	ociA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Dmvshpqmd96tZPnt0bnHLAXVYQTxZ1JxhIZCPpV6fbU=;
	b=NMqHYNPPd+0Zy8lGOeN6XHgd/k7Bxn3ehBfqMZiwr1FugIxVfNdzEtuKER9rc0hVvw
	zxZyBaFTCAGpfjPzLG8VEx01ljfpC50rlhd7mdRJUqIu9PSC0waKim2SYbSjzRONfhCr
	CyUWkD5BQJfmE98c8d+ulxifoD2EeMwudgE8+1AAikfmVIoK80jVsMsTK9HSHgde0J2X
	AVxRd9Dj+Vo/SucSGC8q0I35s3SNIXay4aNSX2GnMNDE1xXBzBQzHhLkgBP39FrW+wQc
	ZYb7QJQdtdrpqqYYLxChz6oIh6lrZZXxoyMKILDOhnFds2ijU2c+LsFcwzE5y1sCLjV3
	FZcw==
X-Gm-Message-State: AHYfb5h6YXev7qwYP0H1/VnVwZ98kGX6gBFr3guSpXockAls/50LSaZ7
	sRg1kp5SxTijFHrRxx1ffhIKhz0YdQ==
X-Received: by 10.28.165.10 with SMTP id o10mr1968083wme.156.1504134824375;
	Wed, 30 Aug 2017 16:13:44 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.191.130 with HTTP; Wed, 30 Aug 2017 16:13:13 -0700 (PDT)
In-Reply-To: <20170830215523.25278-15-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
	<20170830215523.25278-15-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 30 Aug 2017 16:13:13 -0700
X-Google-Sender-Auth: BrKSSQQ4EoWXsXw7ghtwUMw2cvc
Message-ID: <CAKmqyKPVcUF1q2fzdECnun04m2XryXquk67tPvLEpcXmP9c84Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 14/17] MAINTAINERS: add
 missing entry for Generic Loader
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
X-List-Received-Date: Wed, 30 Aug 2017 23:13:50 -0000

On Wed, Aug 30, 2017 at 2:55 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a48f633cad..0b77590dc8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1164,6 +1164,7 @@ M: Alistair Francis <alistair.francis@xilinx.com>
>  S: Maintained
>  F: hw/core/generic-loader.c
>  F: include/hw/core/generic-loader.h
> +F: docs/generic-loader.txt
>
>  CHRP NVRAM
>  M: Thomas Huth <thuth@redhat.com>
> --
> 2.14.1
>
>

