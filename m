Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQ9Kt-00070L-RN
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jun 2017 05:32:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dQ9Kr-0006yl-8e
	for qemu-trivial@nongnu.org; Wed, 28 Jun 2017 05:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dQ9Kq-0006Za-71
	for qemu-trivial@nongnu.org; Wed, 28 Jun 2017 05:32:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50836)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1dQ9Kk-0006Y2-NQ; Wed, 28 Jun 2017 05:32:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67CB13D956;
	Wed, 28 Jun 2017 09:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 67CB13D956
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=quintela@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 67CB13D956
Received: from localhost (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D7EF7ABF4;
	Wed, 28 Jun 2017 09:32:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>
In-Reply-To: <87o9tf5gb8.fsf@dusky.pond.sub.org> (Markus Armbruster's message
	of "Fri, 23 Jun 2017 09:11:39 +0200")
References: <149814756006.27338.8723356702388175951.stgit@bahia>
	<CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
	<20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
	<87injo6jla.fsf@secure.mitica>
	<CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
	<20170622172555.GE2100@work-vm>
	<20170622194649.6d251753@bahia.lab.toulouse-stg.fr.ibm.com>
	<20170622175012.GF2100@work-vm>
	<fb2c7124-2d3f-6684-e2f2-265bfb3eb6da@redhat.com>
	<CAFEAcA-A=UrkKjLmVOcFA_d4rMW1AJwGffE4r2Uy6fw++XFF6w@mail.gmail.com>
	<87o9tf5gb8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 28 Jun 2017 11:32:20 +0200
Message-ID: <8760fg790b.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 28 Jun 2017 09:32:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Separate function types from opaque
 types in include/qemu/typedefs.h
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
X-List-Received-Date: Wed, 28 Jun 2017 09:32:34 -0000

Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 22 June 2017 at 19:08, Thomas Huth <thuth@redhat.com> wrote:
>>> On 22.06.2017 19:50, Dr. David Alan Gilbert wrote:
>>>> Could do; I'm just not finding tiny header files with one or
>>>> two entries each that useful.
>>
>> Well, it means that the bulk of code that doesn't care about the
>> types doesn't get its compilation fractionally slowed by having
>> to parse the typedef anyway. In general I think we're drifting
>> towards "have each .c file get fewer things automatically" rather
>> than otherwise (eg more finely focused files rather than stuffing
>> everything into qemu-common.h).
>
> Yes.  See also "Our use of #include is undisciplined, and what to do
> about it"
> Message-ID: <87wpp4m6n1.fsf@blackfin.pond.sub.org>
> https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03271.html
>
> I have some unfinished work towards emptying out qemu-common.h.  Need
> to find the time to finish it.
>
> [...]

YES!!!!!

Once there, we can also do other cleanups.

inclufde/sysemu/sysemu.h

have things not related at all.
I want to get rid of it on migration, because you know, we do zero
emulation there, but there are things like "runstate" that are defined
there.

I removed on that version lots of migration functionality that were
there, just from historical reasons, not because they belong there.

Later, Juan.

