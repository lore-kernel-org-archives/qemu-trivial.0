Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RG1wv-00044N-VU
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 01:10:49 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1RG1wt-00044E-74
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 01:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1RG1wr-0007El-OQ
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 01:10:47 -0400
Received: from e9.ny.us.ibm.com ([32.97.182.139]:41093)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>)
	id 1RG1wr-0007Ee-Ih; Tue, 18 Oct 2011 01:10:45 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e9.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p9I4YNpp022038;
	Tue, 18 Oct 2011 00:34:23 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p9I5Aike301942; Tue, 18 Oct 2011 01:10:44 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p9I5Ai9J015623; Tue, 18 Oct 2011 01:10:44 -0400
Received: from skywalker.linux.vnet.ibm.com ([9.124.35.48])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p9I5Aebd015422; Tue, 18 Oct 2011 01:10:41 -0400
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
In-Reply-To: <1318879259-3052-1-git-send-email-sw@weilnetz.de>
References: <1318879259-3052-1-git-send-email-sw@weilnetz.de>
User-Agent: Notmuch/0.9_rc1-42-g76fdca8 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Tue, 18 Oct 2011 10:40:39 +0530
Message-ID: <87ipnm7uls.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.139
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [PATCH] hw/9pfs: Fix missing parentheses
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
X-List-Received-Date: Tue, 18 Oct 2011 05:10:48 -0000

On Mon, 17 Oct 2011 21:20:59 +0200, Stefan Weil <sw@weilnetz.de> wrote:
> cppcheck report:
> hw/9pfs/virtio-9p.c:2385:
>  style: Boolean result is used in bitwise operation.
>  Clarify expression with parentheses
> hw/9pfs/virtio-9p.c:2531:
>  style: Boolean result is used in bitwise operation.
>  Clarify expression with parentheses
> 
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/9pfs/virtio-9p.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/9pfs/virtio-9p.c b/hw/9pfs/virtio-9p.c
> index c01c31a..df0b22a 100644
> --- a/hw/9pfs/virtio-9p.c
> +++ b/hw/9pfs/virtio-9p.c
> @@ -2382,7 +2382,7 @@ static void v9fs_remove(void *opaque)
>          goto out_nofid;
>      }
>      /* if fs driver is not path based, return EOPNOTSUPP */
> -    if (!pdu->s->ctx.flags & PATHNAME_FSCONTEXT) {
> +    if (!(pdu->s->ctx.flags & PATHNAME_FSCONTEXT)) {
>          err = -EOPNOTSUPP;
>          goto out_err;
>      }
> @@ -2528,7 +2528,7 @@ static void v9fs_rename(void *opaque)
>      }
>      BUG_ON(fidp->fid_type != P9_FID_NONE);
>      /* if fs driver is not path based, return EOPNOTSUPP */
> -    if (!pdu->s->ctx.flags & PATHNAME_FSCONTEXT) {
> +    if (!(pdu->s->ctx.flags & PATHNAME_FSCONTEXT)) {
>          err = -EOPNOTSUPP;
>          goto out;
>      }

This is fixed in the new pull request i sent.

http://article.gmane.org/gmane.comp.emulators.qemu/120990
http://repo.or.cz/w/qemu/v9fs.git/commitdiff/c98f1d4a8bb6f779313043d2490093451cf52065?hp=7cca27dfde6435a7846d88e8a1fa927d0ab99919

-aneesh

