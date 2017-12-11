Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eOR6A-000761-R8
	for mharc-qemu-trivial@gnu.org; Mon, 11 Dec 2017 11:38:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eOR68-00074a-Lk
	for qemu-trivial@nongnu.org; Mon, 11 Dec 2017 11:38:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eOR67-0006z1-TJ
	for qemu-trivial@nongnu.org; Mon, 11 Dec 2017 11:38:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49714)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eOR63-0006vF-Vu; Mon, 11 Dec 2017 11:38:28 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B7DA356DD;
	Mon, 11 Dec 2017 16:38:26 +0000 (UTC)
Received: from [10.36.116.85] (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA415E9C6;
	Mon, 11 Dec 2017 16:38:24 +0000 (UTC)
To: Stefan Weil <sw@weilnetz.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20171113064845.29142-1-sw@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c3436f32-29b6-9fb9-c718-4db3cc9330c8@redhat.com>
Date: Mon, 11 Dec 2017 17:38:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171113064845.29142-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 11 Dec 2017 16:38:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.12] target/i386: Fix compiler
 warnings
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Dec 2017 16:38:33 -0000

On 13/11/2017 07:48, Stefan Weil wrote:
> These gcc warnings are fixed:
>=20
> target/i386/translate.c:4461:12: warning:
>  variable =E2=80=98prefixes=E2=80=99 might be clobbered by =E2=80=98lon=
gjmp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Wclobbered]
> target/i386/translate.c:4466:9: warning:
>  variable =E2=80=98rex_w=E2=80=99 might be clobbered by =E2=80=98longjm=
p=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Wclobbered]
> target/i386/translate.c:4466:16: warning:
>  variable =E2=80=98rex_r=E2=80=99 might be clobbered by =E2=80=98longjm=
p=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Wclobbered]
>=20
> Tested with x86_64-w64-mingw32-gcc from Debian stretch.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target/i386/translate.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/i386/translate.c b/target/i386/translate.c
> index 088a9d9766..f410938244 100644
> --- a/target/i386/translate.c
> +++ b/target/i386/translate.c
> @@ -4467,10 +4467,7 @@ static target_ulong disas_insn(DisasContext *s, =
CPUState *cpu)
>      target_ulong pc_start =3D s->base.pc_next;
> =20
>      s->pc_start =3D s->pc =3D pc_start;
> -    prefixes =3D 0;
>      s->override =3D -1;
> -    rex_w =3D -1;
> -    rex_r =3D 0;
>  #ifdef TARGET_X86_64
>      s->rex_x =3D 0;
>      s->rex_b =3D 0;
> @@ -4484,6 +4481,10 @@ static target_ulong disas_insn(DisasContext *s, =
CPUState *cpu)
>          return s->pc;
>      }
> =20
> +    prefixes =3D 0;
> +    rex_w =3D -1;
> +    rex_r =3D 0;
> +
>   next_byte:
>      b =3D x86_ldub_code(env, s);
>      /* Collect prefixes.  */
>=20

Queued, thanks.

Paolo

