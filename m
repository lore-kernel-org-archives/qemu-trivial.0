Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XSMDW-0002Mn-Si
	for mharc-qemu-trivial@gnu.org; Fri, 12 Sep 2014 04:28:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1XSMDP-0002Da-CE
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 04:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1XSMDJ-000799-0Y
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 04:28:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1XSMD3-000767-Ho; Fri, 12 Sep 2014 04:28:01 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8C8Rw4n030706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 12 Sep 2014 04:27:58 -0400
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8C8Ruj8019047; Fri, 12 Sep 2014 04:27:57 -0400
Date: Fri, 12 Sep 2014 09:27:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Marc =?iso-8859-1?Q?Mar=ED?= <marc.mari.barcelo@gmail.com>
Message-ID: <20140912082756.GB1614@stefanha-thinkpad.redhat.com>
References: <1410428416-5046-1-git-send-email-marc.mari.barcelo@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
In-Reply-To: <1410428416-5046-1-git-send-email-marc.mari.barcelo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [TRIVIAL][PATCH v2] libqos virtio: Increase ISR
	timeout
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
X-List-Received-Date: Fri, 12 Sep 2014 08:28:29 -0000


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2014 at 11:40:16AM +0200, Marc Mar=ED wrote:
> Increase the clock step to avoid Travis failure in some builds due to
> overagressive timeout.
>=20
> Signed-off-by: Marc Mar=ED <marc.mari.barcelo@gmail.com>
> ---
>  tests/libqos/virtio.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUEq6MAAoJEJykq7OBq3PIOYwH/jXEDLr0of0CMS7nY+Mpg9MU
5sr19h8+gqlTiXHNZCTcVAxBK8+qKWPpcg9o7XAfaijfbaWwWnF6XjTxz/LhseFr
f+V4n63+9sUWh6P6ke7nzbldZHVhCbFRhEyvNDN8o5MiLkhFtPyU35M88E0fuVhX
xGV3ov0FW4zfLUEoaj2yd39jzLZFULheAeaP7n7tWs8CH04icIb8DcEBywrv6pZ+
2gMtgYfDGUx3SqJFiXQkoEXXH5N+q7ItG8isOrUnEwtrYEoYv5a3583kmrxPxyqY
3UeF7Mg2sYicH6Qr9qcVZkrDq2XQEk5/04Q3t1dNZUwlU7BG8+phVzOka40hBag=
=3Mce
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--

