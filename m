Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dzbdp-0004cC-RW
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2017 00:50:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dzbdn-0004af-Nu
	for qemu-trivial@nongnu.org; Wed, 04 Oct 2017 00:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dzbdm-0005oN-NR
	for qemu-trivial@nongnu.org; Wed, 04 Oct 2017 00:50:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56476)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dzbdi-0005lq-3u; Wed, 04 Oct 2017 00:50:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BBD0C2D0D5C;
	Wed,  4 Oct 2017 04:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2BBD0C2D0D5C
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-91.ams2.redhat.com
	[10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06C9B5C548;
	Wed,  4 Oct 2017 04:50:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 535D01132D34; Wed,  4 Oct 2017 06:50:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Otubo <otubo@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20170929140540.13766-1-otubo@redhat.com>
	<20170929193139.GB17385@localhost.localdomain>
	<9c365c30-8b63-f762-aa56-5b952b491aec@redhat.com>
	<20171003133705.GH17385@localhost.localdomain>
Date: Wed, 04 Oct 2017 06:50:28 +0200
In-Reply-To: <20171003133705.GH17385@localhost.localdomain> (Eduardo Habkost's
	message of "Tue, 3 Oct 2017 10:37:05 -0300")
Message-ID: <87d163v7mz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 04 Oct 2017 04:50:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCHv2] dma/i82374: avoid double
 creation of i82374 device
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
X-List-Received-Date: Wed, 04 Oct 2017 04:50:40 -0000

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Mon, Oct 02, 2017 at 02:50:07PM +0200, Paolo Bonzini wrote:
>> On 29/09/2017 21:31, Eduardo Habkost wrote:
>> >> -void DMA_init(ISABus *bus, int high_page_enable)
>> >> +void DMA_init(ISABus *bus, int high_page_enable, Error **errp)
>> > 
>> > If you make the function return a boolean to indicate success (in
>> > addition to setting *errp), you avoid the need for a local_err
>> > variable on the caller.
>> 
>> I think in this case, rather than a bool, it would be better to return 0
>> or -EBUSY.  A check for "< 0" would be more self-explanatory in the caller.
>
> I'm OK with that, too.
>
> We really need to document the available and preferred error
> reporting styles somewhere (probably on qapi/error.h).  We
> discussed that a lot recently[1], but the conclusions were not
> documented anywhere.
>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg461702.html

Yes, we need to document it.  We also need to convert existing code.

In my experience, documentation is a great time saver when people ask
questions.  It's less successful at getting people do the right thing.
For that, you have to make good examples common and bad examples
sufficiently rare.

