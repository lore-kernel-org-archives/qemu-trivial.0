Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXLKM-0001lk-LB
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 02:50:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fXLKH-0001iK-8u
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 02:50:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fXLKG-0002dJ-Ah
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 02:50:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40620 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fXLKB-0002Xd-S7; Mon, 25 Jun 2018 02:50:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91FEE8182D1F;
	Mon, 25 Jun 2018 06:50:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-145.ams2.redhat.com
	[10.36.116.145])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A24167C42;
	Mon, 25 Jun 2018 06:50:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 622D611385D6; Mon, 25 Jun 2018 08:50:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <thuth@redhat.com>,
	zhang.zhanghailiang@huawei.com,
	Ben Warren <ben@skyportsystems.com>, qemu-trivial@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <1528866321-23886-5-git-send-email-thuth@redhat.com>
	<20180613133840.GK24528@stefanha-x1.localdomain>
	<20180613134452.GU19901@redhat.com>
	<b0ebd968-797f-48e0-32c1-869c452feca9@redhat.com>
	<20180613151942.GC19901@redhat.com>
	<87k1r24quk.fsf@dusky.pond.sub.org>
	<20180619171539.0adc90d6.cohuck@redhat.com>
	<d4e02083-c372-3ce5-d4a2-4809579fc8f2@redhat.com>
	<20180622181108.GY7451@localhost.localdomain>
	<c10c2ffa-7ee2-5106-07d1-528df939d6ad@redhat.com>
	<20180622193522.GI7451@localhost.localdomain>
	<743d495e-51cd-8c8e-293e-026b8dece74a@redhat.com>
Date: Mon, 25 Jun 2018 08:50:03 +0200
In-Reply-To: <743d495e-51cd-8c8e-293e-026b8dece74a@redhat.com> (Paolo
	Bonzini's message of "Fri, 22 Jun 2018 23:22:43 +0200")
Message-ID: <87lgb3xsv8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 25 Jun 2018 06:50:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 25 Jun 2018 06:50:06 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
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
X-List-Received-Date: Mon, 25 Jun 2018 06:50:14 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 22/06/2018 21:35, Eduardo Habkost wrote:
>>>> Why is this better than using KVM by default if it's available?
>>> The answer is (as almost always): Compatibility with migration. Nobody
>>> dares to sacrifice that chicken :-(
>> We can now kill it if we announce the feature as deprecated a
>> couple of releases in advance.
>> 
>> If we declare that compatibility when the accelerator is omitted
>> is deprecated in 3.0, in QEMU 3.3 we will be free to choose a
>> different default accelerator.
>
> We can, we don't necessarily want it.
>
> The status quo is that people using KVM are invoking qemu as qemu-kvm,
> people using TCG are invoking qemu as qemu-system-*.  All distros are
> shipping a qemu-kvm or more rarely kvm binary, which is invariably a
> wrapper script except for RHEL because RHEL doesn't have a qemu-system-*
> binary at all.
>
> By the way, changing qemu-system-*'s default to e.g. RHEL's "kvm or tcg"
> would not help distros that have "-accel kvm" in their /usr/bin/qemu-kvm
> script.

It wouldn't hurt them, either.

Attentive distros could even replace the wrapper script by a link.

> All in all, it seems simpler for me to take the status quo, which is
> what non-RHEL distros do, and make it part of upstream.
>
> Paolo

