Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT8f9-0001vy-MY
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 07:44:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YT8f3-0001qN-Ua
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 07:44:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YT8ez-0002Rj-Cr
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 07:44:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1YT8ez-0002RU-5E; Wed, 04 Mar 2015 07:44:21 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t24CiI6T012869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Mar 2015 07:44:19 -0500
Received: from work-vm (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t24CiFJ9023305
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Wed, 4 Mar 2015 07:44:17 -0500
Date: Wed, 4 Mar 2015 12:44:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20150304124414.GE2530@work-vm>
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
	<1425146983-16015-3-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425146983-16015-3-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	QEMU Developer <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] migration: Fix some 32
 bit compiler errors
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
X-List-Received-Date: Wed, 04 Mar 2015 12:44:30 -0000

* Stefan Weil (sw@weilnetz.de) wrote:
> The current code won't compile on 32 bit hosts because there are lots
> of type casts between pointers and 64 bit integers.
> 
> Fix some of them.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Please route rdma stuff through migration, not -trivial; it's never
trivial to read this code.

> ---
>  migration/rdma.c |   23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 67c5701..1512460 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1104,7 +1104,7 @@ static int qemu_rdma_search_ram_block(RDMAContext *rdma,
>   * to perform the actual RDMA operation.
>   */
>  static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
> -        RDMALocalBlock *block, uint8_t *host_addr,
> +        RDMALocalBlock *block, uintptr_t host_addr,
>          uint32_t *lkey, uint32_t *rkey, int chunk,
>          uint8_t *chunk_start, uint8_t *chunk_end)

OK, so 'host_addr' seems to only be used in this function to print debug,
so that should be harmless.

>  {
> @@ -1141,11 +1141,12 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
>          if (!block->pmr[chunk]) {
>              perror("Failed to register chunk!");
>              fprintf(stderr, "Chunk details: block: %d chunk index %d"
> -                            " start %" PRIu64 " end %" PRIu64 " host %" PRIu64
> -                            " local %" PRIu64 " registrations: %d\n",
> -                            block->index, chunk, (uint64_t) chunk_start,
> -                            (uint64_t) chunk_end, (uint64_t) host_addr,
> -                            (uint64_t) block->local_host_addr,
> +                            " start %" PRIuPTR " end %" PRIuPTR
> +                            " host %" PRIuPTR
> +                            " local %" PRIuPTR " registrations: %d\n",
> +                            block->index, chunk, (uintptr_t)chunk_start,
> +                            (uintptr_t)chunk_end, host_addr,
> +                            (uintptr_t)block->local_host_addr,

OK, although is there any reason not to use %p for most of those?

>                              rdma->total_registrations);
>              return -1;
>          }
> @@ -1932,8 +1933,7 @@ retry:
>              }
>  
>              /* try to overlap this single registration with the one we sent. */
> -            if (qemu_rdma_register_and_get_keys(rdma, block,
> -                                                (uint8_t *) sge.addr,
> +            if (qemu_rdma_register_and_get_keys(rdma, block, sge.addr,
>                                                  &sge.lkey, NULL, chunk,
>                                                  chunk_start, chunk_end)) {

sge.addr comes from /usr/include/infiniband/verbs.h for me:

struct ibv_sge {
        uint64_t                addr;
        uint32_t                length;
        uint32_t                lkey;
};

and that's the same on both 32 bit and 64 bit hosts (Fedora 21).
I'm confused about why this helps you build 32 bit, since that uint64_t gets
passed to your host_addr that's now a unitptr_t that will be 32bit.

Dave

>                  error_report("cannot get lkey");
> @@ -1952,8 +1952,7 @@ retry:
>              block->remote_host_addr = reg_result->host_addr;
>          } else {
>              /* already registered before */
> -            if (qemu_rdma_register_and_get_keys(rdma, block,
> -                                                (uint8_t *)sge.addr,
> +            if (qemu_rdma_register_and_get_keys(rdma, block, sge.addr,
>                                                  &sge.lkey, NULL, chunk,
>                                                  chunk_start, chunk_end)) {
>                  error_report("cannot get lkey!");
> @@ -1965,7 +1964,7 @@ retry:
>      } else {
>          send_wr.wr.rdma.rkey = block->remote_rkey;
>  
> -        if (qemu_rdma_register_and_get_keys(rdma, block, (uint8_t *)sge.addr,
> +        if (qemu_rdma_register_and_get_keys(rdma, block, sge.addr,
>                                                       &sge.lkey, NULL, chunk,
>                                                       chunk_start, chunk_end)) {
>              error_report("cannot get lkey!");
> @@ -3036,7 +3035,7 @@ static int qemu_rdma_registration_handle(QEMUFile *f, void *opaque,
>                  chunk_start = ram_chunk_start(block, chunk);
>                  chunk_end = ram_chunk_end(block, chunk + reg->chunks);
>                  if (qemu_rdma_register_and_get_keys(rdma, block,
> -                            (uint8_t *)host_addr, NULL, &reg_result->rkey,
> +                            (uintptr_t)host_addr, NULL, &reg_result->rkey,
>                              chunk, chunk_start, chunk_end)) {
>                      error_report("cannot get rkey");
>                      ret = -EINVAL;
> -- 
> 1.7.10.4
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

