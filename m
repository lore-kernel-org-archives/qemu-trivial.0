Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b66kI-00017l-8k
	for mharc-qemu-trivial@gnu.org; Thu, 26 May 2016 21:39:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1b66kF-00015T-7l
	for qemu-trivial@nongnu.org; Thu, 26 May 2016 21:39:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1b66kE-0000hn-0d
	for qemu-trivial@nongnu.org; Thu, 26 May 2016 21:39:23 -0400
Received: from ozlabs.org ([103.22.144.67]:58141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1b66jx-0008VP-Nz; Thu, 26 May 2016 21:39:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rG7w33Y6Wz9t60; Fri, 27 May 2016 11:38:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1464313139;
	bh=gNhhAC24D3TkJlhtJGJfcr67B05te/y4SGevf3TlDH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbhApVwbplbBdEZtKUY0Tlg2US9flr+Q4qAe59XS1GILwYYzb3qgjQsYpC+Sno5o1
	1rPdkhRBtSVpZx6KFEsWMkv3cAoKgoG8ZwiNQRhoWfClM2SOrsjTXlospbxSfHn7Ca
	V0ciGfN1pQ539gPqEI04IJgcK3zU9AAkUpi6QraY=
Date: Fri, 27 May 2016 11:37:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Talha Imran <talha_imran@mentor.com>
Cc: agraf@suse.de, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20160527013714.GP17226@voom.fritz.box>
References: <1463659895-16281-1-git-send-email-talha_imran@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="90wTzOiXAbbhNsuN"
Content-Disposition: inline
In-Reply-To: <1463659895-16281-1-git-send-email-talha_imran@mentor.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] target-ppc/fpu_helper: Fix
 efscmp* instructions handling
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
X-List-Received-Date: Fri, 27 May 2016 01:39:24 -0000


--90wTzOiXAbbhNsuN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2016 at 05:11:35PM +0500, Talha Imran wrote:
> With specification at hand from the reference manual from Freescale
> http://cache.nxp.com/files/32bit/doc/ref_manual/SPEPEM.pdf , I have found=
 a fix
> to efscmp* instructions handling in QEMU.
>=20
> efscmp* instructions in QEMU set crD (Condition Register nibble) values a=
s=20
> (0b0100 << 2) =3D 0b10000 (consider the HELPER_SINGLE_SPE_CMP macro which=
 left=20
> shifts the value returned by efscmp* handler by 2 bits). A value of 0b100=
00 is
> not correct according the to the reference manual.
>=20
> The reference manual expects efscmp* instructions to return a value of 0b=
x1xx.
> Please find attached a patch which disables left shifting in
> HELPER_SINGLE_SPE_CMP macro. This macro is used by efscmp* and efstst*
> instructions only. efstst* instruction handlers, in turn, call efscmp* ha=
ndlers
> too.
>=20
> *Explanation:*
> Traditionally, each crD (condition register nibble) consist of 4 bits, wh=
ich is
> set by comparisons as follows:
> crD =3D W X Y Z
> where
> W =3D Less than
> X =3D Greater than
> Y =3D Equal to
>=20
> However, efscmp* instructions being a special case return a binary result.
> (efscmpeq will set the crD =3D 0bx1xx iff when op1 =3D=3D op2 and 0bx0xx =
otherwise;
> i.e. there is no notion of different crD values based on Less than, Great=
er
> than and Equal to).
>=20
> This effectively means that crD will store a "Greater than" comparison re=
sult
> iff efscmp* instruction comparison is TRUE. Compiler exploits this featur=
e by
> checking for "Branch if Less than or Equal to" (ble instruction) OR "Bran=
ch if
> Greater than" (bgt instruction) for Branch if FALSE OR Branch if TRUE
> respectively after an efscmp* instruction. This can be seen in a assembly=
 code
> snippet below:
>=20
> 27          if (__real__ x !=3D 3.0f || __imag__ x !=3D 4.0f)
> 10000498:   lwz r10,8(r31)
> 1000049c:   lis r9,16448
> 100004a0:   efscmpeq cr7,r10,r9
> 100004a4:   ble- cr7,0x100004b8 <bar+60>  //jump to abort() call
> 100004a8:   lwz r10,12(r31)
> 100004ac:   lis r9,16512
> 100004b0:   efscmpeq cr7,r10,r9
> 100004b4:   bgt- cr7,0x100004bc <bar+64>  //skip abort() call
> 28            abort ();
> 100004b8:   bl 0x10000808 <abort>
>=20
> Signed-off-by: Talha Imran <talha_imran@mentor.com>

Does this patch supersede the earlier patch you posted for efcmp
instructions on e500v1?  Or is it in addition to that patch?

> ---
>  target-ppc/fpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target-ppc/fpu_helper.c b/target-ppc/fpu_helper.c
> index b67ebca..6fd56a8 100644
> --- a/target-ppc/fpu_helper.c
> +++ b/target-ppc/fpu_helper.c
> @@ -1442,7 +1442,7 @@ static inline uint32_t efststeq(CPUPPCState *env, u=
int32_t op1, uint32_t op2)
>  #define HELPER_SINGLE_SPE_CMP(name)                                     \
>      uint32_t helper_e##name(CPUPPCState *env, uint32_t op1, uint32_t op2=
) \
>      {                                                                   \
> -        return e##name(env, op1, op2) << 2;                             \
> +        return e##name(env, op1, op2);                                  \
>      }
>  /* efststlt */
>  HELPER_SINGLE_SPE_CMP(fststlt);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--90wTzOiXAbbhNsuN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXR6TJAAoJEGw4ysog2bOSQRkP/1O1s1G2SF7WP+fFm4osgd1Z
9gM4WYPia4KBjdbV5BQs3C4mEibW32TgdUlR/NPr1LGLyeFR+36NBOfhBy7NOrJ6
O8tR8usSNHVo6OzfR6WVVBTeinrGa2vqgjMW7OgOHYG0KV+F84lU9YUcqRFJu+mD
kYrdcHzLsxek24/oUIXGN6JTAeJ4ZTgukL2vE5LUGhPTWezg5LhQutslLE/0sUU+
aZojMFA5HTSEsflVMg+5NmRf8n50lGCrhaxCoJlIO6zvzQ3nWJX1ddJlJuqsubTE
X+rOXCvOmGxzykuJ398MqiV+rOXXLLGrGEXT1MlKC5mluUXSgT95Mu9xG+E0tweN
HplvZT7jTdM7PtI5KPCA7pjMt9ks7isG8N2pAVUWQAzRFgMv49SiNvMIltAAI4Fb
VS2qK81k9FDsCQgf9nrKM5vTiNK6EPUz5Gwu3qtfTT6Fet5LZ2wfyyW8M9f166NC
NOE6/SfXuZyWTTbq7IWE/Ms8zst0X1e9QOnH3CdLblPIBY4Ie0r/yR8BhnJPIwxc
GJChn5rTN2osHut9ykS9BVJwUNgFI6OOPdRCUKTfnm1qm3mr7czYSY9NBO3jEmyS
lw/VUcw339EpsaIL5qPHY5H8WbOa1WvS81ByvWqIvCrJ5/LxhSQdwE0+x9wi5V1X
gagihc4I07IwYyqDpXPY
=kOxf
-----END PGP SIGNATURE-----

--90wTzOiXAbbhNsuN--

