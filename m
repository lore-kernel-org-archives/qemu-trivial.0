Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ai0Dw-0006M4-3P
	for mharc-qemu-trivial@gnu.org; Mon, 21 Mar 2016 09:50:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ai0Dt-0006JX-R8
	for qemu-trivial@nongnu.org; Mon, 21 Mar 2016 09:50:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ai0Ds-0003lQ-RG
	for qemu-trivial@nongnu.org; Mon, 21 Mar 2016 09:50:21 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:35013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ai0Do-0003kv-CA; Mon, 21 Mar 2016 09:50:16 -0400
Received: by mail-wm0-x22d.google.com with SMTP id l68so110945641wml.0;
	Mon, 21 Mar 2016 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=H9/VyeUHE4zO3yiX/MjuFCUO+QaaWJf2Iw6DEWceUts=;
	b=CzlAw/2YN+BZzsGb9b8hWqO8BxLkJNW5O1wU2PwtgKFRaS/FayvIzPbULoKslvm9E0
	HP4LZdmUx6kn/IsgY+nY7HidgMKkJ8vmAUAmP43zcHYxhkmmPCyh3Z7jNaiEkKcVXyhk
	BuFLrVBYshTzGxn3ndX5Tlb45XG2anHmAtGLqscMXiRX2m1i2Sjga/I5pjyk9AGfrCgI
	yy9uxmZ1p2EnXUlDC3Jp8F5RkxryAOp85wDEFGWR4BQ+aDDDWoPB0jZxFwe0iqYiR/Uy
	tq0iaE04qeNfbv4Fupm/nIXntI85pU2XYXyTQAYTIc8RIl0R5CR1du/Vvh74kdIvhRsE
	hm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=H9/VyeUHE4zO3yiX/MjuFCUO+QaaWJf2Iw6DEWceUts=;
	b=GVfmSbH6Wd+R2B6apIgUE0FcWoZwoyAvsaWejnj+TtYzn5e/t0XPHU+N0FDYD5KkBc
	ei+IesKvIWNCzqhmR7lfSBKmHHfnL/PF30dGQ6H7R2r0cR9UzATc0EXabT9v6d30lypy
	MdmycsgG7rPVQ5gMM4yElhyErzCDXzeHyBKESx3O36nixhj6BhtKIkM9OLU43vbtm72w
	IIY0JOUh6qB1IaqjfeQvbvAyQiqT2/GyvEGCBh0wgNoqn9AaVyVKsR6hh4G1TChFwf4M
	TSiWsGEMofa8zPK11e2p1RB0qCaTDZ71A1Xd8V+jDXa4Vod6hfF8vghDYZkg8S6Wi16x
	rfyQ==
X-Gm-Message-State: AD7BkJI4ZAVsWK/COS3ZhDOHjO8w633jamsFgvRYMcieIUNzT6SFmtHZT9GBZCtvP3m2VA==
X-Received: by 10.194.60.100 with SMTP id g4mr30285139wjr.30.1458568215274;
	Mon, 21 Mar 2016 06:50:15 -0700 (PDT)
Received: from localhost (host109-156-68-66.range109-156.btcentralplus.com.
	[109.156.68.66]) by smtp.gmail.com with ESMTPSA id
	p125sm12533775wmd.16.2016.03.21.06.50.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 06:50:14 -0700 (PDT)
Date: Mon, 21 Mar 2016 13:50:13 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20160321135013.GA26812@stefanha-x1.localdomain>
References: <1458507614-32470-1-git-send-email-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <1458507614-32470-1-git-send-email-rjones@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Update documentation
 for stderr (now log) tracing backend.
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
X-List-Received-Date: Mon, 21 Mar 2016 13:50:23 -0000


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 20, 2016 at 09:00:14PM +0000, Richard W.M. Jones wrote:
> This fixes commit ed7f5f1d8db06fc31352a5ef4f54985e630c575a.
>=20
> Signed-off-by: Richard W.M. Jones.
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/tracing.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJW7/wVAAoJEJykq7OBq3PIHCUH/iL21iN5qnxIx2y10R49X/G2
k7seZe+zquUrmO1wgyNImUV65HmYoKj6TxNp/1Wyg3HyWZA4t7ChZo55je6fXs+f
bJsuWtLqHS41IoFx0NUPtDOriIpJOmo6SDGusLssRZC5ID6a6vyiF/NFpqEeCECc
93kL+QBwQe6pKazvqcdbB2yiNfMBriKkA818xBz/zImw2ZnFn3SBsWwMwvBrZthH
QP+I6ywpgZjac7b6Fo4cX9CAmHhWONpOJmnu+Zc0hFkRZuftNu78aJxLAtErBuV0
auaR623DU3LAdQo/WizP1hvl7QzZJRQF36NbiGPATQ5icz+PsxuRV4FiTg0NkMs=
=TLsj
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--

