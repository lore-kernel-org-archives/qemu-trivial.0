Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJi40-0004Ef-7V
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 07:58:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XJi3u-00045B-6H
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 07:58:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XJi3p-00044G-7S
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 07:58:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1XJi3e-0003yY-JG; Tue, 19 Aug 2014 07:58:34 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7JBwRdl027424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 19 Aug 2014 07:58:27 -0400
Received: from noname.redhat.com (ovpn-116-99.ams2.redhat.com [10.36.116.99])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id s7JBwNnE016708; Tue, 19 Aug 2014 07:58:25 -0400
Date: Tue, 19 Aug 2014 13:58:23 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140819115823.GD4638@noname.redhat.com>
References: <1408362096-10482-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408362096-10482-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	qemu-devel@nongnu.org, stefanha@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/vvfat.c: remove
 debugging code to reinit stderr if NULL
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
X-List-Received-Date: Tue, 19 Aug 2014 11:58:55 -0000

Am 18.08.2014 um 13:41 hat Michael Tokarev geschrieben:
> Just log to stderr unconditionally, like other similar code does.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  block/vvfat.c |    5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/block/vvfat.c b/block/vvfat.c
> index 70176b1..ea37023 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -1082,11 +1082,6 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
>      vvv = s;
>  #endif
>  
> -DLOG(if (stderr == NULL) {
> -    stderr = fopen("vvfat.log", "a");
> -    setbuf(stderr, NULL);
> -})
> -
>      opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
>      qemu_opts_absorb_qdict(opts, options, &local_err);
>      if (local_err) {

Michael, it's fine to merge trivial block patches through your tree, but
can you please keep Stefan and me CCed anyway?

This specific patch isn't as trivial as it might look at the first
sight (in other words: it's wrong). The part that you probably missed is
that stderr isn't the real one when DEBUG is set:

    #undef stderr
    #define stderr STDERR
    FILE* stderr = NULL;

So now you have a lot of fprintf(NULL, ...), which obviously makes qemu
segfault as soon as you enable debugging for vvfat.

Kevin

