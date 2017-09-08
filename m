Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqEAa-0005wS-AJ
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 03:57:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dqEAU-0005uN-8D
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 03:57:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dqEAP-0008Hl-Ov
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 03:57:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52092)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dqEA6-00080S-Oc; Fri, 08 Sep 2017 03:57:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56B3F80461;
	Fri,  8 Sep 2017 07:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 56B3F80461
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader (ovpn-117-133.ams2.redhat.com [10.36.117.133])
	by smtp.corp.redhat.com (Postfix) with SMTP id 2631980A9C;
	Fri,  8 Sep 2017 07:57:05 +0000 (UTC)
Date: Fri, 8 Sep 2017 09:57:05 +0200
From: Eduardo Otubo <otubo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Jarno, Aurelien" <aurelien@aurel32.net>,
	Eduardo Habkost <ehabkost@redhat.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
	"Gibson, David" <david@gibson.dropbear.id.au>
Message-ID: <20170908075705.GA16888@vader>
References: <20170901110332.32650-1-otubo@redhat.com>
	<20170901143016.GK7570@localhost.localdomain>
	<20170902091520.bxecfhisvy46o4cb@aurel32.net>
	<CABgObfZ-CthwUFC-E2QTxnpqYZ-Sr_f_M3-FdmH6tQPdjG3OAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABgObfZ-CthwUFC-E2QTxnpqYZ-Sr_f_M3-FdmH6tQPdjG3OAg@mail.gmail.com>
User-Agent: Mutt/1.8.3+47 (5f034395e53d) (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 08 Sep 2017 07:57:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dma/i82374: avoid double
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
X-List-Received-Date: Fri, 08 Sep 2017 07:57:43 -0000

On Thu, Sep 07, 2017 at 06:05:37PM +0200, Paolo Bonzini wrote:
> Il 02 set 2017 11:17 AM, "Aurelien Jarno" <aurelien@aurel32.net> ha scritto:
> 
> On 2017-09-01 11:30, Eduardo Habkost wrote:
> > i82374 is compiled in only on ppc and sh4, so I'm CCing the
> > maintainers for those architectures.
> 
> The i82374 device is not useful nor usable on SH4. It has just been
> added in commit 85d3846a39 to be able to run the tests.
> 
> 
> But that means that the patch is wrong and probably was not tested with
> "make check".
> 
> Eduardo's proposal is the right one.
> 

Great, I'll just add the missing details and resend the v2. Thanks for
the review.

Regards,

-- 
Eduardo Otubo
Senior Software Engineer @ RedHat

