Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUVL-00055v-VB
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:09:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TNUVJ-00055W-Vs
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:09:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TNUVI-00062I-Vw
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:09:41 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:62763)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TNUVI-00062A-R5
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:09:40 -0400
Received: by mail-ie0-f173.google.com with SMTP id 17so6863700iea.4
	for <qemu-trivial@nongnu.org>; Sun, 14 Oct 2012 13:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=DDcA/eSZHrvBGiEKrA/pcI2LuHe90M4gs7k4ZOP3PYQ=;
	b=ll9WMSd90K5qzzYkeQgPOnwksWNDoQcJ62vOeTl9UTVcW2vgI+Ka6tfSPUQEpM4jKM
	cZhp4yFHf989cLul/ExgoB84EYBP1D7Mb9yKlsIg7zaoWxDGzjoauftO478vJmlIxKxH
	f173n3oDukvghFMHTJ2Jh/4y2xGcn6uBVWrgka1iR4ty9V0JaxYKdwU53clzbxhQlRoj
	bAkhTiEBm4bYI96HrEHidXly1++BItRDUjUb+moPTijF/0kM8sUXMF3Uzb3hmMg2LGDA
	nk9Kqd1tNmgrSc/9C7b8VOzdKDBl5jL5byFt34LVn5SI4HmHk1LTnulVOYvYUp0Ph/ar
	FRMg==
MIME-Version: 1.0
Received: by 10.50.152.137 with SMTP id uy9mr6933546igb.62.1350245380132; Sun,
	14 Oct 2012 13:09:40 -0700 (PDT)
Received: by 10.50.87.105 with HTTP; Sun, 14 Oct 2012 13:09:40 -0700 (PDT)
In-Reply-To: <9b4ee7a47d8bc116e20f236a1ad9ed73a695123e.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<9b4ee7a47d8bc116e20f236a1ad9ed73a695123e.1350244587.git.blauwirbel@gmail.com>
Date: Sun, 14 Oct 2012 21:09:40 +0100
Message-ID: <CAFEAcA_M58F9F-NTY81Fau9_iH_s76f0KHQ_L5TOoC8+naWB6Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkS5iO10fojSylFLYu/gtcMNUuIa+LLfN8lx3qcOVz+rvui8jR/F63ZWi2OmSnerr0vsVlK
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 10/11] arm: add missing static and remove
	unused functions
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
X-List-Received-Date: Sun, 14 Oct 2012 20:09:43 -0000

On 14 October 2012 20:58, Blue Swirl <blauwirbel@gmail.com> wrote:
> index 2fc4137..2c02a83 100644
> --- a/hw/omap_gpmc.c
> +++ b/hw/omap_gpmc.c
> @@ -871,24 +871,3 @@ void omap_gpmc_attach(struct omap_gpmc_s *s, int cs, MemoryRegion *iomem)
>      f->iomem = iomem;
>      omap_gpmc_cs_map(s, cs);
>  }
> -
> -void omap_gpmc_attach_nand(struct omap_gpmc_s *s, int cs, DeviceState *nand)
> -{
> -    struct omap_gpmc_cs_file_s *f;
> -    assert(nand);
> -
> -    if (cs < 0 || cs >= 8) {
> -        fprintf(stderr, "%s: bad chip-select %i\n", __func__, cs);
> -        exit(-1);
> -    }
> -    f = &s->cs_file[cs];
> -
> -    omap_gpmc_cs_unmap(s, cs);
> -    f->config[0] &= ~(0xf << 10);
> -    f->config[0] |= (OMAP_GPMC_NAND << 10);
> -    f->dev = nand;
> -    if (nand_getbuswidth(f->dev) == 16) {
> -        f->config[0] |= OMAP_GPMC_16BIT << 12;
> -    }
> -    omap_gpmc_cs_map(s, cs);
> -}

Please don't delete this function, it is the public facing interface
for allowing board models to attach NAND devices to the GPMC. This
might not be used by anything currently in mainline, but it is used
by the omap3 beagle and overo board models in qemu-linaro (and which
I will upstream eventually, honest).

More generally I'm wary of deletion of apparently unused functions like
this one (or some of the others like the 'pcmcia eject card' function)
which are obviously intended to be public facing APIs to other
device models, unless they come with rationales along the lines of
"this function was added for purpose X but it is not needed now because
commit Y changed things so you do this with Z now".

> diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
> index eebd93f..3434036 100644
> --- a/linux-user/arm/nwfpe/fpa11.c
> +++ b/linux-user/arm/nwfpe/fpa11.c

In general anything in linux-user/arm/nwfpe is legacy code which
it's scarcely worth the effort of touching or reviewing.

thanks
-- PMM

