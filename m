Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQ22X-0006Z9-RL
	for mharc-qemu-trivial@gnu.org; Mon, 23 Feb 2015 18:03:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1YPwsT-0003Ur-1E
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 12:33:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1YPwsS-0006zT-3N
	for qemu-trivial@nongnu.org; Mon, 23 Feb 2015 12:33:04 -0500
Received: from ssl.serverraum.org ([88.198.40.39]:53599)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1YPwsN-0006xP-Mw; Mon, 23 Feb 2015 12:32:59 -0500
Received: from localhost (localhost [127.0.0.1])
	by ssl.serverraum.org (Postfix) with ESMTP id 85C0E3F132;
	Mon, 23 Feb 2015 18:32:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ssl.serverraum.org
Received: from ssl.serverraum.org ([127.0.0.1])
	by localhost (ssl.serverraum.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 447RsF_UIeqJ; Mon, 23 Feb 2015 18:32:57 +0100 (CET)
Received: from ssl.serverraum.org (localhost [127.0.0.1])
	by ssl.serverraum.org (Postfix) with ESMTP id 3D7CC3F128;
	Mon, 23 Feb 2015 18:32:57 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 23 Feb 2015 18:32:57 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
In-Reply-To: <1424448376-15599-3-git-send-email-rkrcmar@redhat.com>
References: <1424448376-15599-1-git-send-email-rkrcmar@redhat.com>
	<1424448376-15599-3-git-send-email-rkrcmar@redhat.com>
Message-ID: <ee25c453384fa231a2415870261edf54@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/0.9.5
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.40.39
X-Mailman-Approved-At: Mon, 23 Feb 2015 18:03:48 -0500
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 2/2] milkymist-pfpu: fix GCC 5.0.0
 aggressive-loop-optimizations warning
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
X-List-Received-Date: Mon, 23 Feb 2015 17:33:06 -0000

Am 2015-02-20 17:06, schrieb Radim Kr=C4=8Dm=C3=A1=C5=99:
> man gcc:
>   Warn if in a loop with constant number of iterations the compiler
>   detects undefined behavior in some statement during one or more of
>   the iterations.
>=20
> Milkymist pfpu has no jump instructions, so checking for=20
> MICROCODE_WORDS
> instructions should have kept us in bounds of s->microcode, but i++
> allowed one loop too many,
>=20
>   hw/misc/milkymist-pfpu.c: In function =E2=80=98pfpu_write=E2=80=99:
>   hw/misc/milkymist-pfpu.c:365:20: error: loop exit may only be
> reached after undefined behavior
> [-Werror=3Daggressive-loop-optimizations]
>                    if (i++ >=3D MICROCODE_WORDS) {
>                       ^
>   hw/misc/milkymist-pfpu.c:167:14: note: possible undefined statement=20
> is here
>        uint32_t insn =3D s->microcode[pc];
>                 ^
>=20
> The code can still access out of bounds, because it presumes that PC=20
> register
> always begins at 0, and we allow writing to it.
>=20
> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
> ---
>  v2: used a simpler solution [Paolo, Peter]
>=20
>  hw/misc/milkymist-pfpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
> index 609f33f9cd14..08b604f13f4b 100644
> --- a/hw/misc/milkymist-pfpu.c
> +++ b/hw/misc/milkymist-pfpu.c
> @@ -362,7 +362,7 @@ static void pfpu_start(MilkymistPFPUState *s)
>              i =3D 0;
>              while (pfpu_decode_insn(s)) {
>                  /* decode at most MICROCODE_WORDS instructions */
> -                if (i++ >=3D MICROCODE_WORDS) {
> +                if (++i >=3D MICROCODE_WORDS) {
>                      error_report("milkymist_pfpu: too many=20
> instructions "
>                              "executed in microcode. No VECTOUT?");
>                      break;

Acked-by: Michael Walle <michael@walle.cc>

