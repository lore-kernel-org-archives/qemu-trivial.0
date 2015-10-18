Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZnoRI-0005XX-NB
	for mharc-qemu-trivial@gnu.org; Sun, 18 Oct 2015 09:55:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1ZnoRF-0005WS-Rc
	for qemu-trivial@nongnu.org; Sun, 18 Oct 2015 09:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1ZnoRA-0002nS-R4
	for qemu-trivial@nongnu.org; Sun, 18 Oct 2015 09:55:53 -0400
Received: from s16892447.onlinehome-server.info ([82.165.15.123]:37105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1ZnoRA-0002n2-Bw; Sun, 18 Oct 2015 09:55:48 -0400
Received: from [90.204.7.8] (helo=[192.168.1.87])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1ZnoQz-0002dR-Hn; Sun, 18 Oct 2015 14:55:38 +0100
Message-ID: <5623A4C9.90102@ilande.co.uk>
Date: Sun, 18 Oct 2015 14:55:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1444899255-16300-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1444899255-16300-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 90.204.7.8
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Cc: blauwirbel@gmail.com, pbonzini@redhat.com, armbru@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/display/tcx: Remove
 superfluous OBJECT() typecasts
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
X-List-Received-Date: Sun, 18 Oct 2015 13:55:55 -0000

On 15/10/15 09:54, Thomas Huth wrote:

> The tcx_initfn() function is already supplied with an
> Object *obj pointer, so there is no need to cast the
> state pointer back to an Object pointer all over the
> place. And while we're at it, also remove the superfluous
> "return;" statement in this function.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/display/tcx.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index bf119bc..d720ea6 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -944,57 +944,55 @@ static void tcx_initfn(Object *obj)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      TCXState *s = TCX(obj);
>  
> -    memory_region_init_ram(&s->rom, OBJECT(s), "tcx.prom", FCODE_MAX_ROM_SIZE,
> +    memory_region_init_ram(&s->rom, obj, "tcx.prom", FCODE_MAX_ROM_SIZE,
>                             &error_fatal);
>      memory_region_set_readonly(&s->rom, true);
>      sysbus_init_mmio(sbd, &s->rom);
>  
>      /* 2/STIP : Stippler */
> -    memory_region_init_io(&s->stip, OBJECT(s), &tcx_stip_ops, s, "tcx.stip",
> +    memory_region_init_io(&s->stip, obj, &tcx_stip_ops, s, "tcx.stip",
>                            TCX_STIP_NREGS);
>      sysbus_init_mmio(sbd, &s->stip);
>  
>      /* 3/BLIT : Blitter */
> -    memory_region_init_io(&s->blit, OBJECT(s), &tcx_blit_ops, s, "tcx.blit",
> +    memory_region_init_io(&s->blit, obj, &tcx_blit_ops, s, "tcx.blit",
>                            TCX_BLIT_NREGS);
>      sysbus_init_mmio(sbd, &s->blit);
>  
>      /* 5/RSTIP : Raw Stippler */
> -    memory_region_init_io(&s->rstip, OBJECT(s), &tcx_rstip_ops, s, "tcx.rstip",
> +    memory_region_init_io(&s->rstip, obj, &tcx_rstip_ops, s, "tcx.rstip",
>                            TCX_RSTIP_NREGS);
>      sysbus_init_mmio(sbd, &s->rstip);
>  
>      /* 6/RBLIT : Raw Blitter */
> -    memory_region_init_io(&s->rblit, OBJECT(s), &tcx_rblit_ops, s, "tcx.rblit",
> +    memory_region_init_io(&s->rblit, obj, &tcx_rblit_ops, s, "tcx.rblit",
>                            TCX_RBLIT_NREGS);
>      sysbus_init_mmio(sbd, &s->rblit);
>  
>      /* 7/TEC : ??? */
> -    memory_region_init_io(&s->tec, OBJECT(s), &tcx_dummy_ops, s,
> -                          "tcx.tec", TCX_TEC_NREGS);
> +    memory_region_init_io(&s->tec, obj, &tcx_dummy_ops, s, "tcx.tec",
> +                          TCX_TEC_NREGS);
>      sysbus_init_mmio(sbd, &s->tec);
>  
>      /* 8/CMAP : DAC */
> -    memory_region_init_io(&s->dac, OBJECT(s), &tcx_dac_ops, s,
> -                          "tcx.dac", TCX_DAC_NREGS);
> +    memory_region_init_io(&s->dac, obj, &tcx_dac_ops, s, "tcx.dac",
> +                          TCX_DAC_NREGS);
>      sysbus_init_mmio(sbd, &s->dac);
>  
>      /* 9/THC : Cursor */
> -    memory_region_init_io(&s->thc, OBJECT(s), &tcx_thc_ops, s, "tcx.thc",
> +    memory_region_init_io(&s->thc, obj, &tcx_thc_ops, s, "tcx.thc",
>                            TCX_THC_NREGS);
>      sysbus_init_mmio(sbd, &s->thc);
>  
>      /* 11/DHC : ??? */
> -    memory_region_init_io(&s->dhc, OBJECT(s), &tcx_dummy_ops, s, "tcx.dhc",
> +    memory_region_init_io(&s->dhc, obj, &tcx_dummy_ops, s, "tcx.dhc",
>                            TCX_DHC_NREGS);
>      sysbus_init_mmio(sbd, &s->dhc);
>  
>      /* 12/ALT : ??? */
> -    memory_region_init_io(&s->alt, OBJECT(s), &tcx_dummy_ops, s, "tcx.alt",
> +    memory_region_init_io(&s->alt, obj, &tcx_dummy_ops, s, "tcx.alt",
>                            TCX_ALT_NREGS);
>      sysbus_init_mmio(sbd, &s->alt);
> -
> -    return;
>  }
>  
>  static void tcx_realizefn(DeviceState *dev, Error **errp)

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Note that I'm in the process of moving and therefore connectivity is
going to be poor for the next week and a bit - happy for this to go via
-trivial if that works for everyone?


ATB,

Mark.


