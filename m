Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnOIS-0003lR-7Y
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 03:19:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnOIP-0003hZ-Ov
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 03:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnOIO-0001iu-LL
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 03:19:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnOIM-0001iN-E6; Fri, 14 Jun 2013 03:19:38 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 411BA4162F;
	Fri, 14 Jun 2013 11:19:37 +0400 (MSK)
Message-ID: <51BAC408.5060003@msgid.tls.msk.ru>
Date: Fri, 14 Jun 2013 11:19:36 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Hu Tao <hutao@cn.fujitsu.com>
References: <51B9A88C.3080105@suse.de>
	<1371193890-1098-1-git-send-email-hutao@cn.fujitsu.com>
In-Reply-To: <1371193890-1098-1-git-send-email-hutao@cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] piix: fix some printf errors when
 debug is enabled
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
X-List-Received-Date: Fri, 14 Jun 2013 07:19:43 -0000

14.06.2013 11:11, Hu Tao wrote:
> And use PRIxxx macros if possible.
>=20
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> ---
>  cputlb.c        |  4 ++--
>  hw/acpi/piix4.c | 12 ++++++------
>  2 files changed, 8 insertions(+), 8 deletions(-)
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

This one hunk has already been posted by Herv=E9 Poussineau in this messa=
ge:

From: Herv=E9 Poussineau <hpoussin@reactos.org>
Date: Wed,  5 Jun 2013 20:16:42 +0800
Message-Id: <1370434603-5394-1-git-send-email-hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH] cputlb: fix debug logs

I questioned it because the `pd' thing hasn't been really removed
but moved into a different structure instead, and we should either
ask subsystem maintainers to fix it or remove the whole thing.
This is debugging stuff, which is needed by someone who actually
understands the subsystem and understands the debugging output
too.  If the debugging isn't needed (and since it does not compile
for quite some time, it obviously isn't used), let's get rid of
whole thing instead.

Unfortunately no one replied to that my email so far.  Adding Cc
BlueSwirl again, in a hope...

Thanks,

/mjt

