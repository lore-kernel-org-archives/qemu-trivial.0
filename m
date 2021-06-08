Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqWmt-0003e1-6R
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jun 2021 04:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqWmr-0003bf-Ca
 for qemu-trivial@nongnu.org; Tue, 08 Jun 2021 04:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqWmo-0002k4-Fu
 for qemu-trivial@nongnu.org; Tue, 08 Jun 2021 04:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623139713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/o9iV0kkYpaxlmL0kC14H5JBkKCHBvJFu/0rTf32Nxc=;
 b=Noqah5mtTX3eC2TcnDHhJ1s8S1Qg2qA4CLh4vrRQV+N3B6d9lrNmQJiGsNCQktrgPOlkWo
 OvBKDnuT19QcSiFMpk0AgkdeF+mT7Qh0DSreDdMoblf8OTbzj1Kya+pVddk9zXtdm1g7eL
 TdMEVMSHKOWG47cycTODqzBR1JayOYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-OyaiDL0ONNK7EGl6GGRmbw-1; Tue, 08 Jun 2021 04:08:31 -0400
X-MC-Unique: OyaiDL0ONNK7EGl6GGRmbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC0FF81DF1B;
 Tue,  8 Jun 2021 08:08:30 +0000 (UTC)
Received: from localhost (ovpn-114-153.ams2.redhat.com [10.36.114.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C42210013C1;
 Tue,  8 Jun 2021 08:08:30 +0000 (UTC)
Date: Tue, 8 Jun 2021 09:08:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] docs/tools/virtiofsd.rst: Do not hard-code the QEMU
 binary name
Message-ID: <YL8lfZWOGDN8XQ5a@stefanha-x1.localdomain>
References: <20210607174250.920226-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607174250.920226-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+Z75Uy5bLwYbGpfc"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 08 Jun 2021 08:08:37 -0000

--+Z75Uy5bLwYbGpfc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 07:42:50PM +0200, Thomas Huth wrote:
> In downstream, we want to use a different name for the QEMU binary,
> and some people might also use the docs for non-x86 binaries, that's
> why we already created the |qemu_system| placeholder in the past.
> Use it now in the virtiofsd doc, too.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/tools/virtiofsd.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--+Z75Uy5bLwYbGpfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC/JX0ACgkQnKSrs4Gr
c8gquwf+MKSWGfVWMrNoXbDDINCcypz8qAFqUheWAHSP08SeehFGH4V0onvb7M2L
vdND1qn+xVJrFrkKk3EGj58iCpSNIJuynSEBBMJqqtnp6VatvHuIMEpyWRTf9wzC
D0gwQUZxqVl51xZxpDqgBF58QmRW8m3k81JL5aNzAXGwJP5w4Vgfn00bTw8K+KzN
ZAl2pPteJXfRwO2FEKXYpWhzxBqX6YnCIztvwzU0SIWeT8hvskS5MlrLAt6bN00z
/qlbmO5YC6lHB0O8BSodm/S4XKCD8Zt0CQ6e6bAe4tVYiOld/PZ5T0YpRP5uAgZD
fdzu2RN7R+RPtXkNZO0ftX2jnjFldg==
=GAXc
-----END PGP SIGNATURE-----

--+Z75Uy5bLwYbGpfc--


