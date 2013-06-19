Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpDT3-0001fi-9R
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 04:10:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDSz-0001YS-W0
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:10:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDSx-00082W-Gm
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:10:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57696)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UpDSq-0007m2-5Y; Wed, 19 Jun 2013 04:10:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BE6E341974;
	Wed, 19 Jun 2013 12:09:57 +0400 (MSK)
Message-ID: <51C16755.9050700@msgid.tls.msk.ru>
Date: Wed, 19 Jun 2013 12:09:57 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: peter.crosthwaite@xilinx.com
References: <cover.1371553360.git.peter.crosthwaite@xilinx.com>
	<f65ba24ae67c04af46940c8cc67093894af97871.1371553360.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <f65ba24ae67c04af46940c8cc67093894af97871.1371553360.git.peter.crosthwaite@xilinx.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, edgar.iglesias@gmail.com
Subject: Re: [Qemu-trivial] [PATCH v1 1/5] block/nand: Factor out common code
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
X-List-Received-Date: Wed, 19 Jun 2013 08:10:11 -0000

18.06.2013 15:08, peter.crosthwaite@xilinx.com wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 
> Most of this computation of s->iolen is the same for both the if and
> else paths here. Factor out the common parts outside the if.
> 
> Cc: qemu-trivial@nongnu.org
> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
> 
>  hw/block/nand.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/nand.c b/hw/block/nand.c
> index 087ca14..6309f93 100644
> --- a/hw/block/nand.c
> +++ b/hw/block/nand.c
> @@ -272,10 +272,10 @@ static void nand_command(NANDFlashState *s)
>              break;
>          offset = s->addr & ((1 << s->addr_shift) - 1);
>          s->blk_load(s, s->addr, offset);
> -        if (s->gnd)
> -            s->iolen = (1 << s->page_shift) - offset;
> -        else
> -            s->iolen = (1 << s->page_shift) + (1 << s->oob_shift) - offset;
> +        s->iolen = (1 << s->page_shift) - offset;
> +        if (!s->gnd) {
> +            s->iolen += 1 << s->oob_shift;
> +        }

Hm.  Can s->iolen become negative here?

addr_shift can be either less or greather than page_shift.  When addr_shift
is larger than page_shift (addr_shift=16, page_shift=11), offset may be up
to 65535, in which case s->iolen may be -63487, even without additional
oob_shift.

I dunno if this is a concern, just.. asking.

Besides, exactly the same expression is used in nand_getio() down this file,
maybe a common function is in order? :)

And looking at this file, I think it deserves some good type changes.  For
example, all these _shift are unsigned, and most are actually used as masks,
in form (1<<shift), instead of directly (except of erase_shift).

Thanks,

/mjt

