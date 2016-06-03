Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8teo-0001Pj-Rs
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jun 2016 14:17:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1b8tej-0001NG-Ir
	for qemu-trivial@nongnu.org; Fri, 03 Jun 2016 14:17:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1b8tee-0002TP-Tk
	for qemu-trivial@nongnu.org; Fri, 03 Jun 2016 14:17:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1b8teZ-0002Sx-8Q; Fri, 03 Jun 2016 14:17:03 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5BC0AED34;
	Fri,  3 Jun 2016 18:17:01 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-171.bos.redhat.com
	[10.18.17.171])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u53IH0Tl027828; Fri, 3 Jun 2016 14:17:01 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-17-git-send-email-lvivier@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <0fc04ab4-7f1a-28fc-42b0-2aa90dd6cd09@redhat.com>
Date: Fri, 3 Jun 2016 14:17:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <1464712565-14857-17-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 03 Jun 2016 18:17:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 16/16] hbitmap: Use
 DIV_ROUND_UP
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
X-List-Received-Date: Fri, 03 Jun 2016 18:17:18 -0000



On 05/31/2016 12:36 PM, Laurent Vivier wrote:
> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
> 
> This patch is the result of coccinelle script
> scripts/coccinelle/round.cocci
> 
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  tests/test-hbitmap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
> index abe1427..097fe8e 100644
> --- a/tests/test-hbitmap.c
> +++ b/tests/test-hbitmap.c
> @@ -80,7 +80,7 @@ static void hbitmap_test_init(TestHBitmapData *data,
>      size_t n;
>      data->hb = hbitmap_alloc(size, granularity);
>  
> -    n = (size + BITS_PER_LONG - 1) / BITS_PER_LONG;
> +    n = DIV_ROUND_UP(size, BITS_PER_LONG);
>      if (n == 0) {
>          n = 1;
>      }
> @@ -94,7 +94,7 @@ static void hbitmap_test_init(TestHBitmapData *data,
>  
>  static inline size_t hbitmap_test_array_size(size_t bits)
>  {
> -    size_t n = (bits + BITS_PER_LONG - 1) / BITS_PER_LONG;
> +    size_t n = DIV_ROUND_UP(bits, BITS_PER_LONG);
>      return n ? n : 1;
>  }
>  
> @@ -186,7 +186,7 @@ static void hbitmap_test_reset_all(TestHBitmapData *data)
>  
>      hbitmap_reset_all(data->hb);
>  
> -    n = (data->size + BITS_PER_LONG - 1) / BITS_PER_LONG;
> +    n = DIV_ROUND_UP(data->size, BITS_PER_LONG);
>      if (n == 0) {
>          n = 1;
>      }
> 

Reviewed-by: John Snow <jsnow@redhat.com>

