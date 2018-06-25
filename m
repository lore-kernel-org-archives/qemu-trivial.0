Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXXWc-0007c1-QW
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 15:51:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXXWa-0007aG-54
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 15:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXXWZ-0000ye-9x
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 15:51:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42860)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fXXWT-0000uR-4R; Mon, 25 Jun 2018 15:51:37 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com
	[10.5.11.26])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2988C30832E8;
	Mon, 25 Jun 2018 19:51:36 +0000 (UTC)
Received: from localhost (ovpn-116-16.gru2.redhat.com [10.97.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4A8230001EC;
	Mon, 25 Jun 2018 19:51:27 +0000 (UTC)
Date: Mon, 25 Jun 2018 16:51:26 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhang.zhanghailiang@huawei.com, Ben Warren <ben@skyportsystems.com>,
	qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20180625195126.GN7451@localhost.localdomain>
References: <20180619171539.0adc90d6.cohuck@redhat.com>
	<d4e02083-c372-3ce5-d4a2-4809579fc8f2@redhat.com>
	<20180622181108.GY7451@localhost.localdomain>
	<c10c2ffa-7ee2-5106-07d1-528df939d6ad@redhat.com>
	<20180622193522.GI7451@localhost.localdomain>
	<743d495e-51cd-8c8e-293e-026b8dece74a@redhat.com>
	<87lgb3xsv8.fsf@dusky.pond.sub.org>
	<4292432f-5f26-6925-4c14-ad1370e36e5b@redhat.com>
	<20180625173056.GM7451@localhost.localdomain>
	<97504b42-9ebe-45c5-6ff3-b43102c8374a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97504b42-9ebe-45c5-6ff3-b43102c8374a@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 25 Jun 2018 19:51:36 +0000 (UTC)
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
X-List-Received-Date: Mon, 25 Jun 2018 19:51:45 -0000

On Mon, Jun 25, 2018 at 08:26:28PM +0200, Paolo Bonzini wrote:
> On 25/06/2018 19:30, Eduardo Habkost wrote:
> >>> Attentive distros could even replace the wrapper script by a link.
> >> If they are okay with replacing the "KVM only" semantics with "KVM or
> >> TCG", which I think is generally worse.
> >
> > If we can't get agreement on what's the right default for each
> > QEMU binary, I think that's yet another reason to document that
> > upstream QEMU won't guarantee ABI compatibility if -accel is
> > omitted.
> 
> Before that we should ask what the benefit is in changing the default
> for qemu-system-*.  Nobody is using it in practice to start QEMU with
> KVM enabled...

How can you be sure?  If qemu-system-* is installed with KVM
compiled in, libvirt will probe it using
"-machine none,accel=kvm:tcg" and run the VM using
"-machine $MACHINE,accel=kvm".

In either case, I'm not arguing (yet) for changing the default
upstream.  I'm just arguing for upstream QEMU to not make any
promises about the default.

-- 
Eduardo

