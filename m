Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ecXlI-0001z2-AF
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jan 2018 09:35:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ecXlC-0001uN-Bb
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 09:35:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ecXlB-0003qh-Gx
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 09:35:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46710)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ecXl1-0003W4-Ce; Fri, 19 Jan 2018 09:35:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81698C07F9A9;
	Fri, 19 Jan 2018 14:35:02 +0000 (UTC)
Received: from [10.10.126.198] (ovpn-126-198.rdu2.redhat.com [10.10.126.198])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AB2580D9D;
	Fri, 19 Jan 2018 14:34:58 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>
References: <20180119103233.26075-1-lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <35f2a7e0-7926-f3b5-017f-ad769eff854d@redhat.com>
Date: Fri, 19 Jan 2018 08:34:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180119103233.26075-1-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Hro2GlSoQ4hGMFtxKbWPtkz7ZutmTIc1r"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 19 Jan 2018 14:35:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build: fix typo in error
 message
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
X-List-Received-Date: Fri, 19 Jan 2018 14:35:18 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hro2GlSoQ4hGMFtxKbWPtkz7ZutmTIc1r
Content-Type: multipart/mixed; boundary="Kc8fzxD92mZCV2e9VKxCrhDAJq8rhGB0w";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
Message-ID: <35f2a7e0-7926-f3b5-017f-ad769eff854d@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] build: fix typo in error message
References: <20180119103233.26075-1-lvivier@redhat.com>
In-Reply-To: <20180119103233.26075-1-lvivier@redhat.com>

--Kc8fzxD92mZCV2e9VKxCrhDAJq8rhGB0w
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01/19/2018 04:32 AM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/git-submodule.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Duplicate of:
https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg04178.html
https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg03875.html
https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg03798.html


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--Kc8fzxD92mZCV2e9VKxCrhDAJq8rhGB0w--

--Hro2GlSoQ4hGMFtxKbWPtkz7ZutmTIc1r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlpiAhEACgkQp6FrSiUn
Q2qBLwgAqhHSnY/hZpEGDJpEob4YWjWGEBxviPfLntj7I5qiCAEki7SQrc9rke44
XEAtXOYKlcyGsFZ7BT8C4RcWACiLvoi5LkmLhMaNgvz/uGIlRz1pCMK7TyJbWgF9
SfXEK2fSE86PJWhwtZ9qgyRIyGmBz4sMpexRvPApm4samr84RyqsRS8ejIYV3WiW
wPnVIZuZZRkk+UfptKxUokPoCpBQtAdZi8u4UohnbkmTNYk2pM5BMxByDBCYVQBx
fDGAVZE688i/RBQnY9hRaoBos81kKNXyu36vAzoFCRPUqP9uJb3r+WAOUNCzgw66
Bww0EE9bu1v9yyI+39bE/J3vfV8fhg==
=dnkU
-----END PGP SIGNATURE-----

--Hro2GlSoQ4hGMFtxKbWPtkz7ZutmTIc1r--

