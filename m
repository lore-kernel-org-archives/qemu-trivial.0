Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z57ne-0007ON-DK
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2015 03:30:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z57nb-0007LD-GE
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 03:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z57na-0004qK-JB
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 03:30:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37156)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z57nV-0004Sb-VI; Wed, 17 Jun 2015 03:30:10 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AEBD141725;
	Wed, 17 Jun 2015 10:30:01 +0300 (MSK)
Message-ID: <558121F9.6010804@msgid.tls.msk.ru>
Date: Wed, 17 Jun 2015 10:30:01 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1434510002-6976-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1434510002-6976-1-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v3 0/8] Add a member in MachineState to
	store irq array
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
X-List-Received-Date: Wed, 17 Jun 2015 07:30:16 -0000

17.06.2015 05:59, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>=20
> These are relevant to memory leak in machine init function. Here we add
> a member in MachineState to store irq array returned from
> qemu_allocate_irqs.
>=20
> PS. These patches are split from my previous patchset [1] since they ar=
e
> relevant to MachineState.
>=20
> Thanks,
> Shannon
>=20
> [1] [PATCH 00/29] Fix memory leak relevant to calling qemu_allocate_irq=
s
>=20
> changes since v2=EF=BC=9A
>   * Rebased on QEMU upstream
>   * Add a member in MachineState first, then fix the memory leak [mjt]

Um.  This is not what I asked.  It was a small suggestion, to add
infrastructure first use it in subsequent patches.

But the main question was what this infrastructure, what this patchset
actually brings us?  You just store the irq pointer in machine state,
that's okay, but WHAT FOR?  If your intention is to free resources,
this intention isn't met.  The end result of this whole change is a no-op=
,
there's nothing changed, the memory which has been allocated isn't being
freed.

So the actual question is: what's the point of this patchset?

Thanks,

/mjt


