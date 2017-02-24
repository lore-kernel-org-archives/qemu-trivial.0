Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chGrd-0004sb-Rf
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2017 09:28:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chGrb-0004qq-JU
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:28:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chGra-0004mf-Jy
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:28:51 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:35130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chGra-0004m8-CR
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:28:50 -0500
Received: by mail-wm0-x231.google.com with SMTP id v186so15885990wmd.0
	for <qemu-trivial@nongnu.org>; Fri, 24 Feb 2017 06:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FaweeIcQeHONKJh2SY5YuSBGm92QtEtwuXcUSLqXnRQ=;
	b=ASbWxYLwdGRoeNKirxFdQKhul/rIPpuE0hdvBO8HCTe+Q1I4KAXRMHDOFlqAY8WrBA
	iMVkllqw+4l0xB8vZ1ZBGs1eqWn1OjSunReg8vjnacY6hyriPDhIl86/XHcgkswyGQki
	hRjcO+cSB/vYsvnoqvysDY3QoabC8mbeUIwtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FaweeIcQeHONKJh2SY5YuSBGm92QtEtwuXcUSLqXnRQ=;
	b=bwkgogXOexGqyM4ysuKZFxbMrXonMkkQeQFuaWXBIYEjlSP1bzRNyRYwZxgCbe6LON
	SXYdO1BeDnOnMydGNjVTzwzwAn52GQ9Ro+SAwtmFuCsHRphVbNebPqo2tUci+Si9zQKO
	yTHhNrGlORuSu4mvWsMW3NwWVe08CRvnCRlOVDxPSAp6612tRzHUusugeoNkPn0J1mOJ
	eOOJicI+SNUv4URVfkv6mNKsEHeOllcJM+9EfAKLjFZXf2PrisKuxSr1rPDI0ISX2LM8
	dFo6yYt0pN41M87XKE46I2wpd6Bv3kbXX0FDNb/PriKYdbM72UO7tHkmEVY7R+de/VMe
	Wx1Q==
X-Gm-Message-State: AMke39l1y0jpljqBrkL5BSEwOZKZNLJX4I5Cqavwol/NTxvdjltzWFMavDSkDkVvbK/QZO0ff7iDTpjiDRIj1hUo
X-Received: by 10.28.55.199 with SMTP id e190mr2775475wma.92.1487946529220;
	Fri, 24 Feb 2017 06:28:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 06:28:28 -0800 (PST)
In-Reply-To: <84d7cdceac575c23bd4ee4bdcb80a03966b96db8.1487522123.git.balaton@eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<84d7cdceac575c23bd4ee4bdcb80a03966b96db8.1487522123.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:28:28 +0000
Message-ID: <CAFEAcA9oWpaG98KT+zSBE11-vzs-Cs6bgBT_VGQVvm4RVUO7pA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 02/10] sm501: Use defines
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
X-List-Received-Date: Fri, 24 Feb 2017 14:28:52 -0000

On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
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

s->misc_control was set to 0x1000, but is now set to
SM501_MISC_IRQ_INVERT, which is (1 << 16), which is not the
same value... 0x1000 would be SM501_MISC_DAC_POWER.

thanks
-- PMM

