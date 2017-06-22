Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO5Vv-0005hP-3S
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 13:03:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dO5Vs-0005gI-W5
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 13:03:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1dO5Vs-0001WS-2D
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 13:03:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1dO5Vk-0001LE-Jg; Thu, 22 Jun 2017 13:03:16 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 643D27CE17;
	Thu, 22 Jun 2017 17:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 643D27CE17
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=quintela@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 643D27CE17
Received: from localhost (ovpn-117-245.ams2.redhat.com [10.36.117.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED7E45D968;
	Thu, 22 Jun 2017 17:03:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
In-Reply-To: <20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com> (Greg
	Kurz's message of "Thu, 22 Jun 2017 18:42:55 +0200")
References: <149814756006.27338.8723356702388175951.stgit@bahia>
	<CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
	<20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 22 Jun 2017 19:03:13 +0200
Message-ID: <87injo6jla.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 22 Jun 2017 17:03:14 +0000 (UTC)
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
X-List-Received-Date: Thu, 22 Jun 2017 17:03:26 -0000

Greg Kurz <groug@kaod.org> wrote:
> On Thu, 22 Jun 2017 17:14:08 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
>> On 22 June 2017 at 17:06, Greg Kurz <groug@kaod.org> wrote:
>> > Function types cannot reside in the same sorted list as opaque types since
>> > they may depend on a type which would be defined later.
>> >
>> > Of course, the same problem could arise if a function type depends on
>> > another function type with greater alphabetical order. Hopefully we
>> > don't have that at this time.  
>> 
>> The other approach would be to put function types somewhere
>> else and leave typedefs.h for the simple 'opaque types
>> for structures' that it was started as.
>> 
>> For instance we have include/qemu/fprintf-fn.h as a precedent.
>> 
>
> Indeed, and I'm not quite sure why Juan decided to put these types into
> typedefs.h instead of a dedicated header file in include/migration... is
> it only because it was the quickest fix ?

All other typedefs were defined there.  I can create a different include
file, but I think that is "overengineering", no?  They are typedefs,
just not of structs.  But I agree that they are the only ones.

Later, Juan.

