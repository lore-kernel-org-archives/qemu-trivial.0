Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBLoZ-0005tj-1p
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 05:31:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VBLoS-0005tO-2i
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 05:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VBLoM-0004ED-6w
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 05:31:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VBLoL-0004E5-Ug; Mon, 19 Aug 2013 05:31:42 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7J9VeZs003156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 19 Aug 2013 05:31:40 -0400
Received: from yakj.usersys.redhat.com (dhcp-176-211.mxp.redhat.com
	[10.32.176.211])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r7J9Vbb5027713; Mon, 19 Aug 2013 05:31:37 -0400
Message-ID: <5211E5D2.9060903@redhat.com>
Date: Mon, 19 Aug 2013 11:30:58 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: mrhines@linux.vnet.ibm.com
References: <1376879228-32505-1-git-send-email-mrhines@linux.vnet.ibm.com>
In-Reply-To: <1376879228-32505-1-git-send-email-mrhines@linux.vnet.ibm.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: yamahata@private.email.ne.jp, aliguori@us.ibm.com, quintela@redhat.com,
	qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	owasserm@redhat.com, mrhines@us.ibm.com
Subject: Re: [Qemu-trivial] [PATCH for-1.6] rdma: silly ipv6 bugfix
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
X-List-Received-Date: Mon, 19 Aug 2013 09:31:54 -0000

Il 19/08/2013 04:27, mrhines@linux.vnet.ibm.com ha scritto:
> From: "Michael R. Hines" <mrhines@us.ibm.com>
> 
> My bad - but it's very important for us to warn the user that
> IPv6 is broken on RoCE in linux right now, until linux releases
> a fixed version.

1.6 has sailed already, so the right thing to do now is to add a

Cc: qemu-stable@nongnu.org

tag before Signed-off-by.  This will ensure that the patch will be
considered for 1.6.1.

I have already CCed the mailing list on this message, so there is
nothing you need to do for this particular patch.

Paolo

> Signed-off-by: Michael R. Hines <mrhines@us.ibm.com>
> ---
>  migration-rdma.c |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/migration-rdma.c b/migration-rdma.c
> index 3d1266f..f5e75d6 100644
> --- a/migration-rdma.c
> +++ b/migration-rdma.c
> @@ -920,9 +920,11 @@ static int qemu_rdma_resolve_host(RDMAContext *rdma, Error **errp)
>          ret = rdma_resolve_addr(rdma->cm_id, NULL, e->ai_dst_addr,
>                  RDMA_RESOLVE_TIMEOUT_MS);
>          if (!ret) {
> -            ret = qemu_rdma_broken_ipv6_kernel(errp, rdma->cm_id->verbs);
> -            if (ret) {
> -                continue;
> +            if (e->ai_family == AF_INET6) {
> +                ret = qemu_rdma_broken_ipv6_kernel(errp, rdma->cm_id->verbs);
> +                if (ret) {
> +                    continue;
> +                }
>              }
>              goto route;
>          }
> 


