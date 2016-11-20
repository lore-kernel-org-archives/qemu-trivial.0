Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c8fIR-0006Ba-4P
	for mharc-qemu-trivial@gnu.org; Sun, 20 Nov 2016 22:29:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1c8fIO-00069X-UL
	for qemu-trivial@nongnu.org; Sun, 20 Nov 2016 22:29:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1c8fIN-0003hi-Hr
	for qemu-trivial@nongnu.org; Sun, 20 Nov 2016 22:29:28 -0500
Received: from ozlabs.org ([103.22.144.67]:40253)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1c8fIM-0003eK-Tc
	for qemu-trivial@nongnu.org; Sun, 20 Nov 2016 22:29:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3tMYx60Sv6z9t2N; Mon, 21 Nov 2016 14:29:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1479698954;
	bh=lNTzGNqMa/dnVyXSk+Dm5yMimbaOm2MCuxEsBPPB/HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T0gUAVBreRhB3nU+KJXtZC0QxMfexBjG1Doir/XpcIZlO4xKIBuLs3cqp+4LzF5Bx
	Gr9WvO2ytPQwcVIHEbukumSzeFUYB35FQNOTx0Zf91kM/BWw263VUQ0oziZEIE5p8V
	1z22miaXQgotL9XvsExuEYHnG2whVoZLr6B+qFa0=
Date: Mon, 21 Nov 2016 10:44:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, Alexander Graf <agraf@suse.de>
Message-ID: <20161120234425.GB18153@umbus.fritz.box>
References: <20161119195055.19941-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <20161119195055.19941-1-sw@weilnetz.de>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [PATCH for-2.8] target-*: Fix typos found by
 codespell
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
X-List-Received-Date: Mon, 21 Nov 2016 03:29:30 -0000


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2016 at 08:50:55PM +0100, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Low risk, but low priority.  Applied to ppc-for-2.9.

> ---
>  target-i386/translate.c   | 2 +-
>  target-m68k/translate.c   | 6 +++---
>  target-ppc/cpu.h          | 2 +-
>  target-ppc/excp_helper.c  | 2 +-
>  target-ppc/int_helper.c   | 2 +-
>  target-ppc/mmu-hash64.c   | 2 +-
>  target-s390x/cpu_models.c | 2 +-
>  target-s390x/cpu_models.h | 2 +-
>  8 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/target-i386/translate.c b/target-i386/translate.c
> index 324103c..d8ca6df 100644
> --- a/target-i386/translate.c
> +++ b/target-i386/translate.c
> @@ -6701,7 +6701,7 @@ static target_ulong disas_insn(CPUX86State *env, Di=
sasContext *s,
>          if (s->prefix & PREFIX_LOCK) {
>              switch (op) {
>              case 0: /* bt */
> -                /* Needs no atomic ops; we surpressed the normal
> +                /* Needs no atomic ops; we suppressed the normal
>                     memory load for LOCK above so do it now.  */
>                  gen_op_ld_v(s, ot, cpu_T0, cpu_A0);
>                  break;
> diff --git a/target-m68k/translate.c b/target-m68k/translate.c
> index 9ad974f..cab2d58 100644
> --- a/target-m68k/translate.c
> +++ b/target-m68k/translate.c
> @@ -1579,7 +1579,7 @@ DISAS_INSN(negx)
> =20
>      gen_flush_flags(s); /* compute old Z */
> =20
> -    /* Perform substract with borrow.
> +    /* Perform subtract with borrow.
>       * (X, N) =3D  -(src + X);
>       */
> =20
> @@ -2067,7 +2067,7 @@ static inline void gen_subx(DisasContext *s, TCGv s=
rc, TCGv dest, int opsize)
> =20
>      gen_flush_flags(s); /* compute old Z */
> =20
> -    /* Perform substract with borrow.
> +    /* Perform subtract with borrow.
>       * (X, N) =3D dest - (src + X);
>       */
> =20
> @@ -2077,7 +2077,7 @@ static inline void gen_subx(DisasContext *s, TCGv s=
rc, TCGv dest, int opsize)
>      gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
>      tcg_gen_andi_i32(QREG_CC_X, QREG_CC_X, 1);
> =20
> -    /* Compute signed-overflow for substract.  */
> +    /* Compute signed-overflow for subtract.  */
> =20
>      tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, dest);
>      tcg_gen_xor_i32(tmp, dest, src);
> diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
> index 1c90adb..f65d318 100644
> --- a/target-ppc/cpu.h
> +++ b/target-ppc/cpu.h
> @@ -2234,7 +2234,7 @@ enum {
>      PPC_INTERRUPT_CDOORBELL,      /* Critical doorbell interrupt        =
  */
>      PPC_INTERRUPT_DOORBELL,       /* Doorbell interrupt                 =
  */
>      PPC_INTERRUPT_PERFM,          /* Performance monitor interrupt      =
  */
> -    PPC_INTERRUPT_HMI,            /* Hypervisor Maintainance interrupt  =
  */
> +    PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt   =
  */
>      PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt      =
  */
>  };
> =20
> diff --git a/target-ppc/excp_helper.c b/target-ppc/excp_helper.c
> index 93369d4..678e125 100644
> --- a/target-ppc/excp_helper.c
> +++ b/target-ppc/excp_helper.c
> @@ -139,7 +139,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>          }
>      }
> =20
> -    /* Exception targetting modifiers
> +    /* Exception targeting modifiers
>       *
>       * LPES0 is supported on POWER7/8
>       * LPES1 is not supported (old iSeries mode)
> diff --git a/target-ppc/int_helper.c b/target-ppc/int_helper.c
> index 9ac204a..5d4a571 100644
> --- a/target-ppc/int_helper.c
> +++ b/target-ppc/int_helper.c
> @@ -155,7 +155,7 @@ target_ulong helper_cnttzw(target_ulong t)
>  /* if x =3D 0xab, returns 0xababababababababa */
>  #define pattern(x) (((x) & 0xff) * (~(target_ulong)0 / 0xff))
> =20
> -/* substract 1 from each byte, and with inverse, check if MSB is set at =
each
> +/* subtract 1 from each byte, and with inverse, check if MSB is set at e=
ach
>   * byte.
>   * i.e. ((0x00 - 0x01) & ~(0x00)) & 0x80
>   *      (0xFF & 0xFF) & 0x80 =3D 0x80 (zero found)
> diff --git a/target-ppc/mmu-hash64.c b/target-ppc/mmu-hash64.c
> index fdb7a78..4f5d9f6 100644
> --- a/target-ppc/mmu-hash64.c
> +++ b/target-ppc/mmu-hash64.c
> @@ -691,7 +691,7 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vadd=
r eaddr,
> =20
>      /* Note on LPCR usage: 970 uses HID4, but our special variant
>       * of store_spr copies relevant fields into env->spr[SPR_LPCR].
> -     * Similarily we filter unimplemented bits when storing into
> +     * Similarly we filter unimplemented bits when storing into
>       * LPCR depending on the MMU version. This code can thus just
>       * use the LPCR "as-is".
>       */
> diff --git a/target-s390x/cpu_models.c b/target-s390x/cpu_models.c
> index c1e729d..a4d46f3 100644
> --- a/target-s390x/cpu_models.c
> +++ b/target-s390x/cpu_models.c
> @@ -38,7 +38,7 @@
>      }
> =20
>  /*
> - * CPU definiton list in order of release. For now, base features of a
> + * CPU definition list in order of release. For now, base features of a
>   * following release are always a subset of base features of the previous
>   * release. Same is correct for the other feature sets.
>   * A BC release always follows the corresponding EC release.
> diff --git a/target-s390x/cpu_models.h b/target-s390x/cpu_models.h
> index 136a602..b76ea54 100644
> --- a/target-s390x/cpu_models.h
> +++ b/target-s390x/cpu_models.h
> @@ -23,7 +23,7 @@ typedef struct S390CPUDef {
>      uint8_t gen;            /* hw generation identification */
>      uint16_t type;          /* cpu type identification */
>      uint8_t ec_ga;          /* EC GA version (on which also the BC is ba=
sed) */
> -    uint8_t mha_pow;        /* Maximum Host Adress Power, mha =3D 2^pow-=
1 */
> +    uint8_t mha_pow;        /* Maximum Host Address Power, mha =3D 2^pow=
-1 */
>      uint32_t hmfai;         /* hypervisor-managed facilities */
>      /* base/min features, must never be changed between QEMU versions */
>      S390FeatBitmap base_feat;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYMjVZAAoJEGw4ysog2bOSzNUQAMpw7osqFIuyD2afTzO0F/JW
q2zyJyCPvFx5L7C7jYSnRoGZP4n43z5pi91223HH6NT1+powSCdItIAtYzoMDqdT
fsXT/vGXcMiKjJ1pej9RVrbc3CF1XNImykcHVFijBuLD0FVPhyuX7ufuIEY2334a
r66M1O19FkBOCG1en0FtJowng+Jmy/7MsnvNgh3V/89BKVK1t/i72gsrVMIkmDy2
UNrxVkTga2dMdDg6c+MYy+o3/z6m8xjYJPcAIhDY+UPpFl3BOgIBYKlbEzcFCHr6
w5fL2aPUbTExxX8qDOs8H6n0GC+sPsiUiEyCZ1onc6PYOtYHJOf9CnADV6TuA2h3
o3D45kTqpfrd2iPGm3QKmVtWO427eJqd+iAr4rnqJDCjOknk8px7TfHBKwS8znxO
IbXVLW0BOklWFAzbmwbO9x8Nr2DOj6hAcc7Nx3ZuyzxmxdvR+X7zCk66mE5diGTF
Qm9n6ugxw5sTpkG4NfirUYNDBXRrs8KHH5VbACiJBP1YN74uoy7RxuYBKHr8cYbN
hkos253wzhOL+o+quVFjHNi2gyqPLn4QwzMeTkiC78aU5iiaMnoY6q0ocanFwT4d
Jcdd0vMAaubgQf9QQz5aVlIhzzM98QRX0QENfg3XcfgKA5xyH7ovAQ7POywOvlWq
+6T7MKFCEjqu0w1xnUtx
=qGKi
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--

