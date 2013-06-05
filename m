Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkJkI-0007Po-TQ
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 15:51:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UkJkF-0007JH-Ba
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 15:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UkJkD-00032O-DU
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 15:51:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UkJk7-00030u-IF; Wed, 05 Jun 2013 15:51:35 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5DF5640AA8;
	Wed,  5 Jun 2013 23:51:34 +0400 (MSK)
Message-ID: <51AF96C5.5000507@msgid.tls.msk.ru>
Date: Wed, 05 Jun 2013 23:51:33 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1370434603-5394-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1370434603-5394-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	qemu-devel@nongnu.org, Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] cputlb: fix debug logs
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
X-List-Received-Date: Wed, 05 Jun 2013 19:51:45 -0000

05.06.2013 16:16, Herv=C3=A9 Poussineau wrote:
> 'pd' variable has been removed in 06ef3525e1f271b6a842781a05eace5cf63b9=
5c2.

It's been removed indeed, but the value has been replaced by using
a MemoryRegionSection instead.  I understand current code is wrong
when DEBUG_TLB is #defined, but I think it is also wrong to just
remove this value in printf.  The question is whenever this debugging
is useful now, and whenever this now-missing value is interesting
for that and should be provided by other means.  Maybe we may just
remove whole thing here and everywhere.

Cc'ing authors.

While this patch looks really trivial, it is something which is of
use by the subsystem maintainer(s) at their disposal.

Thanks,

/mjt

> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> ---
>  cputlb.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/cputlb.c b/cputlb.c
> index 86666c8..1230e9e 100644
> --- a/cputlb.c
> +++ b/cputlb.c
> @@ -262,8 +262,8 @@ void tlb_set_page(CPUArchState *env, target_ulong v=
addr,
> =20
>  #if defined(DEBUG_TLB)
>      printf("tlb_set_page: vaddr=3D" TARGET_FMT_lx " paddr=3D0x" TARGET=
_FMT_plx
> -           " prot=3D%x idx=3D%d pd=3D0x%08lx\n",
> -           vaddr, paddr, prot, mmu_idx, pd);
> +           " prot=3D%x idx=3D%d\n",
> +           vaddr, paddr, prot, mmu_idx);
>  #endif
> =20
>      address =3D vaddr;
>=20


