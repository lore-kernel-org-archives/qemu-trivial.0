Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFDMl-0008Fp-8k
	for mharc-qemu-trivial@gnu.org; Fri, 20 Mar 2020 04:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jFDMh-00089l-MK
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 04:50:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jFDMg-00035U-AB
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2020 04:50:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56113 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jFDMZ-0002h5-GJ; Fri, 20 Mar 2020 04:50:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48kHY744gdz9sRf; Fri, 20 Mar 2020 19:50:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584694235;
 bh=pyMBMuqnvpH3Y163AImUTLwESxxQPzVKufbsbXR7jNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVhIhFh4MEdfxEy+v4x+kN3fzxKJFyk4cHmNjkVC4ZnNj69AB5ruqjdFtjAPILSeN
 oaNxJVOTDw5Tl2y6rxBUk8DuY7CGCdvNR4oSYMXnTAD+oehs+FcpdllM0Oibcen5lz
 2XNMZBCYSHuSLaCd/atPIDLhsaO2moH5p+eVb5fI=
Date: Fri, 20 Mar 2020 19:50:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Riku Voipio <riku.voipio@iki.fi>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, Vincent Fazio <vfazio@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 1/1] target/ppc: don't byte swap ELFv2 signal handler
Message-ID: <20200320085022.GD781112@umbus.fritz.box>
References: <20200319133244.8818-1-vfazio@xes-inc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jL2BoiuKMElzg3CS"
Content-Disposition: inline
In-Reply-To: <20200319133244.8818-1-vfazio@xes-inc.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2020 08:50:53 -0000


--jL2BoiuKMElzg3CS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 08:32:44AM -0500, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
>=20
> Previously, the signal handler would be byte swapped if the target and
> host CPU used different endianness. This would cause a SIGSEGV when
> attempting to translate the opcode pointed to by the swapped address.
>=20
>  Thread 1 "qemu-ppc64" received signal SIGSEGV, Segmentation fault.
>  0x00000000600a9257 in ldl_he_p (ptr=3D0x4c2c061000000000) at qemu/includ=
e/qemu/bswap.h:351
>  351        __builtin_memcpy(&r, ptr, sizeof(r));
>=20
>  #0  0x00000000600a9257 in ldl_he_p (ptr=3D0x4c2c061000000000) at qemu/in=
clude/qemu/bswap.h:351
>  #1  0x00000000600a92fe in ldl_be_p (ptr=3D0x4c2c061000000000) at qemu/in=
clude/qemu/bswap.h:449
>  #2  0x00000000600c0790 in translator_ldl_swap at qemu/include/exec/trans=
lator.h:201
>  #3  0x000000006011c1ab in ppc_tr_translate_insn at qemu/target/ppc/trans=
late.c:7856
>  #4  0x000000006005ae70 in translator_loop at qemu/accel/tcg/translator.c=
:102
>=20
> The signal handler will be byte swapped as a result of the __get_user()
> call in sigaction() if it is necessary, no additional swap is required.
>=20
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-5.0, thanks.

> ---
> Changes since v2:
> - Explain why the swap is not necessary
>=20
> Changes since v1:
> - Drop host/target endianness callouts
> - Drop unnecessary pointer cast
> - Clarify commit message
>=20
>  linux-user/ppc/signal.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index 5b82af6cb6..b8613c5e1b 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -567,10 +567,8 @@ void setup_rt_frame(int sig, struct target_sigaction=
 *ka,
>          env->nip =3D tswapl(handler->entry);
>          env->gpr[2] =3D tswapl(handler->toc);
>      } else {
> -        /* ELFv2 PPC64 function pointers are entry points, but R12
> -         * must also be set */
> -        env->nip =3D tswapl((target_ulong) ka->_sa_handler);
> -        env->gpr[12] =3D env->nip;
> +        /* ELFv2 PPC64 function pointers are entry points. R12 must also=
 be set. */
> +        env->gpr[12] =3D env->nip =3D ka->_sa_handler;
>      }
>  #else
>      env->nip =3D (target_ulong) ka->_sa_handler;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jL2BoiuKMElzg3CS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl50g84ACgkQbDjKyiDZ
s5KOpg//dBmrgwEPWZyVa1NCx7q8dunkVs0vKSLsRwREv9vE/9UjL5rs4LEaWgVc
EIxk4xAPm16zMCBVx5inrt6uWIO+FqEPGJA03/1BXI+TRHRx1PhUVvIcp22QyJDC
3/KhQAlA9xRw52KNHoZHtnKrtuOBvwNWa1bvWpoV89wKQBFJSY1aJa5dgIRAdCoJ
pohJEgjwA4wlAIlSxGAHY0shKvFqOtpkDnNDNVlPZRF++gfDsE1bYaZcE9R7Luen
yW1rvzSkIfXmFGZcuOmCR9EK7NFJY9PTvgREvLNDM1Wy0JnnrX7qX135YgpWcknI
WukOLjv68lMfMVDbmUyygU1e9o1n4CEtUoGgzakFlr4mpIakd0lN3GfLElKNjY2S
OMpXMRVVDrYzvcrTk9xhefuEfXvVwtaOWsMBrQyQojWjqc+TqJ8GFam9FPuWZDjN
wYNXVrs6eXrsgOQoK0S5Qowd4d/zhYMy2qb53VwUrAs3mUECCq2Paoos/7Xgmf8r
IhY0sh0w/BXuEPxkThavodzA/CUPAlDqRES1S2PS2VDSiFKtXAH5RQQv9PH1yauD
b5gEhhEi8hxpGPDob3B0UCPESkLoO2uxTrntap2WkiLxXd9+xvJZK/7M91rez+Pi
JFxEAqNaEg4E3Uub8+Oi93RKQeq66semwW9LrJDV28PVOPGE/Hw=
=OVHL
-----END PGP SIGNATURE-----

--jL2BoiuKMElzg3CS--

