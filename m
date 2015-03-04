Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT8Ek-0008KB-SZ
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 07:17:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YT8Ef-0008DA-95
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 07:17:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YT8Ee-0000Ma-6r
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 07:17:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1YT8EZ-0000Ki-As; Wed, 04 Mar 2015 07:17:03 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t24CH0Yq031598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Mar 2015 07:17:01 -0500
Received: from work-vm (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t24CGtV9024163
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Wed, 4 Mar 2015 07:16:59 -0500
Date: Wed, 4 Mar 2015 12:16:55 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150304121654.GC2530@work-vm>
References: <1424073025-13262-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1424073025-13262-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration/rdma: clean up
 qemu_rdma_dest_init a bit
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
X-List-Received-Date: Wed, 04 Mar 2015 12:17:14 -0000

* Michael Tokarev (mjt@tls.msk.ru) wrote:
> Do not check for rdma->host being empty twice.  This removes a large
> "if" block, so code indentation is changed.  While at it, remove an
> ugly goto from the loop, replacing it with a cleaner if logic.  And
> finally, there's no need to initialize `ret' variable since is always
> has a value.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Juan/Amit: There's a space at the end of a line that got in, so
           that just needs fixing in the merge;  it's after the 'break;'
but the patch is a big improvement on what's there:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

also tested on an RDMA system.

Thanks,

Dave

> ---
>  migration/rdma.c | 51 ++++++++++++++++++++++-----------------------------
>  1 file changed, 22 insertions(+), 29 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 6bee30c..76af724 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2366,10 +2366,10 @@ err_rdma_source_connect:
>  
>  static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>  {
> -    int ret = -EINVAL, idx;
> +    int ret, idx;
>      struct rdma_cm_id *listen_id;
>      char ip[40] = "unknown";
> -    struct rdma_addrinfo *res;
> +    struct rdma_addrinfo *res, *e;
>      char port_str[16];
>  
>      for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
> @@ -2377,7 +2377,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>          rdma->wr_data[idx].control_curr = NULL;
>      }
>  
> -    if (rdma->host == NULL) {
> +    if (!rdma->host || !rdma->host[0]) {
>          ERROR(errp, "RDMA host is not set!");
>          rdma->error_state = -EINVAL;
>          return -1;
> @@ -2400,40 +2400,33 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>      snprintf(port_str, 16, "%d", rdma->port);
>      port_str[15] = '\0';
>  
> -    if (rdma->host && strcmp("", rdma->host)) {
> -        struct rdma_addrinfo *e;
> +    ret = rdma_getaddrinfo(rdma->host, port_str, NULL, &res);
> +    if (ret < 0) {
> +        ERROR(errp, "could not rdma_getaddrinfo address %s", rdma->host);
> +        goto err_dest_init_bind_addr;
> +    }
>  
> -        ret = rdma_getaddrinfo(rdma->host, port_str, NULL, &res);
> -        if (ret < 0) {
> -            ERROR(errp, "could not rdma_getaddrinfo address %s", rdma->host);
> -            goto err_dest_init_bind_addr;
> +    for (e = res; e != NULL; e = e->ai_next) {
> +        inet_ntop(e->ai_family,
> +            &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
> +        trace_qemu_rdma_dest_init_trying(rdma->host, ip);
> +        ret = rdma_bind_addr(listen_id, e->ai_dst_addr);
> +        if (ret) {
> +            continue;
>          }
> -
> -        for (e = res; e != NULL; e = e->ai_next) {
> -            inet_ntop(e->ai_family,
> -                &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
> -            trace_qemu_rdma_dest_init_trying(rdma->host, ip);
> -            ret = rdma_bind_addr(listen_id, e->ai_dst_addr);
> -            if (!ret) {
> -                if (e->ai_family == AF_INET6) {
> -                    ret = qemu_rdma_broken_ipv6_kernel(errp, listen_id->verbs);
> -                    if (ret) {
> -                        continue;
> -                    }
> -                }
> -                    
> -                goto listen;
> +        if (e->ai_family == AF_INET6) {
> +            ret = qemu_rdma_broken_ipv6_kernel(errp, listen_id->verbs);
> +            if (ret) {
> +                continue;
>              }
>          }
> +        break; 
> +    }
>  
> +    if (!e) {
>          ERROR(errp, "Error: could not rdma_bind_addr!");
>          goto err_dest_init_bind_addr;
> -    } else {
> -        ERROR(errp, "migration host and port not specified!");
> -        ret = -EINVAL;
> -        goto err_dest_init_bind_addr;
>      }
> -listen:
>  
>      rdma->listen_id = listen_id;
>      qemu_rdma_dump_gid("dest_init", listen_id);
> -- 
> 2.1.4
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

