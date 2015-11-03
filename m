Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtaWP-000164-GH
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 07:17:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaWM-00010n-A7
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:17:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZtaWJ-0007y3-0P
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:17:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40763)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZtaW8-0007xA-7z; Tue, 03 Nov 2015 07:16:48 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 64BF2407E0;
	Tue,  3 Nov 2015 15:16:47 +0300 (MSK)
Message-ID: <5638A5AF.9000709@msgid.tls.msk.ru>
Date: Tue, 03 Nov 2015 15:16:47 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Julio Guerra <julio@farjump.io>, qemu-devel@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <1444844599-33161-1-git-send-email-julio@farjump.io>
	<CAFAwnGNwFft-tH+3mhspok2gz2UKiHeiuqi_ARdB4=6k4wq4uQ@mail.gmail.com>
In-Reply-To: <CAFAwnGNwFft-tH+3mhspok2gz2UKiHeiuqi_ARdB4=6k4wq4uQ@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: christophe@farjump.io, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH v2] taget-ppc: Fix read access to IBAT
 registers higher than IBAT3
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
X-List-Received-Date: Tue, 03 Nov 2015 12:17:03 -0000

03.11.2015 11:00, Julio Guerra wrote:
> Ping :)

Well, I'm not sure what can I do with this.  I've no idea what is IBAT to=
 start
with, so while technically the patch is a one-liner, I've no idea what it=
 does
and how trivial it is :)

Maybe you can include some context which teaches me what it is all about,=
 and in
that case it becomes really trivial, or.. I dunno :)

Thanks,

/mjt

> Le mer. 14 oct. 2015 19:43, Julio Guerra <julio@farjump.io <mailto:juli=
o@farjump.io>> a =C3=A9crit :
>=20
>     Fix the index used to read the IBAT's vector which results in IBAT0=
..3 instead
>     of IBAT4..N.
>=20
>     The bug appeared by saving/restoring contexts including IBATs value=
s.
>=20
>     Signed-off-by: Julio Guerra <julio@farjump.io <mailto:julio@farjump=
.io>>
>     ---
>      target-ppc/translate_init.c | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>     diff --git a/target-ppc/translate_init.c b/target-ppc/translate_ini=
t.c
>     index b541473..76d9a02 100644
>     --- a/target-ppc/translate_init.c
>     +++ b/target-ppc/translate_init.c
>     @@ -305,7 +305,7 @@ static void spr_read_ibat (DisasContext *ctx, i=
nt gprn, int sprn)
>=20
>      static void spr_read_ibat_h (DisasContext *ctx, int gprn, int sprn=
)
>      {
>     -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, IB=
AT[sprn & 1][(sprn - SPR_IBAT4U) / 2]));
>     +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, IB=
AT[sprn & 1][((sprn - SPR_IBAT4U) / 2) + 4]));
>      }
>=20
>      static void spr_write_ibatu (DisasContext *ctx, int sprn, int gprn=
)
>     --
>     2.5.2
>=20


