Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFlDu-0004gs-Vr
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 07:19:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RFlDr-0004XC-UY
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:19:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RFlDm-0001Te-Cg
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:19:11 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:33566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RFlDh-0001T5-4r; Mon, 17 Oct 2011 07:19:01 -0400
Received: by qyk10 with SMTP id 10so1009148qyk.4
	for <multiple recipients>; Mon, 17 Oct 2011 04:19:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.226.141 with SMTP id iw13mr4002344qcb.98.1318850340553;
	Mon, 17 Oct 2011 04:19:00 -0700 (PDT)
Received: by 10.229.92.10 with HTTP; Mon, 17 Oct 2011 04:19:00 -0700 (PDT)
In-Reply-To: <CAKUHwZpm+WW2vdM1WjHV+rmYe8mbsP8Ydtnub7UxxxzfMD9m8A@mail.gmail.com>
References: <CAKUHwZpm+WW2vdM1WjHV+rmYe8mbsP8Ydtnub7UxxxzfMD9m8A@mail.gmail.com>
Date: Mon, 17 Oct 2011 12:19:00 +0100
Message-ID: <CAFEAcA9N14zbKn8kwDjEnpGZwExWMXHscOFR0ckbcutvgJQb6g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Dmitry Koshelev <karaghiozis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arm cpu state loading fix
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
X-List-Received-Date: Mon, 17 Oct 2011 11:19:13 -0000

On 17 October 2011 11:53, Dmitry Koshelev <karaghiozis@gmail.com> wrote:
> Floating registers loading fix.
>
> Signed-off-by: Dmitry Koshelev <karaghiozis@gmail.com>
> ---
> =C2=A0target-arm/machine.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 3925d3a..73d82c9 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -175,7 +175,7 @@ int cpu_load(QEMUFile *f, void *opaque, int version_i=
d)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 env->vfp.vec_stride =3D qemu_get_be32(f);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arm_feature(env, ARM_FEATURE_VFP3)) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; =C2=A0i < 16; i+=
+) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 16; =C2=A0i < 32; i=
++) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU_DoubleU u;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u.l.upper =3D qem=
u_get_be32(f);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u.l.lower =3D qem=
u_get_be32(f);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

