Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ukcbh-0001F0-DW
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2013 12:00:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <B07421@freescale.com>) id 1UkcbZ-00011t-Qf
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 12:00:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <B07421@freescale.com>) id 1UkcbT-0005h3-2u
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 12:00:01 -0400
Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]:6939
	helo=va3outboundpool.messaging.microsoft.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <B07421@freescale.com>)
	id 1UkcbS-0005gm-Uz; Thu, 06 Jun 2013 11:59:55 -0400
Received: from mail117-va3-R.bigfish.com (10.7.14.236) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Thu, 6 Jun 2013 15:59:53 +0000
Received: from mail117-va3 (localhost [127.0.0.1])	by
	mail117-va3-R.bigfish.com (Postfix) with ESMTP id 445E440240;
	Thu,  6 Jun 2013 15:59:53 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I1432Izz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz6d523h8275bhz2dh2a8h668h839h944hd2bhf0ah1288h12a5h12a9h12bdh137ah139eh13b6h1441h1504h1537h162dh1631h16a6h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e23h1155h)
Received: from mail117-va3 (localhost.localdomain [127.0.0.1]) by mail117-va3
	(MessageSwitch) id 1370534392188927_16517;
	Thu,  6 Jun 2013 15:59:52 +0000 (UTC)
Received: from VA3EHSMHS022.bigfish.com (unknown [10.7.14.234])	by
	mail117-va3.bigfish.com (Postfix) with ESMTP id 2846760080;
	Thu,  6 Jun 2013 15:59:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS022.bigfish.com
	(10.7.99.32) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 6 Jun 2013 15:59:51 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 6 Jun 2013 16:01:08 +0000
Received: from snotra ([10.214.84.112])	by tx30smr01.am.freescale.net
	(8.14.3/8.14.0) with ESMTP id r56Fxd3A002746;
	Thu, 6 Jun 2013 08:59:44 -0700
Date: Thu, 6 Jun 2013 10:59:39 -0500
From: Scott Wood <scottwood@freescale.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1370491146-10778-1-git-send-email-aik@ozlabs.ru>
	<1370491146-10778-3-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1370491146-10778-3-git-send-email-aik@ozlabs.ru> (from
	aik@ozlabs.ru on Wed Jun  5 22:59:06 2013)
X-Mailer: Balsa 2.4.12
Message-ID: <1370534379.21533.0@snotra>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-OriginatorOrg: freescale.com
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.32.180.16
Cc: aik@ozlabs.ru, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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
X-List-Received-Date: Thu, 06 Jun 2013 16:00:08 -0000

On 06/05/2013 10:59:06 PM, Alexey Kardashevskiy wrote:
> From: Scott Wood <scottwood@freescale.com>
>=20
> The common KVM code insists on calling kvm_arch_init_irq_routing()
> as soon as it sees kernel header support for it (regardless of whether
> QEMU supports it).  Provide a dummy function to satisfy this.
>=20
> Unlike x86, PPC does not have one default irqchip, so there's no =20
> common
> code that we'd stick here.  Even if you ignore the routes themselves,
> which even on x86 are not set up in this function, the initial XICS
> kernel implementation will not support IRQ routing, so it's best to
> leave even the general feature flags up to the specific irqchip code.
>=20
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  target-ppc/kvm.c |    4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
> index 3ab2946..2bbc3b8 100644
> --- a/target-ppc/kvm.c
> +++ b/target-ppc/kvm.c
> @@ -1797,3 +1797,7 @@ int kvm_arch_on_sigbus(int code, void *addr)
>  {
>      return 1;
>  }
> +
> +void kvm_arch_init_irq_routing(KVMState *s)
> +{
> +}

This should come before the header update, to avoid breaking =20
bisectability.

-Scott=


