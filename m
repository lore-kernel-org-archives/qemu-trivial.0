Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMMgT-0005de-Bb
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2019 21:08:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hMMgQ-0005Zy-Gi
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 21:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hMMgM-000404-PN
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 21:08:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hMMgK-0003yB-FK; Thu, 02 May 2019 21:08:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6125FC057E37;
	Fri,  3 May 2019 01:08:07 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD2D15D9C4;
	Fri,  3 May 2019 01:08:06 +0000 (UTC)
Date: Thu, 2 May 2019 22:08:04 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Like Xu <like.xu@linux.intel.com>, qemu-trivial@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, like.xu@intel.com,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190503010804.GQ28722@habkost.net>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-3-git-send-email-like.xu@linux.intel.com>
	<20190404162555.0a2267ee@redhat.com>
	<a765e3ac-45e6-310e-aa66-7036b5717a26@linux.intel.com>
	<20190502170928.001c01df@Igors-MacBook-Pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502170928.001c01df@Igors-MacBook-Pro>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 03 May 2019 01:08:07 +0000 (UTC)
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
X-List-Received-Date: Fri, 03 May 2019 01:08:15 -0000

On Thu, May 02, 2019 at 05:09:28PM +0200, Igor Mammedov wrote:
> On Tue, 30 Apr 2019 15:30:31 +0800
> Like Xu <like.xu@linux.intel.com> wrote:
> 
> > On 2019/4/4 22:25, Igor Mammedov wrote:
> > > On Fri, 29 Mar 2019 16:48:38 +0800
> > > Like Xu <like.xu@linux.intel.com> wrote:
> > > 
> 
> [...]
> 
> > 
> > The division of responsibility for this case (refactoring 
> > qemu_init_vcpu) seems to be a poisonous apple.
> > 
> > The prerequisite for setting cpu-> nr_cores / nr_threads from the parent 
> > is that the CPU has been created, so if any process during 
> > initialization needs this topo information, it will use the default 
> > values form cpu_common_initfn() instead of user-configured parameters.
> 
> can you point to concrete place that needs access to nr_cores / nr_threads
> before cpu is 'realized'?

We have very few architectures actually using
nr_cores/nr_threads/smp_cores/smp_threads.  I think those
variables are used only on x86, ppc, and mips.

I believe I suggested some time ago that we should get rid of the
nr_cores/nr_threads CPUState fields and move them to
arch-specific types.  This would help us avoid confusion when
different architectures have different semantics for
nr_cores/nr_threads.

See https://www.mail-archive.com/qemu-devel@nongnu.org/msg587105.html
("[Qemu-devel] Meaning of '-smp threads' on mips_malta") for one
example of confusing arch-specific semantics.

-- 
Eduardo

