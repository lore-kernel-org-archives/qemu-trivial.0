Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kS8Rd-0002Ke-OJ
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 20:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kS8RO-00024Q-EY; Mon, 12 Oct 2020 20:45:22 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kS8RK-0006nJ-1X; Mon, 12 Oct 2020 20:45:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C9GzQ3p3Mz9sVM; Tue, 13 Oct 2020 11:45:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1602549906;
 bh=B3neiLDzH8RrfvD/WtpyEbiHUt7aAF0dawOY7BXLETc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PCr2cCivKVjWimiGYnDjtlLa5uZT/Y8VHxNTQRU5QHyFR+AZfsTa77b42k+9vKwx3
 LO/i6hMZztXNNLP4o9AfcDaARlWHY/m6om2FEBougwEDqtlvWxnx5+HFmGIdaqHtDm
 RYRZpPHZenUrS02Ae3vWPHJzSCUe7c3rZqDI6cvU=
Date: Tue, 13 Oct 2020 11:42:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 Paul Durrant <paul@xen.org>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Helge Deller <deller@gmx.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH 3/5] hw/pci-host/uninorth: Use the PCI_FUNC() macro from
 'hw/pci/pci.h'
Message-ID: <20201013004256.GH71119@yekko.fritz.box>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <20201012124506.3406909-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Content-Disposition: inline
In-Reply-To: <20201012124506.3406909-4-philmd@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 13 Oct 2020 00:45:24 -0000


--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 02:45:04PM +0200, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> We already have a generic PCI_FUNC() macro in "hw/pci/pci.h" to
> extract the PCI function identifier, use it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/uninorth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> index 1ed1072eeb5..c21de0ab805 100644
> --- a/hw/pci-host/uninorth.c
> +++ b/hw/pci-host/uninorth.c
> @@ -65,7 +65,7 @@ static uint32_t unin_get_config_reg(uint32_t reg, uint3=
2_t addr)
>          if (slot =3D=3D 32) {
>              slot =3D -1; /* XXX: should this be 0? */
>          }
> -        func =3D (reg >> 8) & 7;
> +        func =3D PCI_FUNC(reg >> 8);
> =20
>          /* ... and then convert them to x86 format */
>          /* config pointer */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+E+BAACgkQbDjKyiDZ
s5JqUhAAwaHNI4PyhRz1NaHKujUD5pEGVl+BohEX4xZhYb9nyi7iA1qkel9qGhcg
2daGPZSaQpaPCM1f2hFxcUKS4TfGfk8CbGQ8rIUHhRoJdR//xqN64Q2uo8yagtCt
bxv8Wo0CnC0JUb9idlbr9S03tiQCJSkEPnK+ACJaGPKDJxA2I61eAVJtRYMX/0Bl
BT3J8QFi+wqH05l7FP1rnv1Z3IhlGk7cPJ126TEypdlBIUTKDr9X8LOYNqgrhTEK
0CIHfwsBPQVd7Gj7QN6yDmRiPKIfmxqnF9NRX+itaSe7EfP0OXiphgJLQvRldCnH
UmmcbaYVhMSjXSPcvRdWY1ahFwR+e256Mv8cMLeYFuwCUI19xagsujCNhr3rt6tj
DbQQx7U3c8+S6ggFHxC0BWy/XrrPtgDKr4Fqm5/nBseLK3P5W5RQMSVn1DCao8hx
TCibJgQ6B9p2bRTp2V2mzICw7k68APPSOcg8r+MxTtArCErG0IfO5+ERd/tEeBsa
4wWXXSn7+DDJauSUqVrnOq4JrxZDiDICujFXP+hhvU/FwBBpwPF5qfNCgtDwPrMR
TwmgY+eMFml+klzUuDX/AbhZstEq2DZvPXMrO8imZXGzyGWiYWP7NDZYTG/jD69z
Rc5HRuZfiGm08uaztotylX7G5u+UceWDaaFFswZ+UseMU1q9whY=
=VMSj
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--

