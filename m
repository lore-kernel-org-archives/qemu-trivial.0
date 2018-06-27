Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYB5E-0006dL-Cg
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 10:06:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fYB59-0006a2-DS
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:06:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fYB58-0006P4-KU
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:06:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fYB51-0006JA-H4; Wed, 27 Jun 2018 10:05:55 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com
	[10.5.11.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8132356E8;
	Wed, 27 Jun 2018 14:05:54 +0000 (UTC)
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D83E2308BDBF;
	Wed, 27 Jun 2018 14:05:43 +0000 (UTC)
Date: Wed, 27 Jun 2018 11:05:42 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhang.zhanghailiang@huawei.com, Ben Warren <ben@skyportsystems.com>,
	qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20180627140542.GC7451@localhost.localdomain>
References: <87lgb3xsv8.fsf@dusky.pond.sub.org>
	<4292432f-5f26-6925-4c14-ad1370e36e5b@redhat.com>
	<20180625173056.GM7451@localhost.localdomain>
	<97504b42-9ebe-45c5-6ff3-b43102c8374a@redhat.com>
	<20180625195126.GN7451@localhost.localdomain>
	<a931e759-879b-6f6b-3524-4b5a78fed323@redhat.com>
	<20180626122908.GQ7451@localhost.localdomain>
	<577768c0-5205-2fb4-209f-845332fe158d@redhat.com>
	<20180626160623.GT7451@localhost.localdomain>
	<a0457847-d775-9bc9-32ea-b7337504eabd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0457847-d775-9bc9-32ea-b7337504eabd@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 27 Jun 2018 14:05:54 +0000 (UTC)
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
X-List-Received-Date: Wed, 27 Jun 2018 14:06:07 -0000

On Wed, Jun 27, 2018 at 10:39:29AM +0200, Paolo Bonzini wrote:
> On 26/06/2018 18:06, Eduardo Habkost wrote:
> >> On the other hand I see no benefit in changing a default that people are
> >> obviously not using (since most people use KVM, not TCG).  Distros will
> >> keep shipping, and people will keep using qemu-kvm even if we change the
> >> default.
> >
> > Not changing the default is different from promising we will keep
> > ABI compatibility if the accelerator is omitted.  I just want to
> > get rid of the latter.
> 
> I understand; what I don't understand is why do the latter unless you
> plan to change the default.

Why should we make a compatibility promise if we don't have to?
Making and keeping promises have a cost, and I'd like us to spend
our energy elsewhere.

-- 
Eduardo

