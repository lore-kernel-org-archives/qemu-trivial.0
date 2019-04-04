Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC57V-0001Mo-1f
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 12:21:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hC57T-0001Lu-0q
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 12:21:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hC57S-0001Ws-13
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 12:21:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55928)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1hC57P-0001Hm-FX; Thu, 04 Apr 2019 12:21:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C875A81DEC;
	Thu,  4 Apr 2019 16:21:33 +0000 (UTC)
Received: from work-vm (ovpn-116-113.ams2.redhat.com [10.36.116.113])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5FA519C7D;
	Thu,  4 Apr 2019 16:21:31 +0000 (UTC)
Date: Thu, 4 Apr 2019 17:21:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Like Xu <like.xu@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, like.xu@intel.com
Message-ID: <20190404162128.GF2678@work-vm>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-3-git-send-email-like.xu@linux.intel.com>
	<20190404162555.0a2267ee@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190404162555.0a2267ee@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 04 Apr 2019 16:21:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/9] cpu/topology: add
 general support for machine properties
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2019 16:21:40 -0000

* Igor Mammedov (imammedo@redhat.com) wrote:
> On Fri, 29 Mar 2019 16:48:38 +0800
> Like Xu <like.xu@linux.intel.com> wrote:
> 
> > Signed-off-by: Like Xu <like.xu@linux.intel.com>
> > ---

<snipp>

> > diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> > index e2aa57a..ae92f6e 100644
> > --- a/migration/postcopy-ram.c
> > +++ b/migration/postcopy-ram.c
> > @@ -29,6 +29,7 @@
> >  #include "sysemu/balloon.h"
> >  #include "qemu/error-report.h"
> >  #include "trace.h"
> > +#include "hw/boards.h"
> >  
> >  /* Arbitrary limit on size of each discard command,
> >   * keeps them around ~200 bytes
> > @@ -128,6 +129,8 @@ static void migration_exit_cb(Notifier *n, void *data)
> >  
> >  static struct PostcopyBlocktimeContext *blocktime_context_new(void)
> >  {
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> > +    unsigned int smp_cpus = ms->topo.smp_cpus;
> >      PostcopyBlocktimeContext *ctx = g_new0(PostcopyBlocktimeContext, 1);
> >      ctx->page_fault_vcpu_time = g_new0(uint32_t, smp_cpus);
> >      ctx->vcpu_addr = g_new0(uintptr_t, smp_cpus);
> > @@ -141,6 +144,8 @@ static struct PostcopyBlocktimeContext *blocktime_context_new(void)
> >  
> >  static uint32List *get_vcpu_blocktime_list(PostcopyBlocktimeContext *ctx)
> >  {
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> > +    unsigned int smp_cpus = ms->topo.smp_cpus;
> >      uint32List *list = NULL, *entry = NULL;
> >      int i;
> >  
> > @@ -806,8 +811,10 @@ static void mark_postcopy_blocktime_begin(uintptr_t addr, uint32_t ptid,
> >  static void mark_postcopy_blocktime_end(uintptr_t addr)
> >  {
> >      MigrationIncomingState *mis = migration_incoming_get_current();
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> >      PostcopyBlocktimeContext *dc = mis->blocktime_ctx;
> >      int i, affected_cpu = 0;
> > +    unsigned int smp_cpus = ms->topo.smp_cpus;
> >      bool vcpu_total_blocktime = false;
> >      uint32_t read_vcpu_time, low_time_offset;
> 
> I don't know enough about migration to say some thing useful here,
> CCin David for comments.

I think that's OK; we just need to know the total number of vcpus; this
thing calculates some stats based on the number of the vCPUs that are
blocked by postcopy page waits, and in particular if everyone is
blocked.

(I'd slightly prefer macs there rather than ms, just because we tend to
use ms in migration for MigrationState sometimes, but not always).

Dave

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

