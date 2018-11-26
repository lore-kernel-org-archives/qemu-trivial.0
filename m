Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRDch-0002B9-6y
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 04:56:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gRDce-00029z-TC
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:56:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gRDcZ-0004wl-VR
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:56:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56644)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gRDcO-0004Pn-61; Mon, 26 Nov 2018 04:55:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3660B307EAA2;
	Mon, 26 Nov 2018 09:55:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC76F6147C;
	Mon, 26 Nov 2018 09:55:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 487BC11385F2; Mon, 26 Nov 2018 10:55:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-19-philmd@redhat.com>
Date: Mon, 26 Nov 2018 10:55:44 +0100
In-Reply-To: <20181125205000.10324-19-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun,
	25 Nov 2018 21:49:53 +0100")
Message-ID: <87o9acnowv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 26 Nov 2018 09:55:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-3.1 18/25] MAINTAINERS:
 Add missing entries for the QObject section
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
X-List-Received-Date: Mon, 26 Nov 2018 09:56:09 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 28e5038c73..ac5d25491f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1846,12 +1846,18 @@ S: Supported
>  F: qobject/
>  F: include/qapi/qmp/
>  X: include/qapi/qmp/dispatch.h
> +F: include/qemu/qdist.h

This isn't part of QObject.

>  F: scripts/coccinelle/qobject.cocci
>  F: tests/check-qdict.c
> -F: tests/check-qnum.c
>  F: tests/check-qjson.c
>  F: tests/check-qlist.c
> +F: tests/check-qlit.c
> +F: tests/check-qnull.c
> +F: tests/check-qnum.c
> +F: tests/check-qobject.c

There are good.

>  F: tests/check-qstring.c
> +F: tests/test-qdist.c

Not part of QObject.

> +F: qdict-test-data.txt

Good.  Should be moved to tests/, but not in this series.

>  T: git https://repo.or.cz/qemu/armbru.git qapi-next
>=20=20
>  QEMU Guest Agent

