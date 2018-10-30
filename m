Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHUhD-0001Ey-LL
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 10:08:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUhA-0001DU-P7
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 10:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUh8-00029U-Re
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 10:08:35 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39639)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHUh5-0001e8-8g
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 10:08:32 -0400
Received: by mail-oi1-x241.google.com with SMTP id e3-v6so10498114oiy.6
	for <qemu-trivial@nongnu.org>; Tue, 30 Oct 2018 07:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AJfDdcphRxaXY7Ud71HnOaNJ4VlECEkGxXQR4BP8hVc=;
	b=XLzRVtiE1Yr7iJuvj6DgEs3nWj5+b9Um7cwY5MQjEwyBLNujXrWhcOvg/M0UTiLZuJ
	uWw24QsgDF7TzGlY7DCN3nso+JSyVr3deOAoGbY2vI8Oq2+NQaA1qXOqW0W5ctpLh2tC
	oqYgk6Vb3lszGv5FgxqNonlZ7x3wOXwQYet68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AJfDdcphRxaXY7Ud71HnOaNJ4VlECEkGxXQR4BP8hVc=;
	b=Wjr3OBEke3JdPB6Cq/vxoT3lqpU6uoRlOaSHBSJ+KPEV1MAVNYyhE+LRJy5jUEdN8K
	tz8cLPSwfodwiodtpZejvYwRrPeIGK1viPKDRFeKDgxP23SX9MOtvHzTjlHa3/Wr5chI
	vVuQW9jbvq6kHBDNw2Ztuw/73DZcuafIrVp6QlZ/1EjpOcqeaMHQpgR2Lm8Cg/7tmpl6
	0pNZ7GRTHpcf++PJM8S2TqtZ6TUFHnbueu2EM4u+V71/aiXJs7a8Vve0wXjA17fiHHjk
	tkAnT/c9iNW33sA8ZnJ1m2qFV3z6U0QY8O1mbJ4WWmNtJ6/wQfdRG8K3r303IaKgDfgF
	xFWA==
X-Gm-Message-State: AGRZ1gI6FvTu4VXvFv2509E9My73jWQygqIyBKsJp6dKP/FqMCwNYLSR
	zxW0E3ISqD0ull9I3hPGBsyyHk9wIg1x9vkarBr6AQ==
X-Google-Smtp-Source: AJdET5fhahCD3p5W9nbps8c9tu/fHb/LikdRv/KT9myvDjB2Q/DXkl0l9lfTX7rOzwvcojvlDnYhfpz63+MPexY9n4w=
X-Received: by 2002:aca:b504:: with SMTP id
	e4-v6mr11458516oif.25.1540908495422; 
	Tue, 30 Oct 2018 07:08:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 07:07:54
	-0700 (PDT)
In-Reply-To: <20181030114048.21527-2-philmd@redhat.com>
References: <20181030114048.21527-1-philmd@redhat.com>
	<20181030114048.21527-2-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 14:07:54 +0000
Message-ID: <CAFEAcA-yrZY3QD7ecOkQHU18qnU2y=G-QP+=ZZMhhnKTWwoVVw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] hw/arm/xilinx_zynq: Use the
 ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 30 Oct 2018 14:08:38 -0000

On 30 October 2018 at 11:40, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/arm/xilinx_zynq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index f1496d2927..57497b0c4d 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -294,7 +294,7 @@ static void zynq_init(MachineState *machine)
>      busdev =3D SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, 0xF8003000);
>      sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line=
 */
> -    for (n =3D 0; n < 8; ++n) { /* event irqs */
> +    for (n =3D 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
>          sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET])=
;
>      }
>
> --
> 2.17.2

Since this isn't related to the other patch, I'll just apply
it to target-arm.next to save you carrying it around.


thanks
-- PMM

