Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dOIeH-0000Qu-4j
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jun 2017 03:04:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dOIeE-0000PP-SY
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 03:04:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dOIeE-0008DZ-3o
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 03:04:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10022)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dOIe8-0008Ap-In; Fri, 23 Jun 2017 03:04:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 037497A161;
	Fri, 23 Jun 2017 07:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 037497A161
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 037497A161
Received: from blackfin.pond.sub.org (ovpn-116-113.ams2.redhat.com
	[10.36.116.113])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A5E76E8D8;
	Fri, 23 Jun 2017 07:04:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F1E1511385E2; Fri, 23 Jun 2017 09:04:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Juan Quintela <quintela@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <149814756006.27338.8723356702388175951.stgit@bahia>
	<CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
	<20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
	<87injo6jla.fsf@secure.mitica>
	<CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
Date: Fri, 23 Jun 2017 09:04:44 +0200
In-Reply-To: <CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
	(Peter Maydell's message of "Thu, 22 Jun 2017 18:22:09 +0100")
Message-ID: <87vann5gmr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 23 Jun 2017 07:04:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Separate function types
 from opaque types in include/qemu/typedefs.h
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
X-List-Received-Date: Fri, 23 Jun 2017 07:04:56 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 22 June 2017 at 18:03, Juan Quintela <quintela@redhat.com> wrote:
>> Greg Kurz <groug@kaod.org> wrote:
>>> On Thu, 22 Jun 2017 17:14:08 +0100
>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>>> On 22 June 2017 at 17:06, Greg Kurz <groug@kaod.org> wrote:
>>>> > Function types cannot reside in the same sorted list as opaque types since
>>>> > they may depend on a type which would be defined later.
>>>> >
>>>> > Of course, the same problem could arise if a function type depends on
>>>> > another function type with greater alphabetical order. Hopefully we
>>>> > don't have that at this time.
>>>>
>>>> The other approach would be to put function types somewhere
>>>> else and leave typedefs.h for the simple 'opaque types
>>>> for structures' that it was started as.
>>>>
>>>> For instance we have include/qemu/fprintf-fn.h as a precedent.
>>>>
>>>
>>> Indeed, and I'm not quite sure why Juan decided to put these types into
>>> typedefs.h instead of a dedicated header file in include/migration... is
>>> it only because it was the quickest fix ?
>>
>> All other typedefs were defined there.  I can create a different include
>> file, but I think that is "overengineering", no?  They are typedefs,
>> just not of structs.  But I agree that they are the only ones.
>
> Well, the comment in the file says "opaque types so that device init
> declarations don't have to pull in all the real definitions", whereas
> the ones you've added aren't opaque types, they are the real
> definitions.

The comment is out of date.  The header declares many opaque types that
have nothing to do with "device init declarations".  Suggest to simply
delete the comment.  The technique to declare opaque types in one place
and define them elsewhere is common enough not to require justification.

>              They're also only used by a very small subset of .c
> files, whereas typedefs.h goes everywhere.

Yes.  Can we find a suitable migration header for them?

I don't like tiny header files such as qemu/fnprintf-fn.h.

