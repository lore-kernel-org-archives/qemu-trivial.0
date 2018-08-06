Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmd5N-0004Yz-N9
	for mharc-qemu-trivial@gnu.org; Mon, 06 Aug 2018 06:50:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fmd5L-0004XP-Te
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2018 06:50:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1fmd5L-00074l-0I
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2018 06:49:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48914 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1fmd5D-00072l-TR; Mon, 06 Aug 2018 06:49:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6D2540201A0;
	Mon,  6 Aug 2018 10:49:49 +0000 (UTC)
Received: from [10.36.117.134] (ovpn-117-134.ams2.redhat.com [10.36.117.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A2CB10545D5;
	Mon,  6 Aug 2018 10:49:48 +0000 (UTC)
To: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	"open list:S390" <qemu-s390x@nongnu.org>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
	<20180805182832.3012-2-pavel.zbitskiy@gmail.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <cee2e745-04bb-0f42-512e-e2dba260ec05@redhat.com>
Date: Mon, 6 Aug 2018 12:49:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180805182832.3012-2-pavel.zbitskiy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 06 Aug 2018 10:49:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 06 Aug 2018 10:49:49 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'david@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 1/6] target/s390x: add BAL and BALR
 instructions
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
X-List-Received-Date: Mon, 06 Aug 2018 10:50:01 -0000

On 05.08.2018 20:28, Pavel Zbitskiy wrote:
> These instructions are provided for compatibility purposes and are
> used only by old software, in the new code BAS and BASR are preferred.
> The difference between the old and new instruction exists only in the
> 24-bit mode.
>=20
> Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
> ---
>  target/s390x/insn-data.def |  3 +++
>  target/s390x/translate.c   | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
> index 5c6f33ed9c..9c7b434fca 100644
> --- a/target/s390x/insn-data.def
> +++ b/target/s390x/insn-data.def
> @@ -102,6 +102,9 @@
>      D(0x9400, NI,      SI,    Z,   la1, i2_8u, new, 0, ni, nz64, MO_UB=
)
>      D(0xeb54, NIY,     SIY,   LD,  la1, i2_8u, new, 0, ni, nz64, MO_UB=
)
> =20
> +/* BRANCH AND LINK */
> +    C(0x0500, BALR,    RR_a,  Z,   0, r2_nz, r1, 0, bal, 0)
> +    C(0x4500, BAL,     RX_a,  Z,   0, a2, r1, 0, bal, 0)
>  /* BRANCH AND SAVE */
>      C(0x0d00, BASR,    RR_a,  Z,   0, r2_nz, r1, 0, bas, 0)
>      C(0x4d00, BAS,     RX_a,  Z,   0, a2, r1, 0, bas, 0)
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index 57c03cbf58..efdc88e227 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -1463,6 +1463,38 @@ static DisasJumpType op_bas(DisasContext *s, Dis=
asOps *o)
>      }
>  }
> =20
> +static void save_link_info(TCGv_i64 out, uint64_t pc, uint64_t ilc)
> +{
> +    TCGv_i64 t;
> +

This is !FLAG_MASK_64 && !FLAG_MASK_32 (24 bit) if I am not wrong?

FLAG_MASK_64 should simply be pc_to_link_info() just as for BAS.

"The link information in the 64-bit addressing mode
consists of the updated instruction address, placed in
bit positions 0-63 of the first-operand location."


> +    tcg_gen_andi_i64(out, out, 0xffffffff00000000);
> +    tcg_gen_ori_i64(out, out, (ilc << 30) | pc);
> +    t =3D tcg_temp_new_i64();
> +    tcg_gen_shri_i64(t, psw_mask, 16);
> +    tcg_gen_andi_i64(t, t, 0x0f000000);
> +    tcg_gen_or_i64(out, out, t);
> +    tcg_gen_extu_i32_i64(t, cc_op);
> +    tcg_gen_shli_i64(t, t, 28);
> +    tcg_gen_or_i64(out, out, t);
> +    tcg_temp_free_i64(t);
> +}
> +
> +static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
> +{
> +    if (s->base.tb->flags & FLAG_MASK_32) {
> +        return op_bas(s, o);
> +    }

Personally, I prefer using pc_to_link_info() instead of calling op_bas.
(handled in save_link_info() completely then).

So 24/31/64 bit mode should be handled in save_link_info.

> +    gen_op_calc_cc(s);
> +    save_link_info(o->out, s->pc_tmp, s->ilen / 2);
> +    if (o->in2) {
> +        tcg_gen_mov_i64(psw_addr, o->in2);
> +        per_branch(s, false);
> +        return DISAS_PC_UPDATED;
> +    } else {
> +        return DISAS_NEXT;
> +    }

This looks just like BAS and should be fine.

> +}
> +
>  static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
>  {
>      tcg_gen_movi_i64(o->out, pc_to_link_info(s, s->pc_tmp));
>=20


--=20

Thanks,

David / dhildenb

