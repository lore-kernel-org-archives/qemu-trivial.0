Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um7VE-00060K-Rc
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 15:11:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <B07421@freescale.com>) id 1Um7VA-0005xK-Ee
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 15:11:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <B07421@freescale.com>) id 1Um7V7-0002E2-Qo
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 15:11:36 -0400
Received: from mail-db9lp0248.outbound.messaging.microsoft.com
	([213.199.154.248]:56298
	helo=db9outboundpool.messaging.microsoft.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <B07421@freescale.com>) id 1Um7V7-0002Dv-I4
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 15:11:33 -0400
Received: from mail142-db9-R.bigfish.com (10.174.16.236) by
	DB9EHSOBE006.bigfish.com (10.174.14.69) with Microsoft SMTP Server id
	14.1.225.23; Mon, 10 Jun 2013 18:41:24 +0000
Received: from mail142-db9 (localhost [127.0.0.1])	by
	mail142-db9-R.bigfish.com (Postfix) with ESMTP id 75C2118010F;
	Mon, 10 Jun 2013 18:41:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I1432Izz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839h944hd2bhf0ah1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h16a6h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail142-db9 (localhost.localdomain [127.0.0.1]) by mail142-db9
	(MessageSwitch) id 1370889666249411_29709;
	Mon, 10 Jun 2013 18:41:06 +0000 (UTC)
Received: from DB9EHSMHS007.bigfish.com (unknown [10.174.16.226])	by
	mail142-db9.bigfish.com (Postfix) with ESMTP id 374E14A005B;
	Mon, 10 Jun 2013 18:41:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS007.bigfish.com
	(10.174.14.17) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 10 Jun 2013 18:41:06 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Mon, 10 Jun 2013 18:41:04 +0000
Received: from snotra ([10.214.85.183])	by tx30smr01.am.freescale.net
	(8.14.3/8.14.0) with ESMTP id r5AIeqkv011021;
	Mon, 10 Jun 2013 11:40:56 -0700
Date: Mon, 10 Jun 2013 13:40:52 -0500
From: Scott Wood <scottwood@freescale.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <51B2DC25.2030506@msgid.tls.msk.ru> (from mjt@tls.msk.ru on Sat
	Jun  8 02:24:21 2013)
X-Mailer: Balsa 2.4.12
Message-ID: <1370889652.18413.11@snotra>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 213.199.154.248
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH 2/2] KVM: PPC: Add dummy
 kvm_arch_init_irq_routing()
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
X-List-Received-Date: Mon, 10 Jun 2013 19:11:40 -0000

On 06/08/2013 02:24:21 AM, Michael Tokarev wrote:
> 06.06.2013 07:59, Alexey Kardashevskiy wrote:
> > From: Scott Wood <scottwood@freescale.com>
> >
> > The common KVM code insists on calling kvm_arch_init_irq_routing()
> > as soon as it sees kernel header support for it (regardless of =20
> whether
> > QEMU supports it).  Provide a dummy function to satisfy this.
> >
> > Unlike x86, PPC does not have one default irqchip, so there's no =20
> common
> > code that we'd stick here.  Even if you ignore the routes =20
> themselves,
> > which even on x86 are not set up in this function, the initial XICS
> > kernel implementation will not support IRQ routing, so it's best to
> > leave even the general feature flags up to the specific irqchip =20
> code.
>=20
> As Scott Wood already pointed out, this should come in before the
> actual header update, which is no problem.  We'll have to deal
> with a new warning (-Wmissing-prototypes) which can be dealt with
> by wrapping this function into #ifdef KVM_CAP_IRQ_ROUTING .. #endif
> (I can add this).

Why?  I don't see where the prototype is guarded by that, and I don't =20
see a warning when applying this patch to master...

> But how about other architectures?  Before, this function were only
> defined for x86, now it is defined for two arches - x86 and ppc.
> Aren't other arches need this as well?

Yes, it looks like KVM_CAP_IRQ_ROUTING is no longer conditionally =20
defined, so all KVM architectures will need this (unless they provide a =20
non-dummy version).  Are weak functions acceptable in QEMU?  I don't =20
see any current examples.

-Scott=


