Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGalS-0005hm-OX
	for mharc-qemu-trivial@gnu.org; Wed, 19 Oct 2011 14:21:18 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RGalP-0005a0-6P
	for qemu-trivial@nongnu.org; Wed, 19 Oct 2011 14:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RGalN-0004Ng-Px
	for qemu-trivial@nongnu.org; Wed, 19 Oct 2011 14:21:14 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:52401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RGalK-0004NB-UK; Wed, 19 Oct 2011 14:21:11 -0400
Received: by qadc12 with SMTP id c12so957439qad.4
	for <multiple recipients>; Wed, 19 Oct 2011 11:21:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.177.78 with SMTP id bh14mr1798048qab.14.1319048469870;
	Wed, 19 Oct 2011 11:21:09 -0700 (PDT)
Received: by 10.224.19.136 with HTTP; Wed, 19 Oct 2011 11:21:09 -0700 (PDT)
In-Reply-To: <CAKUHwZqVz1egRsgTtf_=Voe66EkL8n0kETW5zEFK5f=JHq_K6w@mail.gmail.com>
References: <CAKUHwZqVz1egRsgTtf_=Voe66EkL8n0kETW5zEFK5f=JHq_K6w@mail.gmail.com>
Date: Wed, 19 Oct 2011 19:21:09 +0100
Message-ID: <CAFEAcA9BdhCJ0fSBeQU8VayCtE-RSNmHax0-sFnaynWHWkX=ew@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Dmitry Koshelev <karaghiozis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] [v2] arm gic saving/loading
	fix
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
X-List-Received-Date: Wed, 19 Oct 2011 18:21:16 -0000

On 19 October 2011 15:10, Dmitry Koshelev <karaghiozis@gmail.com> wrote:
> irq_target field saving/loading is in the wrong loop
> version bump
>
> Signed-off-by: Dmitry Koshelev <karagiozis@gmail.com>
> ---
> =C2=A0hw/arm_gic.c | =C2=A0 16 ++++++++--------
> =C2=A01 files changed, 8 insertions(+), 8 deletions(-)
>
> @@ -744,5 +744,5 @@ static void gic_init(gic_state *s)
> =C2=A0 =C2=A0 s->iomemtype =3D cpu_register_io_memory(gic_dist_readfn,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
ic_dist_writefn, s);
> =C2=A0 =C2=A0 gic_reset(s);
> - =C2=A0 =C2=A0register_savevm(NULL, "arm_gic", -1, 1, gic_save, gic_load=
, s);
> + =C2=A0 =C2=A0register_savevm(NULL, "arm_gic", -1, 2, gic_save, gic_load=
, s);
> =C2=A0}
>

This doesn't apply against master -- can you rebase, please?

Since you need to resend anyway, convention for git commit messages
is to put the filename in the summary line, something like

 hw/arm_gic.c: Fix save/load of irq_target array

Also, if at all possible, can you send via a mailer which doesn't
wrap long lines? Otherwise I have to fix them at this end which
is very tedious...

thanks
-- PMM

