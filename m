Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjVr0-0006sB-6E
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 13:53:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjVqx-0006rW-4V
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 13:53:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjVqw-0000Yf-3j
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 13:53:27 -0500
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:34705)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjVqv-0000XX-Td
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 13:53:26 -0500
Received: by mail-wr0-x22e.google.com with SMTP id l37so59221337wrc.1
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 10:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MKdKAmnncxHu2Asj80kkDvhTxHSgrSIuDz5x+RTKlo8=;
	b=RfNYZraGVRVrBYOeUXmM42XdS5X1ENPN12Mc36zq9j3lWIWYBHAcOhv8DqFtb2m6L1
	Vq68D3EvbU8AxOdMMftObe9U4mOXvlk7jWcU16o76fucCiDcavjp54D5QI7OmmJ2IJmS
	nlIddUu9AKF1ez6hbsQ1RVBrf42a5xQ5B038M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MKdKAmnncxHu2Asj80kkDvhTxHSgrSIuDz5x+RTKlo8=;
	b=sFVw9Gs1hqAQYe7z4ftfq9y2xm1gaswwd/4hQjIHcSOImbn28Y/kjDRBu50OvSpLIx
	YolSUYkYj2kZHvPO9HbvVURlrRBk5HSTeM8ycHjws5njqGetsmmgF5kTFr/5pxwykQPY
	zOQYRmOwg/C/0IntMTffx5DslG7HEbM/YhKTR9j5qivaAUU9lJ1K8/sgKXM+z86pmg2h
	rFjtaGDw9PYTkQHCps0/kXI2BYlYYpDy1Hu8Biu0cJgeZBwMQs9NqrVc4X/VU+oX4itw
	G+KwOWEx0ToZ++Ztoxj/RHJf56itaZMI3ijPmS/SXrt7X6C0Mowwe2dqPFupf5deD09n
	1m1Q==
X-Gm-Message-State: AMke39kdqyN2SA/NNqnfD9ApgnARNGgZ4bHy+vSA3iccgVWo3i+EQkbCQINki+XOSsU6WK/Co1YEZctLkksq/j3B
X-Received: by 10.223.150.205 with SMTP id u71mr13707004wrb.195.1488480804591; 
	Thu, 02 Mar 2017 10:53:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 10:53:04 -0800 (PST)
In-Reply-To: <65f979bc1683c46f74ddb5e931810f4e2b8ea27c.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<65f979bc1683c46f74ddb5e931810f4e2b8ea27c.1488068248.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 18:53:04 +0000
Message-ID: <CAFEAcA8hgztzBZ=4EK7GR_1V4WnKL_hp-CopC1q5NwxeARkgSA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 02/14] sm501: Use defines
 instead of constants where available
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
X-List-Received-Date: Thu, 02 Mar 2017 18:53:28 -0000

On 7 November 2016 at 09:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> This also fixes the initial value of misc_control register to match the
> comment which is likely what was intended but the DAC_POWER bit was set
> instead. This value is unused so it does not really matter but is
> fixed here for consistency.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/sm501.c          | 8 ++++----
>  hw/display/sm501_template.h | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 4f40dee..4eb085c 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -555,7 +555,7 @@ static uint32_t get_local_mem_size_index(uint32_t size)
>  static inline int is_hwc_enabled(SM501State *state, int crt)
>  {
>      uint32_t addr = crt ? state->dc_crt_hwc_addr : state->dc_panel_hwc_addr;
> -    return addr & 0x80000000;
> +    return addr & SM501_HWC_EN;
>  }
>
>  /**
> @@ -1411,9 +1411,9 @@ void sm501_init(MemoryRegion *address_space_mem, uint32_t base,
>      s->local_mem_size_index = get_local_mem_size_index(local_mem_bytes);
>      SM501_DPRINTF("local mem size=%x. index=%d\n", get_local_mem_size(s),
>                    s->local_mem_size_index);
> -    s->system_control = 0x00100000;
> -    s->misc_control = 0x00001000; /* assumes SH, active=low */
> -    s->dc_panel_control = 0x00010000;
> +    s->system_control = 0x00100000; /* 2D engine FIFO empty */
> +    s->misc_control = SM501_MISC_IRQ_INVERT; /* assumes SH, active=low */
> +    s->dc_panel_control = 0x00010000; /* FIFO level 3 */
>      s->dc_crt_control = 0x00010000;

I just found a datasheet which says that the power-on-default
for the misc-control register is 0b0000.0000.0000.00x0.0001.0000.xxx0.0xxx
which means that the 0x1000 decimal value is correct and setting
the IRQ_INVERT bit is wrong.

I think the "active=low" bit is referencing the fact that the
DAC_POWER bit is 1 for "disable" and 0 for "enable".

It makes sense hardware-wise for the DAC to be powered off by default
at reset as well I think.

thanks
-- PMM

