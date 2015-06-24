Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7cN7-0004yp-Oi
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 00:33:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z7cN3-0004vo-Qe
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 00:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z7cMy-00077W-FZ
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 00:33:09 -0400
Received: from mail-yh0-f52.google.com ([209.85.213.52]:33594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z7cMy-00077K-C9
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 00:33:04 -0400
Received: by yhpn97 with SMTP id n97so12315155yhp.0
	for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2015 21:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=bXORu92icDqVwRK7vHhvEiltyek/ykneik6RbNxwLAc=;
	b=GaHCackaFKol2ZAu//Jh3SsGOCyICGcIRSadQqsj4qZq64wgL/GON6qZrYJOF2xDPI
	OLW5Betq7uDhhdJ7rIWQ8jWlWTiPCBLsVpCnpmOgR3lJL+PbX7OgaTH7G7MP/3hA+G8M
	LgY2bReArEBpDQ4Tg1hlySo4JXgGbPYjd+shBvGw1tpoLh1M0I1m425ItTmvU3b3w/Ss
	BWxlz6sl6wU6gKcabUl+KcxS3G3AnonA2q3uIWrxZDozRPMSAQtypcD8Iekz1aR7GZ9o
	DQpRXMs3NR/jrF8xdedXj/Es6P91Tnm3abaUNWYEaVzWe0Gk5uPOYr3VOSQ/+kMNEGxd
	TR9A==
X-Gm-Message-State: ALoCoQnkDIuFbewPajCiAmU8CAKLPGXfldkFhdbMvq++El8yfHk2+Xzh0dV7gnkcZXw2KIB8bl4m
MIME-Version: 1.0
X-Received: by 10.170.57.68 with SMTP id 65mr41231384ykz.35.1435120383761;
	Tue, 23 Jun 2015 21:33:03 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.37.50.201 with HTTP; Tue, 23 Jun 2015 21:33:03 -0700 (PDT)
In-Reply-To: <1433714349-7262-1-git-send-email-crosthwaite.peter@gmail.com>
References: <1433714349-7262-1-git-send-email-crosthwaite.peter@gmail.com>
Date: Tue, 23 Jun 2015 21:33:03 -0700
X-Google-Sender-Auth: xO6MVB8WADCkU_jFkBzTMhjbeLA
Message-ID: <CAEgOgz7u4z00kGxD2fdF87r_RiCFxx8m3yG_CJpmNBWK18cAyw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.52
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] memory_mapping: Rework
	cpu related includes
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
X-List-Received-Date: Wed, 24 Jun 2015 04:33:11 -0000

Ping!

On Sun, Jun 7, 2015 at 2:59 PM, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> This makes it more consistent with all other core code files, which
> either just rely on qemu-common.h inclusion or precede cpu.h with
> qemu-common.h.
>
> cpu-all.h should not be included in addition to cpu.h. Remove it.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> changed since v1:
> Leave in cpu.h include
>
> Picked up by my multi arch WIP where target-multi/cpu.h cant handle
> random core code inclusion without preceeded qemu-common.h. I guess
> this is the only one in tree?
> ---
>  memory_mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/memory_mapping.c b/memory_mapping.c
> index 7b69801..36d6b26 100644
> --- a/memory_mapping.c
> +++ b/memory_mapping.c
> @@ -13,8 +13,8 @@
>
>  #include <glib.h>
>
> +#include "qemu-common.h"
>  #include "cpu.h"
> -#include "exec/cpu-all.h"
>  #include "sysemu/memory_mapping.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
> --
> 1.9.1
>
>

