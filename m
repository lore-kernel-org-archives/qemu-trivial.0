Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZbRmB-0006ik-RI
	for mharc-qemu-trivial@gnu.org; Mon, 14 Sep 2015 07:18:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1ZbRm8-0006dt-6u
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 07:18:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1ZbRm6-0004oE-Sa
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 07:18:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48714)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1ZbRm1-0004mH-Dv; Mon, 14 Sep 2015 07:18:13 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id E415A2F5177;
	Mon, 14 Sep 2015 11:18:11 +0000 (UTC)
Received: from localhost (vpn1-4-128.ams2.redhat.com [10.36.4.128])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8EBIAL9018785; Mon, 14 Sep 2015 07:18:11 -0400
Date: Mon, 14 Sep 2015 12:18:10 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150914111810.GD1406@redhat.com>
References: <1442229154-2052-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442229154-2052-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jcody@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block/ssh: remove dead code
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
X-List-Received-Date: Mon, 14 Sep 2015 11:18:21 -0000

On Mon, Sep 14, 2015 at 01:12:34PM +0200, Paolo Bonzini wrote:
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

The patch looks correct to me, so:

ACK

However (in libguestfs) we would generally leave such code around to
make it more future proof against rearrangements of the code which
could cause a memory leak.  But then again, libguestfs (following
systemd practice) uses __attribute__((cleanup)) extensively ...

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/

