Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YZ0I4-0007je-U9
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2015 13:00:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YZ0Hz-0007b5-MA
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 13:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YZ0Hv-0007kE-2v
	for qemu-trivial@nongnu.org; Fri, 20 Mar 2015 13:00:51 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=56025
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YZ0Hn-0007fP-AN; Fri, 20 Mar 2015 13:00:39 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2637D1180F74; Fri, 20 Mar 2015 18:00:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 6rRgXYh4e0DJ; Fri, 20 Mar 2015 18:00:25 +0100 (CET)
Received: from [192.168.178.24] (p54AC83B6.dip0.t-ipconnect.de
	[84.172.131.182])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	C8DF31180041; Fri, 20 Mar 2015 18:00:25 +0100 (CET)
Message-ID: <550C5229.9030108@weilnetz.de>
Date: Fri, 20 Mar 2015 18:00:25 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1426869044-21338-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1426869044-21338-1-git-send-email-eblake@redhat.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [for-2.3 PATCH v2] gitignore:
	Ignore more .pod files.
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
X-List-Received-Date: Fri, 20 Mar 2015 17:00:55 -0000

Am 20.03.2015 um 17:30 schrieb Eric Blake:
> kvm_stat.{1,pod} started showing up as untracked files in my
> directory, and I nearly accidentally merged them into a commit
> with my usual habit of 'git add .'.  Rather than spelling out
> each such file, just ignore the entire pattern.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> CC: qemu-trivial@nongnu.org
> ---
>
> v2: fix man page pattern
>
>   .gitignore | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index e32a584..aed0e1f 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -37,14 +37,8 @@
>   /qemu-tech.html
>   /qemu-doc.info
>   /qemu-tech.info
> -/qemu.1
> -/qemu.pod
> -/qemu-img.1
> -/qemu-img.pod
>   /qemu-img
>   /qemu-nbd
> -/qemu-nbd.8
> -/qemu-nbd.pod
>   /qemu-options.def
>   /qemu-options.texi
>   /qemu-img-cmds.texi
> @@ -56,8 +50,7 @@
>   /qmp-commands.txt
>   /vscclient
>   /fsdev/virtfs-proxy-helper
> -/fsdev/virtfs-proxy-helper.1
> -/fsdev/virtfs-proxy-helper.pod
> +*.[1-9]
>   *.a
>   *.aux
>   *.cp
> @@ -70,6 +63,7 @@
>   *.ky
>   *.log
>   *.pdf
> +*.pod
>   *.cps
>   *.fns
>   *.kys

Reviewed-by: Stefan Weil <sw@weilnetz.de>

What about only supporting out-of-tree builds for future versions of QEMU?
.gitignore could be reduced to a few lines then.


