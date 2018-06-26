Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXnWr-0002wN-CF
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jun 2018 08:57:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXnWl-0002r4-Lo
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 08:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fXnWh-0005mG-61
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 08:56:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38684)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fXnWb-0005hp-R8; Tue, 26 Jun 2018 08:56:49 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com
	[10.5.11.26])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAC20C047B69;
	Tue, 26 Jun 2018 12:56:48 +0000 (UTC)
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC1AD30001E9;
	Tue, 26 Jun 2018 12:56:45 +0000 (UTC)
Date: Tue, 26 Jun 2018 09:56:44 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	zhang.zhanghailiang@huawei.com, Ben Warren <ben@skyportsystems.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20180626125644.GS7451@localhost.localdomain>
References: <20180622181108.GY7451@localhost.localdomain>
	<c10c2ffa-7ee2-5106-07d1-528df939d6ad@redhat.com>
	<20180622193522.GI7451@localhost.localdomain>
	<743d495e-51cd-8c8e-293e-026b8dece74a@redhat.com>
	<87lgb3xsv8.fsf@dusky.pond.sub.org>
	<4292432f-5f26-6925-4c14-ad1370e36e5b@redhat.com>
	<20180625173056.GM7451@localhost.localdomain>
	<97504b42-9ebe-45c5-6ff3-b43102c8374a@redhat.com>
	<54dfe708-cccf-c628-753f-692c83391ec4@redhat.com>
	<20180626095004.7e92fdaa.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180626095004.7e92fdaa.cohuck@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 26 Jun 2018 12:56:48 +0000 (UTC)
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
X-List-Received-Date: Tue, 26 Jun 2018 12:57:03 -0000

On Tue, Jun 26, 2018 at 09:50:04AM +0200, Cornelia Huck wrote:
> On Tue, 26 Jun 2018 06:40:56 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
> > On 25.06.2018 20:26, Paolo Bonzini wrote:
> > > On 25/06/2018 19:30, Eduardo Habkost wrote:  
> > >>>> Attentive distros could even replace the wrapper script by a link.  
> > >>> If they are okay with replacing the "KVM only" semantics with "KVM or
> > >>> TCG", which I think is generally worse.  
> > >>
> > >> If we can't get agreement on what's the right default for each
> > >> QEMU binary, I think that's yet another reason to document that
> > >> upstream QEMU won't guarantee ABI compatibility if -accel is
> > >> omitted.  
> > > 
> > > Before that we should ask what the benefit is in changing the default
> > > for qemu-system-*.  Nobody is using it in practice to start QEMU with
> > > KVM enabled...  
> > 
> > That's certainly not true. I've seen a couple of times already that
> > people ask on IRC why their guests are running so slow, and if you ask
> > them about their command line, it's obvious that they simply were not
> > aware of "-accel" / "-enable-kvm" yet.
> > 
> > <semi-sarcastic>
> > Maybe we simply should add a "--verbose" command line option that people
> > can use to diagnose their problems:
> > 
> > $ qemu-system-x86_64 --verbose
> > QEMU emulator version 2.12.50
> > Using 'tcg' accelerator. Use '-accel kvm' to speed things up.
> > Machine type is 'pc-i440fx-3.0'. Use 'q35' for a more modern machine.
> > ....
> > </semi-sarcastic>
> 
> Not sure how serious you meant that, but I actually quite like the
> idea :)

Also, this mode could be enabled by default if stderr is a tty.

-- 
Eduardo

