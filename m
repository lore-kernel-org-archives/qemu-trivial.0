Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1Dxu-0004EM-QM
	for mharc-qemu-trivial@gnu.org; Tue, 05 Mar 2019 12:34:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h1Dxt-0004D5-EY
	for qemu-trivial@nongnu.org; Tue, 05 Mar 2019 12:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h1Dxs-00039h-Rp
	for qemu-trivial@nongnu.org; Tue, 05 Mar 2019 12:34:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1h1Dxr-00035m-4t; Tue, 05 Mar 2019 12:34:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63DC4307D852;
	Tue,  5 Mar 2019 17:25:15 +0000 (UTC)
Received: from localhost (ovpn-117-253.ams2.redhat.com [10.36.117.253])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA6D060F8D;
	Tue,  5 Mar 2019 17:25:14 +0000 (UTC)
Date: Tue, 5 Mar 2019 17:25:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>
Message-ID: <20190305172513.GC13806@stefanha-x1.localdomain>
References: <1551457277-884-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline
In-Reply-To: <1551457277-884-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 05 Mar 2019 17:25:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] tests: Do not use "\n" in
 g_test_message() strings
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
X-List-Received-Date: Tue, 05 Mar 2019 17:34:54 -0000


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2019 at 05:21:17PM +0100, Thomas Huth wrote:
> g_test_message() takes care of the newline on its own, so we
> should not use \n in the strings here.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/ivshmem-test.c         |  4 ++--
>  tests/m48t59-test.c          |  4 ++--
>  tests/migration-test.c       |  4 ++--
>  tests/rtc-test.c             |  4 ++--
>  tests/rtl8139-test.c         |  6 +++---
>  tests/test-aio-multithread.c |  8 ++++----
>  tests/test-coroutine.c       | 10 ++++------
>  tests/vhost-user-test.c      | 14 +++++++-------
>  8 files changed, 26 insertions(+), 28 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcfrD5AAoJEJykq7OBq3PIGpYH/ikCAYAW4TOKAQt42VCeUXq4
W4isCPukg2LBEthp8ArGT5kwAek08F9w8tHQZuETFjcp2hxU+nZcESOPfsDetEXj
QpPjV/0rOwQsfrwpSs68tUPBbPLt95H8vLHaxk7TuhIOKJW52u1mce84Ixf3qe/z
ohI9WTcZ2PywVMtYH23yq/7znjXgWvQnSXZiqW3UYqWbhbAzALWIF0BaFWpSZc7E
s2ax8p6mSlHVnZLaFu4cyKxtiorQZsaizrYtT5Fo36tNoqVIgN6FfqBU0MRtFc65
UwCgdhyD8nkgX5FVwDCDmbAWhKWEroltDzsuF0rM75kYGHTvKN39lqrtx1EBYIg=
=w0Cp
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--

