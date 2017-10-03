Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dzNO4-0006mw-Tq
	for mharc-qemu-trivial@gnu.org; Tue, 03 Oct 2017 09:37:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dzNO2-0006ks-6X
	for qemu-trivial@nongnu.org; Tue, 03 Oct 2017 09:37:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dzNNz-0003eS-1Y
	for qemu-trivial@nongnu.org; Tue, 03 Oct 2017 09:37:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dzNNp-0003bG-PX; Tue, 03 Oct 2017 09:37:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DD0525778;
	Tue,  3 Oct 2017 13:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7DD0525778
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E85EB6017C;
	Tue,  3 Oct 2017 13:37:08 +0000 (UTC)
Date: Tue, 3 Oct 2017 10:37:05 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Alexander Graf <agraf@suse.de>, Markus Armbruster <armbru@redhat.com>
Message-ID: <20171003133705.GH17385@localhost.localdomain>
References: <20170929140540.13766-1-otubo@redhat.com>
	<20170929193139.GB17385@localhost.localdomain>
	<9c365c30-8b63-f762-aa56-5b952b491aec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c365c30-8b63-f762-aa56-5b952b491aec@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 03 Oct 2017 13:37:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCHv2] dma/i82374: avoid double creation of
 i82374 device
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
X-List-Received-Date: Tue, 03 Oct 2017 13:37:27 -0000

On Mon, Oct 02, 2017 at 02:50:07PM +0200, Paolo Bonzini wrote:
> On 29/09/2017 21:31, Eduardo Habkost wrote:
> >> -void DMA_init(ISABus *bus, int high_page_enable)
> >> +void DMA_init(ISABus *bus, int high_page_enable, Error **errp)
> > 
> > If you make the function return a boolean to indicate success (in
> > addition to setting *errp), you avoid the need for a local_err
> > variable on the caller.
> 
> I think in this case, rather than a bool, it would be better to return 0
> or -EBUSY.  A check for "< 0" would be more self-explanatory in the caller.

I'm OK with that, too.

We really need to document the available and preferred error
reporting styles somewhere (probably on qapi/error.h).  We
discussed that a lot recently[1], but the conclusions were not
documented anywhere.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg461702.html

-- 
Eduardo

