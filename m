Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXqYN-0005j2-FR
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jun 2018 12:10:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fXqYL-0005he-4c
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 12:10:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fXqYK-0001EM-0y
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 12:10:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46360 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fXqYF-0001Bu-Qx; Tue, 26 Jun 2018 12:10:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45960401EF16;
	Tue, 26 Jun 2018 16:10:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E6F0213ED6A;
	Tue, 26 Jun 2018 16:10:40 +0000 (UTC)
Date: Tue, 26 Jun 2018 17:10:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhang.zhanghailiang@huawei.com, Ben Warren <ben@skyportsystems.com>,
	qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20180626161038.GF32319@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <743d495e-51cd-8c8e-293e-026b8dece74a@redhat.com>
	<87lgb3xsv8.fsf@dusky.pond.sub.org>
	<4292432f-5f26-6925-4c14-ad1370e36e5b@redhat.com>
	<20180625173056.GM7451@localhost.localdomain>
	<97504b42-9ebe-45c5-6ff3-b43102c8374a@redhat.com>
	<20180625195126.GN7451@localhost.localdomain>
	<a931e759-879b-6f6b-3524-4b5a78fed323@redhat.com>
	<20180626122908.GQ7451@localhost.localdomain>
	<577768c0-5205-2fb4-209f-845332fe158d@redhat.com>
	<20180626160623.GT7451@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180626160623.GT7451@localhost.localdomain>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 26 Jun 2018 16:10:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 26 Jun 2018 16:10:42 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 4/4] qemu-options: Do
 not show -enable-kvm and -enable-hax in the docs anymore
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
X-List-Received-Date: Tue, 26 Jun 2018 16:10:50 -0000

On Tue, Jun 26, 2018 at 01:06:23PM -0300, Eduardo Habkost wrote:
> On Tue, Jun 26, 2018 at 03:05:33PM +0200, Paolo Bonzini wrote:
> > On 26/06/2018 14:29, Eduardo Habkost wrote:
> > > On Tue, Jun 26, 2018 at 07:57:18AM +0200, Paolo Bonzini wrote:
> > >> On 25/06/2018 21:51, Eduardo Habkost wrote:
> > >>> In either case, I'm not arguing (yet) for changing the default
> > >>> upstream.  I'm just arguing for upstream QEMU to not make any
> > >>> promises about the default.
> > >>
> > >> It would be a guest ABI breakage for TCG guests, so it would only apply
> > >> to new machine types.  I don't think it's worth the complication.
> > > 
> > > That's exactly the point: I want to stop promising a stable guest
> > > ABI when the accelerator is omitted, because I see no benefit in
> > > wasting energy on this.
> > 
> > On the other hand I see no benefit in changing a default that people are
> > obviously not using (since most people use KVM, not TCG).  Distros will
> > keep shipping, and people will keep using qemu-kvm even if we change the
> > default.
> 
> Not changing the default is different from promising we will keep
> ABI compatibility if the accelerator is omitted.  I just want to
> get rid of the latter.

I guess the key question is what is the risk of causing problems if we
switch from tcg to kvm:tcg when accelerator is omitted ?

Based on what I've seen the likely troublespot would be people who are
using QEMU inside a guest with nested-virt enabled. Some nested-virt
impls are buggy and will cause L2 guest hangs, or worse L1 host crashes.
Then again we're not causing that brokenness - just revealing what
already exists.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

