Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZkdq-0000ra-2G
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 17:11:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkdn-0000q3-M9
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:11:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkdm-0007Za-RB
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:11:47 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:37383)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkdm-0007Z3-Kh
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:11:46 -0400
Received: by mail-wm0-x230.google.com with SMTP id c184so41551739wmd.0
	for <qemu-trivial@nongnu.org>; Mon, 24 Jul 2017 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JCohSCmXKYULBl9OpY4OBL/64maAxrvSX/PK2okSG8o=;
	b=SWXiGgwNjnr057ga1Y54vdtWP8Ud5vzRmReC/ad4MXVafbTmSzgjJE7RXhJgUtXkj6
	mwF6C8e/59mpeHX1zlRmQkcfF0eUqThnU5hE/VocE6jdsdqJxoXoGMMLf/UnaJfrU9LY
	nI3HscjJq/QyZ2j1N6cyS7iE7WeGuu+o+/qqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JCohSCmXKYULBl9OpY4OBL/64maAxrvSX/PK2okSG8o=;
	b=X8ERjINBMRRXm+A/7Ex7gsA92sjsvMiZ6dfplTnMXO94qf2uixLX3Q5DUnHQ6/+69U
	kdOJDeRu7iZHAT4X79alcQVEsFwUEnTeg5f6W/LzYMDr10IC/hxAdnMBIp4qlelEz4b0
	fpanmDOtWvmp9HEe8YxAGK/FiCBMoy9j5Wx5IBMOnKwYSLU86rRru9UCb75iYKyy6Zfa
	cHzGI4H0G+Bj8SU4tTQoM1rIDRoZEaaTBf9v1tuBI6MISZjsfDRc9QIC+LwQSQCj0ltY
	sNnpyab1kGzh2UKFMpJGg6ZVJByIloqZnNmELNXWfGXjx9SPJF09kJU5DeKwePeYV09t
	Uq6Q==
X-Gm-Message-State: AIVw112vANlY9XjeJcf+IbVJfPC7vHp3aTsNumzejGStTIqrdMqSH5+0
	pWobi7GPBoRIJ8cejcpl5KrzzR0QrmcMjA8=
X-Received: by 10.28.198.206 with SMTP id w197mr6051361wmf.86.1500930705646;
	Mon, 24 Jul 2017 14:11:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:11:25 -0700 (PDT)
In-Reply-To: <20170724182751.18261-23-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-23-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:11:25 +0100
Message-ID: <CAFEAcA9dciLWNYce7+4HjW1Cu4pEJ1V9gHQ2pokBECCj0mp1QA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-trivial] [PATCH for 2.10 22/35] arm/vexpress: fix
 potential memory leak
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
X-List-Received-Date: Mon, 24 Jul 2017 21:11:48 -0000

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Reorder to only allocate if required.
>
> hw/arm/vexpress.c:667:13: warning: Potential leak of memory pointed to by=
 'flashalias'
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/vexpress.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 528c65ddb6..76c4d84482 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -553,8 +553,6 @@ static void vexpress_common_init(MachineState *machin=
e)
>      MemoryRegion *sysmem =3D get_system_memory();
>      MemoryRegion *vram =3D g_new(MemoryRegion, 1);
>      MemoryRegion *sram =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *flashalias =3D g_new(MemoryRegion, 1);
> -    MemoryRegion *flash0mem;
>      const hwaddr *map =3D daughterboard->motherboard_map;
>      int i;
>
> @@ -657,6 +655,9 @@ static void vexpress_common_init(MachineState *machin=
e)
>      }
>
>      if (map[VE_NORFLASHALIAS] !=3D -1) {
> +        MemoryRegion *flashalias =3D g_new(MemoryRegion, 1);
> +        MemoryRegion *flash0mem;
> +
>          /* Map flash 0 as an alias into low memory */
>          flash0mem =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0)=
;
>          memory_region_init_alias(flashalias, NULL, "vexpress.flashalias"=
,
> --
> 2.13.3

flashalias is no different from any of the other MemoryRegion*
variables we allocate here with g_new() -- they all
leak, and it doesn't matter because the function
runs once and we want the MemoryRegions to survive
until the end of the simulation.

These days we could in theory clean this up by
switching from doing g_new() to having a set of
MemoryRegion fields in the VexpressMachineState
struct (compare hw/arm/mps2.c).

thanks
-- PMM

