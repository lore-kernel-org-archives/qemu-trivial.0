Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db4Cy-00040I-HG
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:17:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db4Cv-0003xs-Sr
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db4Cu-0001cH-Vp
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:17:29 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:38547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db4Cp-0001Xf-5o; Fri, 28 Jul 2017 08:17:23 -0400
Received: by mail-wm0-x244.google.com with SMTP id y206so4171565wmd.5;
	Fri, 28 Jul 2017 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/9vvLnHjlDETcMU9tL/vN+F5GFlCycP2Kt/cqNioU1c=;
	b=rCnBK/3BsCwGviC/oVMBGV26oPeVu2O/xPt+MJfIlPQ+Vi2Pa+QjCxw1RtZRTqfqH1
	ssV/vQ0/pY83PRXVUXXhGO+bdrpIrU+GJs5/sZqMbrvDtIUKI5YDRbF2m2LjvF9ab3ac
	jFwf81RU8++w0QHEFO/Z2N0xgibaNDaeSMoilcOrGGZCeUDK6f7P0x+khvatBKUCqJNP
	Jt/ZUYZLZirLfvXIbRs7Sl9uP0cU0uAWzQ6VEmd/11apmNGc3cnzBo1MpxtP79mItepO
	xzsayf6oqTSK7VOUHx7F6b6cdKrHFgXOYayvF3z7YU+XlXSsaaAxNxZMofhyzguay6t1
	i+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/9vvLnHjlDETcMU9tL/vN+F5GFlCycP2Kt/cqNioU1c=;
	b=Hcn7EjgNNw1WsD59ta/INdTQLYF0bASWQ88tqxXsHWS2QE2orZ7XXwlAGZdKG2v786
	oCOUeeOCIINRDjwq2pjoxQO+ndalnTVxuWh88Tmvecu7d2WLDRnmk3OOrN9DKvP1/oCs
	y2mWCA/QvCveTnMHSsWrY4fJSCNRl33cct3SKLLd8hOlVkjN0u10gS9mGH6VA0cpqOzm
	Mw6wy1wv+Sbz9nrXAts3H8jFS/0tElkdxlKlqunxXDr+T8j0VcLzsnGaULOxz5hpb5bt
	cEYM3JJjvIOTV6ba8P3rfR0o8tTIcduZOadpTynnKRuvwsUClw35FfDQzCkjDN4jYlM7
	j/wA==
X-Gm-Message-State: AIVw113F3o8iVIuLp2b4ADD8pvc8m8jFD5kfVHLNfONy5MRXIWJCiB+E
	Bic1Iigcgjp3YQ==
X-Received: by 10.80.165.114 with SMTP id z47mr6562372edb.60.1501244242236;
	Fri, 28 Jul 2017 05:17:22 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id u2sm9116350edl.71.2017.07.28.05.17.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:17:21 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:17:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170728121720.GJ12364@stefanha-x1.localdomain>
References: <20170727120210.6943-1-crosa@redhat.com>
	<20170727120210.6943-6-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6THr7QwYWIbrk6Kt"
Content-Disposition: inline
In-Reply-To: <20170727120210.6943-6-crosa@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/5] docs: fix broken paths
 to docs/interop dir
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
X-List-Received-Date: Fri, 28 Jul 2017 12:17:30 -0000


--6THr7QwYWIbrk6Kt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 08:02:10AM -0400, Cleber Rosa wrote:
> With the move of some docs to docs/interop on d59157e, a couple of
> references where not updated.
>=20
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/writing-qmp-commands.txt | 2 +-
>  qapi-schema.json                    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--6THr7QwYWIbrk6Kt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeytQAAoJEJykq7OBq3PIlogH/0D6483jONvntkvTJDb/iwnU
Zcc5N33koqvSFq9cv9/H+NWhtIxrtw6iglqfNWHMxsJX/uJWo2ttAkgK2It6Vu5M
Ggu5lJgCP+dBXvsPMhvpAnw7VKD8LNN8G1Z8S1OJVjo6/6ozbPMdwloLGJxYrCFO
rh1psZR2UxtGN/h+V5A+MXtbBhCFBklFSuK8gqhph96AKX7+JWm6f0XDISJiWyIG
jyqOsa6dsPmEEP5vRqPVkOQH7cA1jXpOpojg84rIRMhRcE8DS9T7ceg6D/vGlCBb
COXs8J4G7QWRR108I61epknfsFm1jrxxytZER83nC1MPMVeoqUOe0OMK6RxIZJQ=
=vDcG
-----END PGP SIGNATURE-----

--6THr7QwYWIbrk6Kt--

