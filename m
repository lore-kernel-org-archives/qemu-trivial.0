Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPqCp-0008Lw-Jt
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 05:21:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WPqCi-0007uv-HQ
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WPqCd-0001nO-Hp
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:21:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1WPqCT-0001mA-4A; Tue, 18 Mar 2014 05:20:45 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2I9Kefo005227
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 18 Mar 2014 05:20:41 -0400
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id s2I9Kc78006649; Tue, 18 Mar 2014 05:20:39 -0400
Date: Tue, 18 Mar 2014 10:20:38 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Maria Kustova <maxa@catit.be>
Message-ID: <20140318092038.GE4607@noname.str.redhat.com>
References: <1395122359-28890-1-git-send-email-maria.k@catit.be>
	<1395122359-28890-3-git-send-email-maria.k@catit.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395122359-28890-3-git-send-email-maria.k@catit.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
	Maria Kustova <maria.k@catit.be>
Subject: Re: [Qemu-trivial] [PATCH v2 2/3] block: Replaced old error
 handling with error reporting API.
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
X-List-Received-Date: Tue, 18 Mar 2014 09:21:06 -0000

Am 18.03.2014 um 06:59 hat Maria Kustova geschrieben:
> Signed-off-by: Maria Kustova <maria.k@catit.be>
> ---
> Changes v1 -> v2:
>  * Removed trailing "\n" from the error string
> ---
>  block/curl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/curl.c b/block/curl.c
> index 3494c6d..359637e 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -538,8 +538,7 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,

Did you manually edit this patch? It is corrupted and I had to manually
s/538,8/538,7/ before I could apply it.

Kevin

>      return 0;
>  
>  out:
> -    fprintf(stderr, "CURL: Error opening file: %s\n", state->errmsg);
> +    error_setg(errp, "CURL: Error opening file: %s", state->errmsg);
>      curl_easy_cleanup(state->curl);
>      state->curl = NULL;
>  out_noclean:
> -- 
> 1.8.2.1
> 

