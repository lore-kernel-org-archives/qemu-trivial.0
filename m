Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UDWnl-0004Am-UE
	for mharc-qemu-trivial@gnu.org; Thu, 07 Mar 2013 04:07:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UDWnj-00047A-9q
	for qemu-trivial@nongnu.org; Thu, 07 Mar 2013 04:07:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1UDWnh-0002aK-SE
	for qemu-trivial@nongnu.org; Thu, 07 Mar 2013 04:07:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34752)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1UDWnd-0002ZR-Pz; Thu, 07 Mar 2013 04:07:41 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2795fjk012904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 7 Mar 2013 04:05:41 -0500
Received: from blackfin.pond.sub.org (ovpn-116-77.ams2.redhat.com
	[10.36.116.77])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2795edX022698; Thu, 7 Mar 2013 04:05:41 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EF916200B0; Thu,  7 Mar 2013 10:05:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Lei Li <lilei@linux.vnet.ibm.com>
References: <1362642626-22763-1-git-send-email-lilei@linux.vnet.ibm.com>
Date: Thu, 07 Mar 2013 10:05:39 +0100
In-Reply-To: <1362642626-22763-1-git-send-email-lilei@linux.vnet.ibm.com> (Lei
	Li's message of "Thu, 7 Mar 2013 15:50:26 +0800")
Message-ID: <87boavo9zw.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix the wrong description
	in qemu manual
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
X-List-Received-Date: Thu, 07 Mar 2013 09:07:48 -0000

Copying qemu-trivial.

Lei Li <lilei@linux.vnet.ibm.com> writes:

> Fix LP#1151450 the wrong description in qemu manual:
>
> 'qemu-system-x86_84' should be 'qemu-system-x86_64'.
>
> Signed-off-by: Lei Li <lilei@linux.vnet.ibm.com>
> ---
>  qemu-options.hx |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 6f9334a..cd76f2a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2132,7 +2132,7 @@
> gluster[+transport]://[server[:port]]/volname/image[?socket=...]
>  
>  Example
>  @example
> -qemu-system-x86_84 --drive file=gluster://192.0.2.1/testvol/a.img
> +qemu-system-x86_64 --drive file=gluster://192.0.2.1/testvol/a.img
>  @end example
>  
>  See also @url{http://www.gluster.org}.

