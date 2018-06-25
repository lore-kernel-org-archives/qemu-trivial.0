Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXVKa-0006zR-06
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 13:31:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXVKW-0006wu-Ut
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 13:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXVKW-0007Xu-0r
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 13:31:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fXVKR-0007SF-6A; Mon, 25 Jun 2018 13:31:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C408307D865;
	Mon, 25 Jun 2018 17:31:01 +0000 (UTC)
Received: from localhost (ovpn-116-16.gru2.redhat.com [10.97.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71D5B53B30;
	Mon, 25 Jun 2018 17:30:58 +0000 (UTC)
Date: Mon, 25 Jun 2018 14:30:56 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhang.zhanghailiang@huawei.com, Ben Warren <ben@skyportsystems.com>,
	qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20180625173056.GM7451@localhost.localdomain>
References: <20180613151942.GC19901@redhat.com>
	<87k1r24quk.fsf@dusky.pond.sub.org>
	<20180619171539.0adc90d6.cohuck@redhat.com>
	<d4e02083-c372-3ce5-d4a2-4809579fc8f2@redhat.com>
	<20180622181108.GY7451@localhost.localdomain>
	<c10c2ffa-7ee2-5106-07d1-528df939d6ad@redhat.com>
	<20180622193522.GI7451@localhost.localdomain>
	<743d495e-51cd-8c8e-293e-026b8dece74a@redhat.com>
	<87lgb3xsv8.fsf@dusky.pond.sub.org>
	<4292432f-5f26-6925-4c14-ad1370e36e5b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4292432f-5f26-6925-4c14-ad1370e36e5b@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 25 Jun 2018 17:31:01 +0000 (UTC)
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
X-List-Received-Date: Mon, 25 Jun 2018 17:31:10 -0000

On Mon, Jun 25, 2018 at 12:28:34PM +0200, Paolo Bonzini wrote:
> On 25/06/2018 08:50, Markus Armbruster wrote:
> > Paolo Bonzini <pbonzini@redhat.com> writes:
> > 
> >> On 22/06/2018 21:35, Eduardo Habkost wrote:
> >>>>> Why is this better than using KVM by default if it's available?
> >>>> The answer is (as almost always): Compatibility with migration. Nobody
> >>>> dares to sacrifice that chicken :-(
> >>> We can now kill it if we announce the feature as deprecated a
> >>> couple of releases in advance.
> >>>
> >>> If we declare that compatibility when the accelerator is omitted
> >>> is deprecated in 3.0, in QEMU 3.3 we will be free to choose a
> >>> different default accelerator.
> >>
> >> We can, we don't necessarily want it.
> >>
> >> The status quo is that people using KVM are invoking qemu as qemu-kvm,
> >> people using TCG are invoking qemu as qemu-system-*.  All distros are
> >> shipping a qemu-kvm or more rarely kvm binary, which is invariably a
> >> wrapper script except for RHEL because RHEL doesn't have a qemu-system-*
> >> binary at all.
> >>
> >> By the way, changing qemu-system-*'s default to e.g. RHEL's "kvm or tcg"
> >> would not help distros that have "-accel kvm" in their /usr/bin/qemu-kvm
> >> script.
> > 
> > It wouldn't hurt them, either.
> 
> Right; to sum up, it does make things a little less consistent for their
> users in two ways:
> 
> - qemu-system-<native> behaves differently from qemu-system-<others>.
> For example, for ARM the default CPU model might not work for KVM, so
> you would have to add a "-cpu xxx" option.
> 
> - qemu-system-<native> would still need an accelerator option on OS X or
> Windows, where there is not quite parity between TCG and the native
> accelerator, in terms of either features or stability.  Because of this
> we wouldn't be able to change the default to "whatever virtualizing
> accelerators are available followed by TCG".
> 
> > Attentive distros could even replace the wrapper script by a link.
> 
> If they are okay with replacing the "KVM only" semantics with "KVM or
> TCG", which I think is generally worse.

If we can't get agreement on what's the right default for each
QEMU binary, I think that's yet another reason to document that
upstream QEMU won't guarantee ABI compatibility if -accel is
omitted.

If downstream distributions want to keep promising ABI
compatibility, it will be up to them.

-- 
Eduardo

