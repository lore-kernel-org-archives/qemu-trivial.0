Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bf83l-0002G2-JO
	for mharc-qemu-trivial@gnu.org; Wed, 31 Aug 2016 12:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1bf83g-0002Ai-5r
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 12:08:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1bf83d-0005Ju-W3
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 12:08:11 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:35830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1bf83a-0005Ht-CE; Wed, 31 Aug 2016 12:08:06 -0400
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::1000])
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
	(envelope-from <aurelien@aurel32.net>)
	id 1bf83R-0003io-Ei; Wed, 31 Aug 2016 18:07:57 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.87)
	(envelope-from <aurelien@aurel32.net>)
	id 1bf83I-0001qE-5g; Wed, 31 Aug 2016 18:07:48 +0200
Date: Wed, 31 Aug 2016 18:07:47 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Reda Sallahi <fullmanet@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>
Message-ID: <20160831160747.mwra4twomxmkcwhk@aurel32.net>
References: <20160831155449.5154-1-fullmanet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160831155449.5154-1-fullmanet@gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-07-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:bc8:30d7:100::1
Subject: Re: [Qemu-trivial] [PATCH] sh4: fix broken link to documentation
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
X-List-Received-Date: Wed, 31 Aug 2016 16:08:16 -0000

On 2016-08-31 17:54, Reda Sallahi wrote:
> The page that was previously linked in the source code and the README file is
> no longer available so it now returns a 404 error message.
> 
> This puts a previous snapshot from archive.org instead.
> 
> Signed-off-by: Reda Sallahi <fullmanet@gmail.com>
> ---
>  hw/sh4/shix.c         | 2 +-
>  target-sh4/README.sh4 | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
> index ccc9e75..2ac79fc 100644
> --- a/hw/sh4/shix.c
> +++ b/hw/sh4/shix.c
> @@ -23,7 +23,7 @@
>   */
>  /*
>     Shix 2.0 board by Alexis Polti, described at
> -   http://perso.enst.fr/~polti/realisations/shix20/
> +   web.archive.org/web/20070917001736/perso.enst.fr/~polti/realisations/shix20

Thanks for the patch. Maybe put the http:// in front. It will go over
the 80 characters limits, but I think that's fine in such a case.

I guess this will be merged through the trivial queue, that seems the
best to me.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

