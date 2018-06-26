Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXn5z-0007WJ-AD
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jun 2018 08:29:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXn5x-0007UO-IC
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 08:29:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXn5w-0002Ii-RQ
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 08:29:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47040)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fXn5s-0002Gw-LW; Tue, 26 Jun 2018 08:29:12 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBCAD308213A;
	Tue, 26 Jun 2018 12:29:11 +0000 (UTC)
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E3F11001642;
	Tue, 26 Jun 2018 12:29:09 +0000 (UTC)
Date: Tue, 26 Jun 2018 09:29:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhang.zhanghailiang@huawei.com, Ben Warren <ben@skyportsystems.com>,
	qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20180626122908.GQ7451@localhost.localdomain>
References: <20180622181108.GY7451@localhost.localdomain>
	<c10c2ffa-7ee2-5106-07d1-528df939d6ad@redhat.com>
	<20180622193522.GI7451@localhost.localdomain>
	<743d495e-51cd-8c8e-293e-026b8dece74a@redhat.com>
	<87lgb3xsv8.fsf@dusky.pond.sub.org>
	<4292432f-5f26-6925-4c14-ad1370e36e5b@redhat.com>
	<20180625173056.GM7451@localhost.localdomain>
	<97504b42-9ebe-45c5-6ff3-b43102c8374a@redhat.com>
	<20180625195126.GN7451@localhost.localdomain>
	<a931e759-879b-6f6b-3524-4b5a78fed323@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a931e759-879b-6f6b-3524-4b5a78fed323@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 26 Jun 2018 12:29:11 +0000 (UTC)
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
X-List-Received-Date: Tue, 26 Jun 2018 12:29:18 -0000

On Tue, Jun 26, 2018 at 07:57:18AM +0200, Paolo Bonzini wrote:
> On 25/06/2018 21:51, Eduardo Habkost wrote:
> > In either case, I'm not arguing (yet) for changing the default
> > upstream.  I'm just arguing for upstream QEMU to not make any
> > promises about the default.
> 
> It would be a guest ABI breakage for TCG guests, so it would only apply
> to new machine types.  I don't think it's worth the complication.

That's exactly the point: I want to stop promising a stable guest
ABI when the accelerator is omitted, because I see no benefit in
wasting energy on this.

(I don't think we ever kept the guest ABI correctly with TCG, by
the way.)


> 
> BTW, another thing that needs documenting is ABI promises for HAX and
> WHPX.  [...]

Absolutely.

-- 
Eduardo

