Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xnm98-0002VK-0c
	for mharc-qemu-trivial@gnu.org; Mon, 10 Nov 2014 05:24:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1Xnm90-0002SS-R2
	for qemu-trivial@nongnu.org; Mon, 10 Nov 2014 05:24:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1Xnm8u-0007rG-Nm
	for qemu-trivial@nongnu.org; Mon, 10 Nov 2014 05:24:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1Xnm8u-0007r6-H1; Mon, 10 Nov 2014 05:24:16 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAAAOF6c008316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 10 Nov 2014 05:24:15 -0500
Received: from dresden.str.redhat.com (dhcp-192-247.str.redhat.com
	[10.33.192.247])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAAAOC9U029209
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 10 Nov 2014 05:24:14 -0500
Message-ID: <5460924C.7040308@redhat.com>
Date: Mon, 10 Nov 2014 11:24:12 +0100
From: Max Reitz <mreitz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1415610638-3918-1-git-send-email-famz@redhat.com>
In-Reply-To: <1415610638-3918-1-git-send-email-famz@redhat.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Fix comment for
	bdrv_co_get_block_status
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
X-List-Received-Date: Mon, 10 Nov 2014 10:24:29 -0000

On 2014-11-10 at 10:10, Fam Zheng wrote:
> It returns more information than binary, fix the comment.
>
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>   block.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/block.c b/block.c
> index dacd881..42c914e 100644
> --- a/block.c
> +++ b/block.c
> @@ -3903,9 +3903,9 @@ typedef struct BdrvCoGetBlockStatusData {
>   } BdrvCoGetBlockStatusData;
>   
>   /*
> - * Returns true iff the specified sector is present in the disk image. Drivers
> - * not implementing the functionality are assumed to not support backing files,
> - * hence all their sectors are reported as allocated.
> + * Returns the status of the specified sectors. Drivers not implementing the
> + * functionality are assumed to not support backing files, hence all their
> + * sectors are reported as allocated.
>    *
>    * If 'sector_num' is beyond the end of the disk image the return value is 0
>    * and 'pnum' is set to 0.

"status" is a bit broad, but pointing to "line 86 in 
include/block/block.h" for a further explanation will probably not be 
very stable.

Reviewed-by: Max Reitz <mreitz@redhat.com>

