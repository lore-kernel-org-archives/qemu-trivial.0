Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJJqa-0002gv-UN
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 09:21:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dJJqY-0002ff-O2
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 09:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dJJqY-0001aO-1B
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 09:21:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36500)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dJJqT-0001ZZ-M2; Fri, 09 Jun 2017 09:20:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12256C057FAF;
	Fri,  9 Jun 2017 13:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 12256C057FAF
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 12256C057FAF
Received: from localhost (ovpn-116-27.gru2.redhat.com [10.97.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7548318793;
	Fri,  9 Jun 2017 13:20:55 +0000 (UTC)
Date: Fri, 9 Jun 2017 10:20:53 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
Message-ID: <20170609132053.GM5016@thinpad.lan.raisama.net>
References: <1496927934-21815-1-git-send-email-thuth@redhat.com>
	<871squblsp.fsf@secure.mitica>
	<20170609020338.GC26521@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170609020338.GC26521@umbus.fritz.box>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 09 Jun 2017 13:20:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/cpu: core.c can be compiled as common
 object
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
X-List-Received-Date: Fri, 09 Jun 2017 13:21:03 -0000

On Fri, Jun 09, 2017 at 12:03:38PM +1000, David Gibson wrote:
> On Thu, Jun 08, 2017 at 04:23:34PM +0200, Juan Quintela wrote:
> > Thomas Huth <thuth@redhat.com> wrote:
> > > There does not seem to be any target specific code in core.c, so we can
> > > put it into "common-obj" instead of "obj" to compile it only once for
> > > all targets.
> > >
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > 
> > It compiles.
> > I can't see anything that is target dependent on core.c.
> > 
> > So
> > 
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> I've merged this into my ppc-for-2.10 tree, on the basis that ppc is
> the only user of core.c so far.  Any objections?

No problem to me.  If you want, you can add my:

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo

