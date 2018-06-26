Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXr4b-0003lx-RW
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jun 2018 12:44:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fXr4Z-0003jx-O9
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 12:44:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fXr4Y-0007RA-Pm
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 12:44:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60172 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fXr4S-0007Ms-Jl; Tue, 26 Jun 2018 12:44:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B605F7A7ED;
	Tue, 26 Jun 2018 16:43:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-145.ams2.redhat.com
	[10.36.116.145])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9A24111763E;
	Tue, 26 Jun 2018 16:43:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3263D11385D6; Tue, 26 Jun 2018 18:43:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhang.zhanghailiang@huawei.com,
	Ben Warren <ben@skyportsystems.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
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
	<20180626125644.GS7451@localhost.localdomain>
Date: Tue, 26 Jun 2018 18:43:56 +0200
In-Reply-To: <20180626125644.GS7451@localhost.localdomain> (Eduardo Habkost's
	message of "Tue, 26 Jun 2018 09:56:44 -0300")
Message-ID: <878t71xzub.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 16:43:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 26 Jun 2018 16:43:59 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
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
X-List-Received-Date: Tue, 26 Jun 2018 16:44:08 -0000

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Tue, Jun 26, 2018 at 09:50:04AM +0200, Cornelia Huck wrote:
>> On Tue, 26 Jun 2018 06:40:56 +0200
>> Thomas Huth <thuth@redhat.com> wrote:
>> 
>> > On 25.06.2018 20:26, Paolo Bonzini wrote:
>> > > On 25/06/2018 19:30, Eduardo Habkost wrote:  
>> > >>>> Attentive distros could even replace the wrapper script by a link.  
>> > >>> If they are okay with replacing the "KVM only" semantics with "KVM or
>> > >>> TCG", which I think is generally worse.  
>> > >>
>> > >> If we can't get agreement on what's the right default for each
>> > >> QEMU binary, I think that's yet another reason to document that
>> > >> upstream QEMU won't guarantee ABI compatibility if -accel is
>> > >> omitted.  
>> > > 
>> > > Before that we should ask what the benefit is in changing the default
>> > > for qemu-system-*.  Nobody is using it in practice to start QEMU with
>> > > KVM enabled...  
>> > 
>> > That's certainly not true. I've seen a couple of times already that
>> > people ask on IRC why their guests are running so slow, and if you ask
>> > them about their command line, it's obvious that they simply were not
>> > aware of "-accel" / "-enable-kvm" yet.
>> > 
>> > <semi-sarcastic>
>> > Maybe we simply should add a "--verbose" command line option that people
>> > can use to diagnose their problems:
>> > 
>> > $ qemu-system-x86_64 --verbose
>> > QEMU emulator version 2.12.50
>> > Using 'tcg' accelerator. Use '-accel kvm' to speed things up.
>> > Machine type is 'pc-i440fx-3.0'. Use 'q35' for a more modern machine.
>> > ....
>> > </semi-sarcastic>
>> 
>> Not sure how serious you meant that, but I actually quite like the
>> idea :)
>
> Also, this mode could be enabled by default if stderr is a tty.

It could be enabled by default, period.

Our inability to change defaults that have become sub-optimal for most
users is depressing.

