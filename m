Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXqUa-00049K-IQ
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jun 2018 12:06:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXqUX-00046f-It
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 12:06:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXqUW-00082n-KC
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 12:06:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48140)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fXqUS-00080V-3h; Tue, 26 Jun 2018 12:06:48 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com
	[10.5.11.26])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B8D13082A4C;
	Tue, 26 Jun 2018 16:06:47 +0000 (UTC)
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5FC43083331;
	Tue, 26 Jun 2018 16:06:25 +0000 (UTC)
Date: Tue, 26 Jun 2018 13:06:23 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhang.zhanghailiang@huawei.com, Ben Warren <ben@skyportsystems.com>,
	qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20180626160623.GT7451@localhost.localdomain>
References: <20180622193522.GI7451@localhost.localdomain>
	<743d495e-51cd-8c8e-293e-026b8dece74a@redhat.com>
	<87lgb3xsv8.fsf@dusky.pond.sub.org>
	<4292432f-5f26-6925-4c14-ad1370e36e5b@redhat.com>
	<20180625173056.GM7451@localhost.localdomain>
	<97504b42-9ebe-45c5-6ff3-b43102c8374a@redhat.com>
	<20180625195126.GN7451@localhost.localdomain>
	<a931e759-879b-6f6b-3524-4b5a78fed323@redhat.com>
	<20180626122908.GQ7451@localhost.localdomain>
	<577768c0-5205-2fb4-209f-845332fe158d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <577768c0-5205-2fb4-209f-845332fe158d@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 26 Jun 2018 16:06:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 26 Jun 2018 16:06:54 -0000

On Tue, Jun 26, 2018 at 03:05:33PM +0200, Paolo Bonzini wrote:
> On 26/06/2018 14:29, Eduardo Habkost wrote:
> > On Tue, Jun 26, 2018 at 07:57:18AM +0200, Paolo Bonzini wrote:
> >> On 25/06/2018 21:51, Eduardo Habkost wrote:
> >>> In either case, I'm not arguing (yet) for changing the default
> >>> upstream.  I'm just arguing for upstream QEMU to not make any
> >>> promises about the default.
> >>
> >> It would be a guest ABI breakage for TCG guests, so it would only apply
> >> to new machine types.  I don't think it's worth the complication.
> > 
> > That's exactly the point: I want to stop promising a stable guest
> > ABI when the accelerator is omitted, because I see no benefit in
> > wasting energy on this.
> 
> On the other hand I see no benefit in changing a default that people are
> obviously not using (since most people use KVM, not TCG).  Distros will
> keep shipping, and people will keep using qemu-kvm even if we change the
> default.

Not changing the default is different from promising we will keep
ABI compatibility if the accelerator is omitted.  I just want to
get rid of the latter.


> > (I don't think we ever kept the guest ABI correctly with TCG, by
> > the way.)
> 
> It would not be any different from KVM.  Less tested and likely to be
> more buggy, yes, but not particularly harder.

We can keep trying to not break it when "-accel tcg" is
explicitly provided.

-- 
Eduardo

