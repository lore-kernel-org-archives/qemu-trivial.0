Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7n4g-0004o5-SZ
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 13:03:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1b7mjq-0001XS-4W
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:42:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1b7mjm-0004So-CU
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:41:53 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:6514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1b7mjm-0004SX-4r; Tue, 31 May 2016 12:41:50 -0400
X-IronPort-AV: E=Sophos;i="5.26,396,1459807200"; d="scan'208";a="220502080"
Received: from unknown (HELO var.youpi.perso.aquilenet.fr) ([193.50.110.156])
	by mail2-relais-roc.national.inria.fr with
	ESMTP/TLS/AES256-GCM-SHA384; 31 May 2016 18:41:48 +0200
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.87)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1b7mjk-0000PN-9m; Tue, 31 May 2016 18:41:48 +0200
Date: Tue, 31 May 2016 18:41:48 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20160531164148.GO10830@var.bordeaux.inria.fr>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-13-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464712565-14857-13-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.5.21+34 (58baf7c9f32f) (2010-12-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.134.164.83
X-Mailman-Approved-At: Tue, 31 May 2016 13:03:25 -0400
Subject: Re: [Qemu-trivial] [PATCH 12/16] slirp: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:42:00 -0000

Laurent Vivier, on Tue 31 May 2016 18:36:01 +0200, wrote:
> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
> 
> This patch is the result of coccinelle script
> scripts/coccinelle/round.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  slirp/dnssearch.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/slirp/dnssearch.c b/slirp/dnssearch.c
> index aed2f13..9b16757 100644
> --- a/slirp/dnssearch.c
> +++ b/slirp/dnssearch.c
> @@ -262,7 +262,7 @@ int translate_dnssearch(Slirp *s, const char **names)
>      }
>  
>      /* reserve extra 2 header bytes for each 255 bytes of output */
> -    memreq += ((memreq + MAX_OPT_LEN - 1) / MAX_OPT_LEN) * OPT_HEADER_LEN;
> +    memreq += DIV_ROUND_UP(memreq, MAX_OPT_LEN) * OPT_HEADER_LEN;
>      result = g_malloc(memreq * sizeof(*result));
>  
>      outptr = result;
> @@ -289,7 +289,7 @@ int translate_dnssearch(Slirp *s, const char **names)
>      domain_mkxrefs(domains, domains + num_domains - 1, 0);
>      memreq = domain_compactify(domains, num_domains);
>  
> -    blocks = (memreq + MAX_OPT_LEN - 1) / MAX_OPT_LEN;
> +    blocks = DIV_ROUND_UP(memreq, MAX_OPT_LEN);
>      bsrc_end = memreq;
>      bsrc_start = (blocks - 1) * MAX_OPT_LEN;
>      bdst_start = bsrc_start + blocks * OPT_HEADER_LEN;
> -- 
> 2.5.5
> 

-- 
Samuel
AUTHOR
     FvwmM4 is the result of a random  bit  mutation  on  a  hard
     disk,  presumably  a  result  of  a  cosmic-ray or some such
     thing.
(extrait de la page de man de FvwmM4)

