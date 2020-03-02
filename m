Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8iK8-0006Dk-Vo
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2020 05:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jtomko@redhat.com>) id 1j8iK7-0006CB-Dm
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 05:29:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jtomko@redhat.com>) id 1j8iK6-00025m-1i
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 05:29:19 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37292
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jtomko@redhat.com>) id 1j8iK5-00024T-Td
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 05:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583144956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qfA43I0wPBTgAr1kymjSIKmCA8VdYQhVgHN7DXM1E8c=;
 b=QdKf8Y13agfXtg9+CHDt8/w0ZPRxAVKGo63DbKJ5kM61eESLYxjNPJB944pevyQUmirsS2
 H/IEoFTqykOz0Gw9kaLAXwVhytwDrPuCoCYLv3+R/0OP9Lj1DqGqFgwz5OnOGkk/s3IYS5
 kKKz834WTTJSS6TgI1J/tsRJSG66rYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-yaMwrn2GNyCJhSmUtSROiw-1; Mon, 02 Mar 2020 05:29:14 -0500
X-MC-Unique: yaMwrn2GNyCJhSmUtSROiw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C6891005510;
 Mon,  2 Mar 2020 10:29:13 +0000 (UTC)
Received: from lpt (unknown [10.43.2.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4731A8D562;
 Mon,  2 Mar 2020 10:29:11 +0000 (UTC)
Date: Mon, 2 Mar 2020 11:29:09 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Nick Erdmann <n@nirf.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] vhost-vsock: fix error message output
Message-ID: <20200302102909.GC2870380@lpt>
References: <04df3f47-c93b-1d02-d250-f9bda8dbc0fa@nirf.de>
MIME-Version: 1.0
In-Reply-To: <04df3f47-c93b-1d02-d250-f9bda8dbc0fa@nirf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Mon, 02 Mar 2020 10:29:20 -0000

--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Sunday in 2020, Nick Erdmann wrote:
>error_setg_errno takes a positive error number, so we should not invert
>errno's sign.
>
>Signed-off-by: Nick Erdmann <n@nirf.de>
>---
> hw/virtio/vhost-vsock.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEQeJGMrnL0ADuclbP+YPwO/Mat50FAl5c3+kACgkQ+YPwO/Ma
t5294gf/Sp/gNtQGPubE8lFZDjEDik68jAS9kGISg2iWKeJvQAeaPFSWj3H5DicR
aT94HJ7VvKoIwPRodcYgSNDz+KXgx28whzUJFmIrQ0LYmnkVBSOvN8n1N+zmXJfm
wLUYBCk+PNF02MN7juApisMEfrQ2t68X65apq1ToqvQcfuwoQhQalJdJTPNpIGXX
tL7gaUoLombLZF7EzOFWKij4GMd+cwPci5+oCBwnz95KzFlNfs4wRRxHRZam0slO
3huFZ1bWYiv26kUJtGKRL2NUZmpxCVtoxX+Pax7MMPgPB567CsNCAzf81mKU/NUd
TLdAbDuBTHkM1EuTqfmsQuHtmeLSlg==
=dvpk
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--


