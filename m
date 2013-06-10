Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um0Da-0004VJ-9n
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 07:24:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Um0DX-0004V8-Fi
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 07:24:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Um0DW-00070I-8P
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 07:24:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Um0DV-00070A-W7; Mon, 10 Jun 2013 07:24:54 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5ABOrXU018007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 07:24:53 -0400
Received: from dhcp-200-207.str.redhat.com (dhcp-192-246.str.redhat.com
	[10.33.192.246])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id r5ABOpbC030726; Mon, 10 Jun 2013 07:24:51 -0400
Date: Mon, 10 Jun 2013 13:24:51 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20130610112451.GC3636@dhcp-200-207.str.redhat.com>
References: <1370858796-16217-1-git-send-email-rjones@redhat.com>
	<1370858796-16217-2-git-send-email-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1370858796-16217-2-git-send-email-rjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] block/curl.c: Refuse to open the handle
	for writes.
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
X-List-Received-Date: Mon, 10 Jun 2013 11:24:56 -0000

Am 10.06.2013 um 12:06 hat Richard W.M. Jones geschrieben:
> From: "Richard W.M. Jones" <rjones@redhat.com>
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  block/curl.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/block/curl.c b/block/curl.c
> index b8935fd..f1e302b 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -406,6 +406,10 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags)
>  
>      static int inited = 0;
>  
> +    if (flags & BDRV_O_RDWR) {
> +        return -ENOTSUP;
> +    }
> +

Thanks, I applied this patch to the block branch for now, but I think a
v2 with some better error reporting wouldn't hurt. We can either add a
qerror_report() call or at least change the error code to -EROFS or
something like that.

Kevin

