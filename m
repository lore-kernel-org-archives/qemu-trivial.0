Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WglPK-00066q-W3
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 21:39:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WglPF-0005xI-4F
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 21:39:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WglPA-0007SK-6d
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 21:39:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1WglOz-0007Qb-Q6; Sat, 03 May 2014 21:39:37 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s441dZVh029577
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 3 May 2014 21:39:35 -0400
Received: from localhost (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s441dWll006914; Sat, 3 May 2014 21:39:34 -0400
Date: Sun, 4 May 2014 09:39:45 +0800
From: Fam Zheng <famz@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140504013945.GC1124@T430.nay.redhat.com>
References: <1399030869-23399-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1399030869-23399-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: remove bashism
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
X-List-Received-Date: Sun, 04 May 2014 01:39:58 -0000

On Fri, 05/02 15:41, Michael Tokarev wrote:
> Commit e26110cfc67d48 added a check for shacmd to create a hash
> for modules.  This check in configure is using bash construct &>
> to redirect both stdout and stderr, whcih does fun things on some

s/whcih/which

> shells.  Get rid of it, use standard redirection instead.
> 
> Cc: Fam Zheng <famz@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 2fbec59..7442790 100755
> --- a/configure
> +++ b/configure
> @@ -2627,7 +2627,7 @@ done
>  if test "$modules" = yes; then
>      shacmd_probe="sha1sum sha1 shasum"
>      for c in $shacmd_probe; do
> -        if which $c &>/dev/null; then
> +        if which $c >/dev/null 2>&1; then
>              shacmd="$c"
>              break
>          fi
> -- 
> 1.7.10.4
> 

Thanks. With the typo in commit message fixed,

Reviewed-by: Fam Zheng <famz@redhat.com>

