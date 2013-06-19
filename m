Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpQ7Z-0005aZ-PB
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 17:40:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1UpQ7X-0005Yv-5p
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 17:40:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1UpQ7W-0001Fr-0b
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 17:40:51 -0400
Received: from cantor2.suse.de ([195.135.220.15]:34179 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1UpQ7S-0001FH-0C; Wed, 19 Jun 2013 17:40:46 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 75DE3A52D7;
	Wed, 19 Jun 2013 23:40:44 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <1371676109-16313-1-git-send-email-sw@weilnetz.de>
Date: Wed, 19 Jun 2013 23:40:43 +0200
Content-Transfer-Encoding: 7bit
Message-Id: <44C4E791-957F-4B61-BE3D-DDB1E3F2238D@suse.de>
References: <1371676109-16313-1-git-send-email-sw@weilnetz.de>
To: Stefan Weil <sw@weilnetz.de>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] pseries: Fix compiler warning
	(conversion of pointer to integral value)
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
X-List-Received-Date: Wed, 19 Jun 2013 21:40:52 -0000


On 19.06.2013, at 23:08, Stefan Weil wrote:

> This kind of type cast must use uintptr_t or target_ulong to be portable
> for hosts with sizeof(void *) != sizeof(long).
> 
> Here the value is assigned to a variable of type target_ulong.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Acked-by: Alexander Graf <agraf@suse.de>

I suppose this one goes through the trivial tree?


Alex

> ---
> hw/ppc/spapr.c |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 218ea23..6e6f6a5 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -670,7 +670,7 @@ static void spapr_cpu_reset(void *opaque)
>     env->external_htab = spapr->htab;
>     env->htab_base = -1;
>     env->htab_mask = HTAB_SIZE(spapr) - 1;
> -    env->spr[SPR_SDR1] = (unsigned long)spapr->htab |
> +    env->spr[SPR_SDR1] = (target_ulong)spapr->htab |
>         (spapr->htab_shift - 18);
> }
> 
> -- 
> 1.7.10.4
> 


