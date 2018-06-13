Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT5zO-00008N-VV
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 09:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT5zK-0008Vc-Py
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:39:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fT5zK-0006Fc-1R
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 09:39:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50186 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fT5z7-0005br-EI; Wed, 13 Jun 2018 09:38:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3EB4D4338;
	Wed, 13 Jun 2018 13:38:48 +0000 (UTC)
Received: from localhost (ovpn-117-110.ams2.redhat.com [10.36.117.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92CC81117645;
	Wed, 13 Jun 2018 13:38:48 +0000 (UTC)
Date: Wed, 13 Jun 2018 14:38:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, zhang.zhanghailiang@huawei.com,
	Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
Message-ID: <20180613133847.GL24528@stefanha-x1.localdomain>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-2-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L/Qt9NZ8t00Dhfad"
Content-Disposition: inline
In-Reply-To: <1528866321-23886-2-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 13:38:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 13:38:48 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 1/4] Replace '-machine accel=xyz' with
 '-accel xyz'
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
X-List-Received-Date: Wed, 13 Jun 2018 13:39:03 -0000


--L/Qt9NZ8t00Dhfad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2018 at 07:05:18AM +0200, Thomas Huth wrote:
> We've got a separate option to configure the accelerator nowadays.
> Use it in the source and examples to demonstrate that this is the
> preferred way of setting this option now.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-doc.texi                       | 3 +--
>  qemu-options.hx                     | 2 +-
>  scripts/qtest.py                    | 2 +-
>  tests/bios-tables-test.c            | 2 +-
>  tests/boot-serial-test.c            | 2 +-
>  tests/libqtest.c                    | 2 +-
>  tests/migration-test.c              | 8 ++++----
>  tests/migration/guestperf/engine.py | 2 +-
>  tests/pnv-xscom-test.c              | 2 +-
>  tests/prom-env-test.c               | 2 +-
>  tests/pxe-test.c                    | 2 +-
>  tests/qemu-iotests/172              | 2 +-
>  tests/qemu-iotests/check            | 2 +-
>  tests/vmgenid-test.c                | 2 +-
>  14 files changed, 17 insertions(+), 18 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--L/Qt9NZ8t00Dhfad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbIR5nAAoJEJykq7OBq3PInR0H/iJIPy0ic80YAqyRpW9uzgor
LebJlACCgr8DRirs74++bgOQjPdGjpCDtFcyNePeHgK6owcnzf+vkgXLBOfGYoV+
02NMC1vkF7yk4NSgEpCH0QPzpJFIyS/F43Us7KBD6xG/Abkni+R6cP+lFNvPtQQA
qy92icuRmRKwCeJNh+71IcOmLkY0dYfJDWVemlEIN8FGrIZgz9gXbiFWaIc8YCfg
pCG12B5XKdzGQ0TmtngEf2bp4v2rfvmGAHsidbYJPBdiv+BXmtzcbOART62y/rgb
1uvCGG1WgXLCqydcfAI4E5Gzj/YEpnFGJFmo4Qe0qpLQOQT6XJePvyYbkk0qA/k=
=uWkU
-----END PGP SIGNATURE-----

--L/Qt9NZ8t00Dhfad--

