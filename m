Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjX2N-0004DT-4w
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 15:09:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjX2K-0004Bm-Le
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:09:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjX2J-00020U-Px
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:09:16 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:38110)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjX2J-00020J-KZ
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:09:15 -0500
Received: by mail-wm0-x22c.google.com with SMTP id t193so392767wmt.1
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 12:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SQJUq8BHAZeeKy/x0MywIukYZeAlQ1b91NuyAKp9hMo=;
	b=M3nKZ0+YHnh3jdXwW0iJw0NdjFPydcerGlwLsXc0l1OSOoJh8VNMmw9hF9aC/5E6bG
	vO00LrNQjt5CVQ/4eFvqIgrcQWE2JXFqxYkFrv456vxCQ14AXRMyBQvyb+d3vJRfQkDq
	75mo3Du1WhQGAVy3wH2/08+DjfCFeG2JIiEiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SQJUq8BHAZeeKy/x0MywIukYZeAlQ1b91NuyAKp9hMo=;
	b=bauNLg5NyjmkWXIpkO0G59M2aqQ8o5/6Y59STctMJ9e8AAJHrZUSbBRShg6EzPY2cF
	nmkwWOePC4ReyOL3W09Bfkk/QKSK5A9riZZHOXaB9iYyf+Cjkpf+fuUs6JT1S05gFDm5
	Uf8+R92f5sDzUINzUUnTgBKLsUHjHBx05LIrUS/nzIeLZRRgRYFtcaGNIeUkxwF0l4KQ
	q+5ca9iFHR+u4LNaJnh4G6Amml9FW7LojCJOErYzOkCMP4uF9N/XNPXl1xGpOAd6xOM5
	XVYBCJjYrMdK0P5jNN12+a91lPd7OjCVV8MJXdaBcvSnTRY3JKb36i4V9XrSACHLMJsV
	oLVg==
X-Gm-Message-State: AMke39ly3EMXMu6QQkWLWoQZ7rYexUOYehRY5HemIZyb9SejUeItqKV89mjHzu/w6AFVlNRuGpktLNiWzTvfOmSE
X-Received: by 10.28.172.68 with SMTP id v65mr33524wme.111.1488485354713; Thu,
	02 Mar 2017 12:09:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 12:08:54 -0800 (PST)
In-Reply-To: <e160b509a76bcf00d1af4665e26c6870eb363cab.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<e160b509a76bcf00d1af4665e26c6870eb363cab.1488068248.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 20:08:54 +0000
Message-ID: <CAFEAcA8dP-Z_srttBZSOOONkXGSka-vXrDdVbPGR64Q+Ko=ooA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 06/14] sm501: Add missing
 arbitration control register
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
X-List-Received-Date: Thu, 02 Mar 2017 20:09:17 -0000

On 3 December 2016 at 15:32, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/sm501.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index d9219bd..b977094 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -477,6 +477,7 @@ typedef struct SM501State {
>      uint32_t gpio_31_0_control;
>      uint32_t gpio_63_32_control;
>      uint32_t dram_control;
> +    uint32_t arbitration_control;
>      uint32_t irq_mask;
>      uint32_t misc_timing;
>      uint32_t power_mode_control;
> @@ -760,6 +761,9 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
>      case SM501_DRAM_CONTROL:
>          ret = (s->dram_control & 0x07F107C0) | s->local_mem_size_index << 13;
>          break;
> +    case SM501_ARBTRTN_CONTROL:
> +        ret = s->arbitration_control;
> +        break;
>      case SM501_IRQ_MASK:
>          ret = s->irq_mask;
>          break;
> @@ -812,6 +816,9 @@ static void sm501_system_config_write(void *opaque, hwaddr addr,
>          /* TODO : check validity of size change */
>          s->dram_control |=  value & 0x7FFFFFC3;
>          break;
> +    case SM501_ARBTRTN_CONTROL:
> +        s->arbitration_control =  value & 0x37777777;
> +        break;
>      case SM501_IRQ_MASK:
>          s->irq_mask = value;
>          break;
> --
> 2.7.4

Applied, thanks.

-- PMM

