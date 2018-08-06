Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmf2n-0002vC-KL
	for mharc-qemu-trivial@gnu.org; Mon, 06 Aug 2018 08:55:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fmf2f-0002qv-4P
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2018 08:55:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fmf2e-0003DS-1K
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2018 08:55:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40650 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1fmf2U-00035o-TV; Mon, 06 Aug 2018 08:55:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A1C27C6A9;
	Mon,  6 Aug 2018 12:55:09 +0000 (UTC)
Received: from [10.36.117.134] (ovpn-117-134.ams2.redhat.com [10.36.117.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2D642026D74;
	Mon,  6 Aug 2018 12:55:07 +0000 (UTC)
To: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	"open list:S390" <qemu-s390x@nongnu.org>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
	<20180805182832.3012-7-pavel.zbitskiy@gmail.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <c50dd722-3fd0-6ec7-79ec-f956ff185299@redhat.com>
Date: Mon, 6 Aug 2018 14:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180805182832.3012-7-pavel.zbitskiy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 12:55:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 12:55:09 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'david@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 6/6] target/s390x: implement CVB,
 CVBY and CVBG
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
X-List-Received-Date: Mon, 06 Aug 2018 12:55:27 -0000

On 05.08.2018 20:28, Pavel Zbitskiy wrote:
> Convert to Binary - counterparts of the already implemented Convert
> to Decimal (CVD*) instructions.
> Example from the Principles of Operation: 25594C becomes 63FA.
>=20
> Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
> ---
>  target/s390x/helper.h      |  2 ++
>  target/s390x/insn-data.def |  4 ++++
>  target/s390x/int_helper.c  | 58 ++++++++++++++++++++++++++++++++++++++=
++++++++
>  target/s390x/translate.c   | 12 ++++++++++
>  4 files changed, 76 insertions(+)
>=20
> diff --git a/target/s390x/helper.h b/target/s390x/helper.h
> index 97c60ca7bc..20e0c424f9 100644
> --- a/target/s390x/helper.h
> +++ b/target/s390x/helper.h
> @@ -88,6 +88,8 @@ DEF_HELPER_FLAGS_4(tcxb, TCG_CALL_NO_RWG_SE, i32, env=
, i64, i64, i64)
>  DEF_HELPER_FLAGS_2(sqeb, TCG_CALL_NO_WG, i64, env, i64)
>  DEF_HELPER_FLAGS_2(sqdb, TCG_CALL_NO_WG, i64, env, i64)
>  DEF_HELPER_FLAGS_3(sqxb, TCG_CALL_NO_WG, i64, env, i64, i64)
> +DEF_HELPER_FLAGS_2(cvb, TCG_CALL_NO_WG, i64, env, i64)
> +DEF_HELPER_FLAGS_2(cvbg, TCG_CALL_NO_WG, i64, env, i64)
>  DEF_HELPER_FLAGS_1(cvd, TCG_CALL_NO_RWG_SE, i64, s32)
>  DEF_HELPER_FLAGS_4(pack, TCG_CALL_NO_WG, void, env, i32, i64, i64)
>  DEF_HELPER_FLAGS_4(pka, TCG_CALL_NO_WG, void, env, i64, i64, i32)
> diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
> index 9c7b434fca..f0b1cbc4b2 100644
> --- a/target/s390x/insn-data.def
> +++ b/target/s390x/insn-data.def
> @@ -284,6 +284,10 @@
>      D(0xec73, CLFIT,   RIE_a, GIE, r1_32u, i2_32u, 0, 0, ct, 0, 1)
>      D(0xec71, CLGIT,   RIE_a, GIE, r1_o, i2_32u, 0, 0, ct, 0, 1)
> =20
> +/* CONVERT TO BINARY */
> +    C(0x4f00, CVB,     RX_a,  Z,   0, a2, new, r1_32, cvb, 0)
> +    C(0xe306, CVBY,    RXY_a, LD,  0, a2, new, r1_32, cvb, 0)
> +    C(0xe30e, CVBG,    RXY_a, Z,   0, a2, r1, 0, cvbg, 0)

Instead, use the "D" variant and pass e.g. 1/2 (or 4/8) as data ("length"=
).

OR (better) access and test "s->fields->op" in op_cvb to detect the lengt=
h.

You can then forward (e.g. the length) to the helper and avoid
op/cvbg/cvbg and inline do_cvb.

>  /* CONVERT TO DECIMAL */
>      C(0x4e00, CVD,     RX_a,  Z,   r1_o, a2, 0, 0, cvd, 0)
>      C(0xe326, CVDY,    RXY_a, LD,  r1_o, a2, 0, 0, cvd, 0)

Time to also implement CVDG in a similar fashion ? :)

> diff --git a/target/s390x/int_helper.c b/target/s390x/int_helper.c
> index abf77a94e6..2d67347d08 100644
> --- a/target/s390x/int_helper.c
> +++ b/target/s390x/int_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/exec-all.h"
>  #include "qemu/host-utils.h"
>  #include "exec/helper-proto.h"
> +#include "exec/cpu_ldst.h"
> =20
>  /* #define DEBUG_HELPER */
>  #ifdef DEBUG_HELPER
> @@ -118,6 +119,63 @@ uint64_t HELPER(divu64)(CPUS390XState *env, uint64=
_t ah, uint64_t al,
>      return ret;
>  }
> =20
> +static void general_operand_exception(CPUS390XState *env, uintptr_t ra=
)
> +{
> +    LowCore *lowcore;
> +
> +    lowcore =3D cpu_map_lowcore(env);
> +    lowcore->data_exc_code =3D 0;
> +    cpu_unmap_lowcore(lowcore);
> +    s390_program_interrupt(env, PGM_DATA, ILEN_AUTO, ra);
> +}
> +
> +static int64_t do_cvb(CPUS390XState *env, uint64_t src, int n)
> +{
> +    int i, j;
> +    uintptr_t ra =3D GETPC();
> +    int64_t dec, sign, digit, val, pow10;
> +
> +    for (i =3D 0; i < n; i++) {
> +        dec =3D cpu_ldq_data_ra(env, src + (n - i - 1) * 8, ra);
> +        for (j =3D 0; j < 16; j++, dec >>=3D 4) {
> +            if (i =3D=3D 0 && j =3D=3D 0) {
> +                sign =3D dec & 0xf;
> +                if (sign < 0xa) {
> +                    general_operand_exception(env, ra);
> +                }
> +                continue;
> +            }
> +            digit =3D dec & 0xf;
> +            if (digit > 0x9) {
> +                general_operand_exception(env, ra);
> +            }
> +            if (i =3D=3D 0 && j =3D=3D 1) {
> +                if (sign =3D=3D 0xb || sign =3D=3D 0xd) {
> +                    val =3D -digit;
> +                    pow10 =3D -10;
> +                } else {
> +                    val =3D digit;
> +                    pow10 =3D 10;
> +                }
> +            } else {
> +                val +=3D digit * pow10;
> +                pow10 *=3D 10;
> +            }
> +        }
> +    }
> +    return val;
> +}
> +
> +uint64_t HELPER(cvb)(CPUS390XState *env, uint64_t src)
> +{
> +    return do_cvb(env, src, 1);
> +}
> +
> +uint64_t HELPER(cvbg)(CPUS390XState *env, uint64_t src)
> +{
> +    return do_cvb(env, src, 2);
> +}
> +
>  uint64_t HELPER(cvd)(int32_t reg)
>  {
>      /* positive 0 */
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index 05442dff36..83d71815d4 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -2106,6 +2106,18 @@ static DisasJumpType op_csp(DisasContext *s, Dis=
asOps *o)
>  }
>  #endif
> =20
> +static DisasJumpType op_cvb(DisasContext *s, DisasOps *o)
> +{
> +    gen_helper_cvb(o->out, cpu_env, o->in2);
> +    return DISAS_NEXT;
> +}
> +
> +static DisasJumpType op_cvbg(DisasContext *s, DisasOps *o)
> +{
> +    gen_helper_cvbg(o->out, cpu_env, o->in2);
> +    return DISAS_NEXT;
> +}
> +
>  static DisasJumpType op_cvd(DisasContext *s, DisasOps *o)
>  {
>      TCGv_i64 t1 =3D tcg_temp_new_i64();
>=20


--=20

Thanks,

David / dhildenb

