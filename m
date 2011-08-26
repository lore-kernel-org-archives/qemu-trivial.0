Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qx2XD-0006CB-WD
	for mharc-qemu-trivial@gnu.org; Fri, 26 Aug 2011 15:57:47 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Qx2XB-0006C2-FO
	for qemu-trivial@nongnu.org; Fri, 26 Aug 2011 15:57:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Qx2X9-0005az-2M
	for qemu-trivial@nongnu.org; Fri, 26 Aug 2011 15:57:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Qx2X8-0005ao-PP; Fri, 26 Aug 2011 15:57:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7QJvaKS015294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 26 Aug 2011 15:57:36 -0400
Received: from bow.redhat.com (reserved-203-244.tlv.redhat.com [10.35.203.244]
	(may be forged))
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7QJvVak032148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 26 Aug 2011 15:57:35 -0400
Date: Fri, 26 Aug 2011 22:55:53 +0300
From: Alon Levy <alevy@redhat.com>
To: malc <av1474@comtv.ru>
Message-ID: <20110826195553.GD6393@bow.redhat.com>
Mail-Followup-To: malc <av1474@comtv.ru>, qemu-trivial@nongnu.org,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1314385561-22519-1-git-send-email-alevy@redhat.com>
	<alpine.LNX.2.00.1108262316530.3630@linmac>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1108262316530.3630@linmac>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pci-stub: fix comment
	typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Aug 2011 19:57:46 -0000

On Fri, Aug 26, 2011 at 11:17:59PM +0400, malc wrote:
> On Fri, 26 Aug 2011, Alon Levy wrote:
> 
> > Signed-off-by: Alon Levy <alevy@redhat.com>
> 
> > ---
> >  hw/pci-stub.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/hw/pci-stub.c b/hw/pci-stub.c
> > index c5a0aa8..8454c30 100644
> > --- a/hw/pci-stub.c
> > +++ b/hw/pci-stub.c
> > @@ -1,5 +1,5 @@
> >  /*
> > - * PCI stubs for plathome that doesn't support pci bus.
> > + * PCI stubs for platforms that doesn't support pci bus.
> >   *
> >   * Copyright (c) 2010 Isaku Yamahata <yamahata at valinux co jp>
> >   *                    VA Linux Systems Japan K.K.
> > 
> 
> I doubt that this is correct from grammatical standpoint (plural begs for
> do, not does), not a native speaker though..
> 

You are right, it should be don't.

> -- 
> mailto:av1474@comtv.ru

