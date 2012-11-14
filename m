Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYgGF-0003kn-GI
	for mharc-qemu-trivial@gnu.org; Wed, 14 Nov 2012 11:56:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYgGB-0003jk-De
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 11:56:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYgG8-0000ys-Bg
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 11:56:19 -0500
Received: from hall.aurel32.net ([2001:470:1f15:c4f::1]:53967)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TYgG8-0000yh-4k
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 11:56:16 -0500
Received: from wifi-pers-0465.univ-lyon1.fr ([134.214.213.210]
	helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1TYgG5-0005DI-87; Wed, 14 Nov 2012 17:56:13 +0100
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1TYgFz-0003mM-P5; Wed, 14 Nov 2012 17:56:07 +0100
Date: Wed, 14 Nov 2012 17:56:07 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jia Liu <proljc@gmail.com>
Message-ID: <20121114165607.GB5877@ohm.aurel32.net>
References: <20121114024954.GA63683@cs.nctu.edu.tw>
	<0E9C0C71-C831-482F-9555-2CC2088B2F27@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0E9C0C71-C831-482F-9555-2CC2088B2F27@gmail.com>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:470:1f15:c4f::1
Cc: qemu-trivial@nongnu.org,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [PATCH] Possible wrong microMIPS opcode encoding
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
X-List-Received-Date: Wed, 14 Nov 2012 16:56:22 -0000

On Wed, Nov 14, 2012 at 01:38:44PM +0800, Jia Liu wrote:
> Hi guys,
> 
> On Nov 14, 2012, at 10:49 AM, 陳韋任 (Wei-Ren Chen) <chenwj@iis.sinica.edu.tw> wrote:
> 
> > Hi all,
> > 
> >  While reading microMIPS decoding, I found a possible wrong opcode
> > encoding. According to [1] page 337, the bits 13..12 for MULTU is
> > 0x01 rather than 0x00. Please review, thanks.
> > 
> > [1] MIPS Architecture for Programmers VolumeIV-e: The MIPS DSP
> >    Application-Specific Extension to the microMIPS32 Architecture
> > 
> > Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> > ---
> > target-mips/translate.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/target-mips/translate.c b/target-mips/translate.c
> > index f6fc0c2..01b48fa 100644
> > --- a/target-mips/translate.c
> > +++ b/target-mips/translate.c
> > @@ -10385,7 +10385,7 @@ enum {
> > 
> >     /* bits 13..12 for 0x32 */
> >     MULT_ACC = 0x0,
> > -    MULTU_ACC = 0x0,
> > +    MULTU_ACC = 0x1,
> > 
> >     /* bits 15..12 for 0x2c */
> >     SEB = 0x2,
> > -- 
> > 1.7.12.3
> 
> 
> try this, it is a example using exist frame.
> 
> diff --git a/target-mips/translate.c b/target-mips/translate.c
> index f6fc0c2..04b2aae 100644
> --- a/target-mips/translate.c
> +++ b/target-mips/translate.c
> @@ -10371,6 +10371,8 @@ enum {
>      MFC0 = 0x03,
>      MTC0 = 0x0b,
>  
> +    MICRODSP_ABSQ_S_QB_OP = 0x04;
> +
>      /* bits 13..12 for 0x01 */
>      MFHI_ACC = 0x0,
>      MFLO_ACC = 0x1,
> @@ -10452,6 +10454,9 @@ enum {
>      MFLO32 = 0x1,
>      MTHI32 = 0x2,
>      MTLO32 = 0x3,
> +
> +    /* bits 15..12 for MICRODSP_ABSQ_S_QB_OP */
> +    MICRODSP_ABSQ_S_QB = 0x00;
>  };
>  
>  /* POOL32B encoding of minor opcode field (bits 15..12) */
> @@ -11274,6 +11279,14 @@ static void gen_pool32axf (CPUMIPSState *env, DisasContext *ctx, int rt, int rs,
>              goto pool32axf_invalid;
>          }
>          break;
> +    case MICRODSP_ABSQ_S_QB_OP:
> +        switch (minor) {
> +        case MICRODSP_ABSQ_S_QB: // ABSQ_S_QB
> +            break;
> +        default:
> +            goto pool32axf_invalid;
> +        }
> +        break;
>      default:
>      pool32axf_invalid:
>          MIPS_INVAL("pool32axf");
> 

I don't really understand what this patch is supposed to do compared to
the original bug report and patch.

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

