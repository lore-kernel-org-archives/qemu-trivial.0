Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLGyJ-0004wt-G5
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 14:59:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YLGyH-0004rV-2Q
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:59:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YLGyD-0001Hf-TI
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:59:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55646)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1YLGyD-0001HV-Mb; Tue, 10 Feb 2015 14:59:41 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1AJxeEs023648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Feb 2015 14:59:40 -0500
Received: from work-vm (ovpn-116-108.ams2.redhat.com [10.36.116.108])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1AJxaDs007063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Tue, 10 Feb 2015 14:59:38 -0500
Date: Tue, 10 Feb 2015 19:59:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150210195935.GI2376@work-vm>
References: <1423597526-18483-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423597526-18483-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-options: fix/document -incoming
	options
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
X-List-Received-Date: Tue, 10 Feb 2015 19:59:46 -0000

* Michael Tokarev (mjt@tls.msk.ru) wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  qemu-options.hx | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ee4b223..a2c071a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3195,12 +3195,30 @@ Set TB size.
>  ETEXI
>  
>  DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
> -    "-incoming p     prepare for incoming migration, listen on port p\n",
> +    "-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
> +    "-incoming rdma:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
> +    "-incoming unix:socketpath\n" \
> +    "                prepare for incoming migration, listen on\n" \
> +    "                specified protocol and socket address\n" \
> +    "-incoming fd:fd\n" \
> +    "-incoming exec:cmdline\n" \
> +    "                accept incoming migration on given file descriptor\n" \
> +    "                or from given external command\n",
>      QEMU_ARCH_ALL)
>  STEXI
> -@item -incoming @var{port}
> +@item -incoming tcp:[@var{host}]:@var{port}[,to=@var{maxport}][,ipv4][,ipv6]
> +@item -incoming rdma:[@var{host}]:@var{port}[,to=@var{maxport}][,ipv4][,ipv6]
>  @findex -incoming
> -Prepare for incoming migration, listen on @var{port}.
> +Prepare for incoming migration, listen on a given tcp port.

I'm not convinced the RDMA code can handle the to= option, it parses it
but if you try and start two things on the same port it errors.
I also think that the bind address is a required for the RDMA code.

Dave

> +
> +@item -incoming unix:@var{socketpath}
> +Prepare for incoming migration, listen on a given unix socket.
> +
> +@item -incoming fd:@var{fd}
> +Accept incoming migration from a given filedescriptor.
> +
> +@item -incoming exec:@var{cmdline}
> +Accept incoming migration as an output from specified external command.
>  ETEXI
>  
>  DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
> -- 
> 2.1.4
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

