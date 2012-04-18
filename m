Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKPYm-00017J-92
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2012 03:44:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1SKPYf-0000mP-Ks
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2012 03:44:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1SKPYb-0005qw-2j
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2012 03:44:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1SKPYO-0005pW-Tb; Wed, 18 Apr 2012 03:43:53 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3I7hoQo030742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 18 Apr 2012 03:43:51 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3I7hnZ6028101
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Wed, 18 Apr 2012 03:43:50 -0400
Message-ID: <4F8E7196.6050108@redhat.com>
Date: Wed, 18 Apr 2012 09:47:34 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1334684468-2522-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1334684468-2522-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block: Fix spelling in comment
	(ineffcient -> inefficient)
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
X-List-Received-Date: Wed, 18 Apr 2012 07:44:15 -0000

Am 17.04.2012 19:41, schrieb Stefan Weil:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  block/cow.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/block/cow.c b/block/cow.c
> index 8d3c9f8..a5a00eb 100644
> --- a/block/cow.c
> +++ b/block/cow.c
> @@ -103,7 +103,7 @@ static int cow_open(BlockDriverState *bs, int flags)
>  }
>  
>  /*
> - * XXX(hch): right now these functions are extremely ineffcient.
> + * XXX(hch): right now these functions are extremely inefficient.
>   * We should just read the whole bitmap we'll need in one go instead.
>   */
>  static inline int cow_set_bit(BlockDriverState *bs, int64_t bitnum)

Thanks, applied to the block branch.

Kevin

