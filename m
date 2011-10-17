Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFlC7-0003Er-9Z
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 07:17:23 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RFlC0-0002rI-Ht
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:17:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RFlBz-0000oB-5K
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 07:17:16 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:34383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RFlBo-0000kS-Qi; Mon, 17 Oct 2011 07:17:04 -0400
Received: by qadb10 with SMTP id b10so2531162qad.4
	for <multiple recipients>; Mon, 17 Oct 2011 04:17:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.226.141 with SMTP id iw13mr4000783qcb.98.1318850223276;
	Mon, 17 Oct 2011 04:17:03 -0700 (PDT)
Received: by 10.229.92.10 with HTTP; Mon, 17 Oct 2011 04:17:03 -0700 (PDT)
In-Reply-To: <4E9C096B.9060405@suse.de>
References: <CAKUHwZqQa8BQGWEKgysuJmP2mHv-nS6k9+gNb6w3TsSNWSc_GQ@mail.gmail.com>
	<4E9C096B.9060405@suse.de>
Date: Mon, 17 Oct 2011 12:17:03 +0100
Message-ID: <CAFEAcA_6gLx3sD5r0cperWBbjYDTgmn5V-7dkUj-8g+PFEZP5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Dmitry Koshelev <karaghiozis@gmail.com>,
	qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arm gic saving/loading fix
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
X-List-Received-Date: Mon, 17 Oct 2011 11:17:21 -0000

On 17 October 2011 11:54, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Am 17.10.2011 12:48, schrieb Dmitry Koshelev:
>> irq_target field saving/loading is in the wrong loop
>>
>> Signed-off-by: Dmitry Koshelev <karagiozis@gmail.com>
>
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Doesn't it need a vmstate version bump too?

-- PMM

> Andreas
>
>> ---
>> =C2=A0hw/arm_gic.c | =C2=A0 12 ++++++------
>> =C2=A01 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/arm_gic.c b/hw/arm_gic.c
>> index 8286a28..ba05131 100644
>> --- a/hw/arm_gic.c
>> +++ b/hw/arm_gic.c
>> @@ -662,9 +662,6 @@ static void gic_save(QEMUFile *f, void *opaque)
>> =C2=A0 =C2=A0 =C2=A0qemu_put_be32(f, s->enabled);
>> =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i < NUM_CPU(s); i++) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_be32(f, s->cpu_enabled[i]);
>> -#ifndef NVIC
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_be32(f, s->irq_target[i]);
>> -#endif
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j < 32; j++)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_be32(f, s->prio=
rity1[j][i]);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j < GIC_NIRQ; j++)
>> @@ -678,6 +675,9 @@ static void gic_save(QEMUFile *f, void *opaque)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_be32(f, s->priority2[i]);
>> =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i < GIC_NIRQ; i++) {
>> +#ifndef NVIC
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_be32(f, s->irq_target[i]);
>> +#endif
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_byte(f, s->irq_state[i].enabl=
ed);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_byte(f, s->irq_state[i].pendi=
ng);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_put_byte(f, s->irq_state[i].activ=
e);
>> @@ -699,9 +699,6 @@ static int gic_load(QEMUFile *f, void *opaque, int
>> version_id)
>> =C2=A0 =C2=A0 =C2=A0s->enabled =3D qemu_get_be32(f);
>> =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i < NUM_CPU(s); i++) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->cpu_enabled[i] =3D qemu_get_be32(f)=
;
>> -#ifndef NVIC
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0s->irq_target[i] =3D qemu_get_be32(f);
>> -#endif
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j < 32; j++)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->priority1[j][i] =3D q=
emu_get_be32(f);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j < GIC_NIRQ; j++)
>> @@ -715,6 +712,9 @@ static int gic_load(QEMUFile *f, void *opaque, int
>> version_id)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->priority2[i] =3D qemu_get_be32(f);
>> =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i < GIC_NIRQ; i++) {
>> +#ifndef NVIC
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0s->irq_target[i] =3D qemu_get_be32(f);
>> +#endif
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->irq_state[i].enabled =3D qemu_get_b=
yte(f);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->irq_state[i].pending =3D qemu_get_b=
yte(f);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s->irq_state[i].active =3D qemu_get_by=
te(f);
>
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746, AG N=C3=
=BCrnberg
>



--=20
123456789012345678901234567890123456789012345678901234567890123456789012345=
67890
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 8

