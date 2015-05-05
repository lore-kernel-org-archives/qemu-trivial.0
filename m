Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ypa9a-0007wV-A2
	for mharc-qemu-trivial@gnu.org; Tue, 05 May 2015 06:32:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ypa9X-0007qV-0e
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 06:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ypa9W-00067u-9x
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 06:32:38 -0400
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230]:35899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ypa9Q-00065k-2v; Tue, 05 May 2015 06:32:32 -0400
Received: by wgiu9 with SMTP id u9so14434432wgi.3;
	Tue, 05 May 2015 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WnsSqUWWnH1C2Hrk9zDe2gtP/10x+q/O+RUBxvsC9xU=;
	b=b43qzGeuBl7pn88K+3whReSTCmZJjLUibHLEE2CZbUvlWxIaLuLcHT3fgfjnTshZkr
	1wcq9lXgOkvaQJUtmt4tmAWoQgWZktTX/sY0leCPDZZcKjGsZEOtdUMfrN6JgxapaYip
	sleOb85JIMZaGhHwspOieL+h9rBR7/anNPmLA1ChK+1f+Tw44MPFrEefPILrhgR2uwQQ
	fEMCZxZzHfjsWjOl/4JzyA1HQBUkmX92w5epD4Osk9PI9giQTGGS1kd/3tjifb+A5uDV
	uGdFYdPhk9CeMD90XrL8J5hv4RYQUN5NhpWUhEOrIwu+HTfTrGezcARa7hHwSl6KXS01
	UQRQ==
X-Received: by 10.194.122.200 with SMTP id lu8mr11041315wjb.30.1430821951552; 
	Tue, 05 May 2015 03:32:31 -0700 (PDT)
Received: from localhost (host109-158-220-195.range109-158.btcentralplus.com.
	[109.158.220.195])
	by mx.google.com with ESMTPSA id ha4sm15474059wib.0.2015.05.05.03.32.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 03:32:30 -0700 (PDT)
Date: Tue, 5 May 2015 11:32:29 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20150505103229.GD3149@stefanha-thinkpad.redhat.com>
References: <20150503104722.3b3670c7@tpl530>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline
In-Reply-To: <20150503104722.3b3670c7@tpl530>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::230
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove various unused
	functions
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
X-List-Received-Date: Tue, 05 May 2015 10:32:40 -0000


--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2015 at 10:47:22AM +0200, Thomas Huth wrote:
>=20
> The functions tpm_backend_thread_tpm_reset() and iothread_find()
> are completely unused, let's remove them.
>=20
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  backends/tpm.c                   | 11 -----------
>  include/sysemu/iothread.h        |  1 -
>  include/sysemu/tpm_backend_int.h |  2 --
>  iothread.c                       | 12 ------------
>  4 files changed, 26 deletions(-)

Happy with iothread change, we can always bring it back later if needed.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVSJw9AAoJEJykq7OBq3PIkawH/j4rVh/6OkLudYNofCRuBpb+
xIonNBJog3mRLZr2U4Visz5EgchMT+QcmpjhPoHvv0p8oyjQvKdmudmkXGm7c7u1
4zNwIoTEvrGaTiNX6xpHjJ9dytRE911Qen8oERKRWeX+Tc33Dsl70gDQzk/CO0tw
HcaEqxHFhAkb7fl2TPzxO5iD3sHsHFo81nHMU6hmesNXLCi6AL9n0zcdXuKEybuK
9C/P8ZSt0xn53IZEobdYgf4sOJ0RQ59NJsjeG1wO8SiTBJGcvIdWOFdgUvPD+sGT
JN3J6i99KTZ731PlONf0tA28Fbk93rW3h87fzrJIPKYrB7RfFu8PLXUMYTilbU0=
=cAOk
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--

