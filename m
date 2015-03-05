Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTT19-00049y-CQ
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2015 05:28:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YTT17-00047h-JN
	for qemu-trivial@nongnu.org; Thu, 05 Mar 2015 05:28:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YTT14-0008D2-Ac
	for qemu-trivial@nongnu.org; Thu, 05 Mar 2015 05:28:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1YTT14-0008Ck-3U; Thu, 05 Mar 2015 05:28:30 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t25ASTqJ024717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 5 Mar 2015 05:28:29 -0500
Received: from work-vm (ovpn-116-95.ams2.redhat.com [10.36.116.95])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t25ASP4S027719
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Thu, 5 Mar 2015 05:28:27 -0500
Date: Thu, 5 Mar 2015 10:28:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20150305102824.GD2381@work-vm>
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
	<1425146983-16015-3-git-send-email-sw@weilnetz.de>
	<20150304124414.GE2530@work-vm> <54F77253.5070607@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54F77253.5070607@weilnetz.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
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
X-List-Received-Date: Thu, 05 Mar 2015 10:28:34 -0000

* Stefan Weil (sw@weilnetz.de) wrote:
> Am 04.03.2015 um 13:44 schrieb Dr. David Alan Gilbert:
> >* Stefan Weil (sw@weilnetz.de) wrote:
> >>The current code won't compile on 32 bit hosts because there are lots
> >>of type casts between pointers and 64 bit integers.
> >>
> >>Fix some of them.
> >>
> >>Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >Please route rdma stuff through migration, not -trivial; it's never
> >trivial to read this code.
> 
> IMHO the modifications here are trivial transformations, but I agree that
> other people might have a different view. Patch 3 is less trivial (as I
> wrote in my initial mail).
> 
> >
> >>---
> >>  migration/rdma.c |   23 +++++++++++------------
> >>  1 file changed, 11 insertions(+), 12 deletions(-)
> >>
> >>diff --git a/migration/rdma.c b/migration/rdma.c
> >>index 67c5701..1512460 100644
> >>--- a/migration/rdma.c
> >>+++ b/migration/rdma.c
> >>@@ -1104,7 +1104,7 @@ static int qemu_rdma_search_ram_block(RDMAContext *rdma,
> >>   * to perform the actual RDMA operation.
> >>   */
> >>  static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
> >>-        RDMALocalBlock *block, uint8_t *host_addr,
> >>+        RDMALocalBlock *block, uintptr_t host_addr,
> >>          uint32_t *lkey, uint32_t *rkey, int chunk,
> >>          uint8_t *chunk_start, uint8_t *chunk_end)
> >OK, so 'host_addr' seems to only be used in this function to print debug,
> >so that should be harmless.
> >
> >>  {
> >>@@ -1141,11 +1141,12 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
> >>          if (!block->pmr[chunk]) {
> >>              perror("Failed to register chunk!");
> >>              fprintf(stderr, "Chunk details: block: %d chunk index %d"
> >>-                            " start %" PRIu64 " end %" PRIu64 " host %" PRIu64
> >>-                            " local %" PRIu64 " registrations: %d\n",
> >>-                            block->index, chunk, (uint64_t) chunk_start,
> >>-                            (uint64_t) chunk_end, (uint64_t) host_addr,
> >>-                            (uint64_t) block->local_host_addr,
> >>+                            " start %" PRIuPTR " end %" PRIuPTR
> >>+                            " host %" PRIuPTR
> >>+                            " local %" PRIuPTR " registrations: %d\n",
> >>+                            block->index, chunk, (uintptr_t)chunk_start,
> >>+                            (uintptr_t)chunk_end, host_addr,
> >>+                            (uintptr_t)block->local_host_addr,
> >OK, although is there any reason not to use %p for most of those?
> 
> The output of %p depends on the host's pointer size and is in hex. I don't
> know why the original author had chosen to show these values as integers.

Yes, that's fair enough; if you recut it for any reason then %p would be nice
for the local pointers.

> >>                              rdma->total_registrations);
> >>              return -1;
> >>          }
> >>@@ -1932,8 +1933,7 @@ retry:
> >>              }
> >>              /* try to overlap this single registration with the one we sent. */
> >>-            if (qemu_rdma_register_and_get_keys(rdma, block,
> >>-                                                (uint8_t *) sge.addr,
> >>+            if (qemu_rdma_register_and_get_keys(rdma, block, sge.addr,
> >>                                                  &sge.lkey, NULL, chunk,
> >>                                                  chunk_start, chunk_end)) {
> >sge.addr comes from /usr/include/infiniband/verbs.h for me:
> >
> >struct ibv_sge {
> >         uint64_t                addr;
> >         uint32_t                length;
> >         uint32_t                lkey;
> >};
> >
> >and that's the same on both 32 bit and 64 bit hosts (Fedora 21).
> >I'm confused about why this helps you build 32 bit, since that uint64_t gets
> >passed to your host_addr that's now a unitptr_t that will be 32bit.
> 
> That works because conversions between 32 and 64 bit values are no problem
> for the compiler (but maybe for the user when precision gets lost).

Yes, I was surprised you don't get a warning for truncation there, but since
you don't:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> IMHO
> it's surprising that the API in verbs.h uses uint64_t instead of uintptr_t
> for pointer values, but that's a different question.

Many things about the IB API surprise me.

Dave

> 
> Regards
> Stefan
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

