Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUse-0005y1-LU
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:33:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUsc-0005r4-7b
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:33:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUsb-0006J0-9Z
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:33:46 -0400
Received: from mail-ia0-f173.google.com ([209.85.210.173]:54047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUsY-0006Gi-Ro; Sun, 14 Oct 2012 16:33:42 -0400
Received: by mail-ia0-f173.google.com with SMTP id m10so3246591iam.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AO689igjs6JRvASun+0ck1h+xegI3nfj7j0GFjv7YvY=;
	b=EotAWxboMSKYEYjm2Zcg0Hpbk+OUifJoV03fKo1wzKSGB63ECt2yU0zLoVowZjJcIn
	luXYmFgVKMv/31kdX0gBmwCIYHBCS5UH+0t6YmNaegILnUUj5VXUsEfS0IsC0NGOF5hS
	oJyw0jLVR/WUwWAfh3jul6xaxRvGeMoe7d+STzAXkyK1HRi11VlQq5wbo9W/GQQ+8dnx
	6mVRuaICx0PSMQJfULasQzzjVuCYGnvrPDCVD9MGUtyKh+vkLemzpmJX+Y2KfTKvQulJ
	45qVU2JnGYOwlQIHQDzidHbmoX/aGwGPUCs8q96UWFnhtKLXvYKAaBDmnAPjcQtxuzAR
	ZXUA==
Received: by 10.50.33.169 with SMTP id s9mr7196933igi.19.1350246822250; Sun,
	14 Oct 2012 13:33:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.53.130 with HTTP; Sun, 14 Oct 2012 13:33:22 -0700 (PDT)
In-Reply-To: <CAFEAcA_M58F9F-NTY81Fau9_iH_s76f0KHQ_L5TOoC8+naWB6Q@mail.gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<9b4ee7a47d8bc116e20f236a1ad9ed73a695123e.1350244587.git.blauwirbel@gmail.com>
	<CAFEAcA_M58F9F-NTY81Fau9_iH_s76f0KHQ_L5TOoC8+naWB6Q@mail.gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 14 Oct 2012 20:33:22 +0000
Message-ID: <CAAu8pHu5cuBML84JehNbXXsbuJ=3KwauuAvOYP=+VH-Y_GQ+-g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
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
X-List-Received-Date: Sun, 14 Oct 2012 20:33:47 -0000

On Sun, Oct 14, 2012 at 8:09 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 14 October 2012 20:58, Blue Swirl <blauwirbel@gmail.com> wrote:
>> index 2fc4137..2c02a83 100644
>> --- a/hw/omap_gpmc.c
>> +++ b/hw/omap_gpmc.c
>> @@ -871,24 +871,3 @@ void omap_gpmc_attach(struct omap_gpmc_s *s, int cs, MemoryRegion *iomem)
>>      f->iomem = iomem;
>>      omap_gpmc_cs_map(s, cs);
>>  }
>> -
>> -void omap_gpmc_attach_nand(struct omap_gpmc_s *s, int cs, DeviceState *nand)
>> -{
>> -    struct omap_gpmc_cs_file_s *f;
>> -    assert(nand);
>> -
>> -    if (cs < 0 || cs >= 8) {
>> -        fprintf(stderr, "%s: bad chip-select %i\n", __func__, cs);
>> -        exit(-1);
>> -    }
>> -    f = &s->cs_file[cs];
>> -
>> -    omap_gpmc_cs_unmap(s, cs);
>> -    f->config[0] &= ~(0xf << 10);
>> -    f->config[0] |= (OMAP_GPMC_NAND << 10);
>> -    f->dev = nand;
>> -    if (nand_getbuswidth(f->dev) == 16) {
>> -        f->config[0] |= OMAP_GPMC_16BIT << 12;
>> -    }
>> -    omap_gpmc_cs_map(s, cs);
>> -}
>
> Please don't delete this function, it is the public facing interface
> for allowing board models to attach NAND devices to the GPMC. This
> might not be used by anything currently in mainline, but it is used
> by the omap3 beagle and overo board models in qemu-linaro (and which
> I will upstream eventually, honest).

It could be re-added with the boards, or just disabled now with #if 0/#endif.

> More generally I'm wary of deletion of apparently unused functions like
> this one (or some of the others like the 'pcmcia eject card' function)
> which are obviously intended to be public facing APIs to other
> device models, unless they come with rationales along the lines of
> "this function was added for purpose X but it is not needed now because
> commit Y changed things so you do this with Z now".

In case of pcmcia, it's from 2009 so one would expect users to have
appeared already.

>
>> diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
>> index eebd93f..3434036 100644
>> --- a/linux-user/arm/nwfpe/fpa11.c
>> +++ b/linux-user/arm/nwfpe/fpa11.c
>
> In general anything in linux-user/arm/nwfpe is legacy code which
> it's scarcely worth the effort of touching or reviewing.

Adding 'static' should be only beneficial.

>
> thanks
> -- PMM

