Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dUnhk-0002pe-S9
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jul 2017 01:27:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dUnhi-0002oR-Kn
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 01:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dUnhh-0004ra-Rp
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 01:27:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36082)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dUnhd-0004pT-Gr; Tue, 11 Jul 2017 01:27:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F5B318DF47;
	Tue, 11 Jul 2017 05:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2F5B318DF47
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2F5B318DF47
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 244C55DC1D;
	Tue, 11 Jul 2017 05:27:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8AB0B1138645; Tue, 11 Jul 2017 07:27:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com, qemu-trivial@nongnu.org
References: <20170609133337.31183-1-marcandre.lureau@redhat.com>
Date: Tue, 11 Jul 2017 07:27:12 +0200
In-Reply-To: <20170609133337.31183-1-marcandre.lureau@redhat.com>
	(=?utf-8?Q?=22Marc-Andr=C3=A9?=
	Lureau"'s message of "Fri, 9 Jun 2017 17:33:37 +0400")
Message-ID: <87pod7o85r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 11 Jul 2017 05:27:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: check-qom-proplist:
 fix leak
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
X-List-Received-Date: Tue, 11 Jul 2017 05:27:23 -0000

Copying qemu-trivial.

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> user_creatable_add_opts() returns a reference (the other reference is
> for the root parent/child link).
>
> Leak introduced in commit a1af255f065cc.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/check-qom-proplist.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
> index 8e432e9ab6..a3cd7ab29f 100644
> --- a/tests/check-qom-proplist.c
> +++ b/tests/check-qom-proplist.c
> @@ -428,6 +428,8 @@ static void test_dummy_createcmdl(void)
>      g_assert(err =3D=3D NULL);
>      error_free(err);
>=20=20
> +    object_unref(OBJECT(dobj));
> +
>      /*
>       * cmdline-parsing via qemu_opts_parse() results in a QemuOpts entry
>       * corresponding to the Object's ID to be added to the QemuOptsList

Reviewed-by: Markus Armbruster <armbru@redhat.com>

