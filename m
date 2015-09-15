Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zbg1u-0008Jr-AV
	for mharc-qemu-trivial@gnu.org; Mon, 14 Sep 2015 22:31:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Zbg1r-0008Ff-Me
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 22:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Zbg1q-0003ja-VK
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 22:31:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43489)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Zbg1n-0003g0-BC; Mon, 14 Sep 2015 22:31:27 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 00EB92F5184;
	Tue, 15 Sep 2015 02:31:26 +0000 (UTC)
Received: from localhost (dhcp-15-42.nay.redhat.com [10.66.15.42])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8F2VOID005789; Mon, 14 Sep 2015 22:31:25 -0400
Date: Tue, 15 Sep 2015 10:31:24 +0800
From: Fam Zheng <famz@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150915023124.GF14016@ad.nay.redhat.com>
References: <1442229154-2052-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442229154-2052-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jcody@redhat.com, qemu-devel@nongnu.org,
	rjones@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/ssh: remove dead code
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
X-List-Received-Date: Tue, 15 Sep 2015 02:31:32 -0000

On Mon, 09/14 13:12, Paolo Bonzini wrote:
> The "err" label cannot be reached with qp != NULL.  Remove the free-ing
> of qp and avoid future regressions by removing the initializer.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/ssh.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/block/ssh.c b/block/ssh.c
> index 8d06739..d35b51f 100644
> --- a/block/ssh.c
> +++ b/block/ssh.c
> @@ -193,7 +193,7 @@ sftp_error_report(BDRVSSHState *s, const char *fs, ...)
>  static int parse_uri(const char *filename, QDict *options, Error **errp)
>  {
>      URI *uri = NULL;
> -    QueryParams *qp = NULL;
> +    QueryParams *qp;
>      int i;
>  
>      uri = uri_parse(filename);
> @@ -249,9 +249,6 @@ static int parse_uri(const char *filename, QDict *options, Error **errp)
>      return 0;
>  
>   err:
> -    if (qp) {
> -      query_params_free(qp);
> -    }
>      if (uri) {
>        uri_free(uri);
>      }
> -- 
> 2.5.0
> 
> 

Reviewed-by: Fam Zheng <famz@redhat.com>

