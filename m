Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtWWY-0001zo-G3
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 03:00:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julio@farjump.io>) id 1ZtWWT-0001sn-6E
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 03:00:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <julio@farjump.io>) id 1ZtWWS-000207-5g
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 03:00:53 -0500
Received: from relay4-d.mail.gandi.net ([2001:4b98:c:538::196]:52426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julio@farjump.io>)
	id 1ZtWWJ-0001yq-Gy; Tue, 03 Nov 2015 03:00:43 -0500
Received: from mfilter15-d.gandi.net (mfilter15-d.gandi.net [217.70.178.143])
	by relay4-d.mail.gandi.net (Postfix) with ESMTP id B929017251F;
	Tue,  3 Nov 2015 09:00:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter15-d.gandi.net
Received: from relay4-d.mail.gandi.net ([IPv6:::ffff:217.70.183.196])
	by mfilter15-d.gandi.net (mfilter15-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id RYJKIc3nkg5d; Tue,  3 Nov 2015 09:00:40 +0100 (CET)
X-Originating-IP: 209.85.215.52
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52]) (Authenticated sender: julio@farjump.io)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 065EF1725A4;
	Tue,  3 Nov 2015 09:00:39 +0100 (CET)
Received: by lfbn126 with SMTP id n126so8383760lfb.2;
	Tue, 03 Nov 2015 00:00:39 -0800 (PST)
X-Received: by 10.112.202.35 with SMTP id kf3mr12453083lbc.19.1446537639258;
	Tue, 03 Nov 2015 00:00:39 -0800 (PST)
MIME-Version: 1.0
References: <1444844599-33161-1-git-send-email-julio@farjump.io>
In-Reply-To: <1444844599-33161-1-git-send-email-julio@farjump.io>
From: Julio Guerra <julio@farjump.io>
Date: Tue, 03 Nov 2015 08:00:29 +0000
Message-ID: <CAFAwnGNwFft-tH+3mhspok2gz2UKiHeiuqi_ARdB4=6k4wq4uQ@mail.gmail.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=001a11c377a224779905239e4aaa
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:4b98:c:538::196
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
X-List-Received-Date: Tue, 03 Nov 2015 08:00:56 -0000

--001a11c377a224779905239e4aaa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ping :)

Le mer. 14 oct. 2015 19:43, Julio Guerra <julio@farjump.io> a =C3=A9crit :

> Fix the index used to read the IBAT's vector which results in IBAT0..3
> instead
> of IBAT4..N.
>
> The bug appeared by saving/restoring contexts including IBATs values.
>
> Signed-off-by: Julio Guerra <julio@farjump.io>
> ---
>  target-ppc/translate_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
> index b541473..76d9a02 100644
> --- a/target-ppc/translate_init.c
> +++ b/target-ppc/translate_init.c
> @@ -305,7 +305,7 @@ static void spr_read_ibat (DisasContext *ctx, int
> gprn, int sprn)
>
>  static void spr_read_ibat_h (DisasContext *ctx, int gprn, int sprn)
>  {
> -    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, IBAT[spr=
n
> & 1][(sprn - SPR_IBAT4U) / 2]));
> +    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, IBAT[spr=
n
> & 1][((sprn - SPR_IBAT4U) / 2) + 4]));
>  }
>
>  static void spr_write_ibatu (DisasContext *ctx, int sprn, int gprn)
> --
> 2.5.2
>
>

--001a11c377a224779905239e4aaa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Ping :)</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0mer. 14 oct. 2015 1=
9:43,=C2=A0Julio Guerra &lt;<a href=3D"mailto:julio@farjump.io">julio@farju=
mp.io</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">F=
ix the index used to read the IBAT&#39;s vector which results in IBAT0..3 i=
nstead<br>
of IBAT4..N.<br>
<br>
The bug appeared by saving/restoring contexts including IBATs values.<br>
<br>
Signed-off-by: Julio Guerra &lt;<a href=3D"mailto:julio@farjump.io" target=
=3D"_blank">julio@farjump.io</a>&gt;<br>
---<br>
=C2=A0target-ppc/translate_init.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c<br>
index b541473..76d9a02 100644<br>
--- a/target-ppc/translate_init.c<br>
+++ b/target-ppc/translate_init.c<br>
@@ -305,7 +305,7 @@ static void spr_read_ibat (DisasContext *ctx, int gprn,=
 int sprn)<br>
<br>
=C2=A0static void spr_read_ibat_h (DisasContext *ctx, int gprn, int sprn)<b=
r>
=C2=A0{<br>
-=C2=A0 =C2=A0 tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, =
IBAT[sprn &amp; 1][(sprn - SPR_IBAT4U) / 2]));<br>
+=C2=A0 =C2=A0 tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env, offsetof(CPUPPCState, =
IBAT[sprn &amp; 1][((sprn - SPR_IBAT4U) / 2) + 4]));<br>
=C2=A0}<br>
<br>
=C2=A0static void spr_write_ibatu (DisasContext *ctx, int sprn, int gprn)<b=
r>
--<br>
2.5.2<br>
<br>
</blockquote></div>

--001a11c377a224779905239e4aaa--

