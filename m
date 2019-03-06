Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1T0d-0007Gl-7G
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 04:38:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1T0b-0007Fv-QH
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:38:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1T0a-0000RZ-Uz
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:38:41 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:60047)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1T0W-0000G9-Df; Wed, 06 Mar 2019 04:38:36 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MQNAv-1gfFBY3XvN-00MOK6; Wed, 06 Mar 2019 10:38:26 +0100
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Max Reitz <mreitz@redhat.com>
References: <20190219153727.62279-1-stephen.checkoway@oberlin.edu>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f08e6be0-68c5-a7fe-8877-7dad0eb5929d@vivier.eu>
Date: Wed, 6 Mar 2019 10:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190219153727.62279-1-stephen.checkoway@oberlin.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Bo3mdSiFs0XMHjgMgGuWoJPIyupcx9RoYSNyHNWKPVs8UspLCuL
	xFKITlzBc83UVAkHFrMcCnAeHLijIeBYS+i6PmpCeBIQMyV+Z6l7wJ8HEUQAl3E1rK81IM1
	fvvDSTomZ0MDVLIdwixInTeCzS3f2+ydSAqQqdM+FicSKjo1IGOzVFvUZeZMQohPE72NM06
	E7Iw/hER32jAVbu18Uz/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p0JPZCRVwew=:gTXPoBxRgzEe5J1se1L2dH
	XK8p9I3wk7stBGkhKraIEtA67CVlJlAbeUIFeiNaLKWng+O503xBqOvu2nGD/o40q875NZVyj
	+5Vgy/M0fbw3WE+Gg9x4Zt3pFcFTHebwlpSRtFSI7ncdz7N505UB6sA7ynsgZ6BQXL9a9ey0i
	2Gm+8AKOMkW/mkTLlNOxPXZdQPyJMbypkoSd7Yhv9B6w8Rc8kzN0IiX+ASE5aR1wnFzILYdAo
	H7q8r8vt71SjT0xnV/zxrGBrpzDo3Jev777RrJcGioHBChJ7o6Wi92bf/JeFjQS3tVVpqIrqc
	NQcwp5abYpPxxBQ2vKSftJaVTLwbQNP461oDagvvoDZwGg3dLFrzTrsYqs5dRU7+QMFEAkeg4
	nR4YNc3pNBDxHiG4PIOF+d6HuNuEVUYL6qLm/A2jxl7tnu6+W1etJikV/8hX9yPsZmKfJwY69
	lmdr8Vp1t8EYHWe6Qb7D7vj1G3vbeOAgcZ8Nsmb0C5w79LCY4V3kNDApZ156ZuGa/G91s063W
	g/nFFDCSGJrEhF4wZ1+bB3Cbfc0zh4oFGS2Gw0SG1jbEqwkYhI8OQvAdUEGRZR2DlxNskw/Z6
	1Mk5dZAexTAY+62QeY0h/8CWTe+IJEzBdCfSgN8Q5QtSAXEFbKW8sxBEYbu3X3JXzHt2Tz84L
	xb7bR7PLC3U3NxwgTw2WUxZlYECGBn1pNP2TsoaMiyA7RRFQnElov8lmemMG3ivWQ8EEnwh9T
	TElz8pneoQLG3iS2S3+9VfEgPEnuQHBzJbTtw2cS/i/M7UazLIta0ZRwHBo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH] block/pflash_cfi02: Fix memory leak and
 potential use-after-free
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
X-List-Received-Date: Wed, 06 Mar 2019 09:38:42 -0000

On 19/02/2019 16:37, Stephen Checkoway wrote:
> Don't dynamically allocate the pflash's timer. But do use timer_del in
> an unrealize function to make sure that the timer can't fire after the
> pflash_t has been freed.
> 
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> ---
>  hw/block/pflash_cfi02.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 0f8b7b8c7b..1588aeff5a 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -84,7 +84,7 @@ struct pflash_t {
>      uint16_t unlock_addr0;
>      uint16_t unlock_addr1;
>      uint8_t cfi_table[0x52];
> -    QEMUTimer *timer;
> +    QEMUTimer timer;
>      /* The device replicates the flash memory across its memory space.  Emulate
>       * that by having a container (.mem) filled with an array of aliases
>       * (.mem_mappings) pointing to the flash memory (.orig_mem).
> @@ -429,7 +429,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
>              }
>              pfl->status = 0x00;
>              /* Let's wait 5 seconds before chip erase is done */
> -            timer_mod(pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +            timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>                        (NANOSECONDS_PER_SECOND * 5));
>              break;
>          case 0x30:
> @@ -444,7 +444,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
>              }
>              pfl->status = 0x00;
>              /* Let's wait 1/2 second before sector erase is done */
> -            timer_mod(pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +            timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>                        (NANOSECONDS_PER_SECOND / 2));
>              break;
>          default:
> @@ -596,7 +596,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
>      pfl->rom_mode = 1;
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
>  
> -    pfl->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
> +    timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
>      pfl->wcycle = 0;
>      pfl->cmd = 0;
>      pfl->status = 0;
> @@ -695,11 +695,18 @@ static Property pflash_cfi02_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static void pflash_cfi02_unrealize(DeviceState *dev, Error **errp)
> +{
> +    pflash_t *pfl = CFI_PFLASH02(dev);
> +    timer_del(&pfl->timer);
> +}
> +
>  static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->realize = pflash_cfi02_realize;
> +    dc->unrealize = pflash_cfi02_unrealize;
>      dc->props = pflash_cfi02_properties;
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

