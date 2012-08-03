Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SxHPL-0004dA-UQ
	for mharc-qemu-trivial@gnu.org; Fri, 03 Aug 2012 08:55:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1SxHPF-0004Ky-WA
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 08:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1SxHPF-0007dR-9k
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 08:55:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1SxHP5-0007RG-J6; Fri, 03 Aug 2012 08:54:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q73CsrBX013012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 3 Aug 2012 08:54:54 -0400
Received: from doriath.home (ovpn-113-120.phx2.redhat.com [10.3.113.120])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q73Csp86028445; Fri, 3 Aug 2012 08:54:52 -0400
Date: Fri, 3 Aug 2012 09:55:30 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Amos Kong <akong@redhat.com>
Message-ID: <20120803095530.02c22d7e@doriath.home>
In-Reply-To: <1343963182-28297-3-git-send-email-akong@redhat.com>
References: <1343963182-28297-1-git-send-email-akong@redhat.com>
	<1343963182-28297-3-git-send-email-akong@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/2] socket: clean up
 redundant assignment
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
X-List-Received-Date: Fri, 03 Aug 2012 12:55:10 -0000

On Fri,  3 Aug 2012 11:06:22 +0800
Amos Kong <akong@redhat.com> wrote:

> Signed-off-by: Amos Kong <akong@redhat.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  qemu-sockets.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/qemu-sockets.c b/qemu-sockets.c
> index 668fa93..beb2bb6 100644
> --- a/qemu-sockets.c
> +++ b/qemu-sockets.c
> @@ -284,7 +284,6 @@ int inet_connect_opts(QemuOpts *opts, Error **errp)
>                          inet_strfamily(e->ai_family),
>                          e->ai_canonname, uaddr, uport, strerror(errno));
>              closesocket(sock);
> -            sock = -1;
>              continue;
>          }
>          freeaddrinfo(res);


