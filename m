Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1SUn-0005ri-87
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 03:29:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1e1SUk-0005qA-Nw
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 03:28:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1e1SUj-0005t8-TY
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 03:28:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1e1SUf-0005rQ-AT; Mon, 09 Oct 2017 03:28:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D75C81DE9;
	Mon,  9 Oct 2017 07:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3D75C81DE9
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-91.ams2.redhat.com
	[10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EB2D6F114;
	Mon,  9 Oct 2017 07:28:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 10258113298A; Mon,  9 Oct 2017 09:28:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,  Eric
	Blake <eblake@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,  Laurent Vivier
	<lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf
	<kwolf@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
	<marcandre.lureau@redhat.com>, qemu trival <qemu-trivial@nongnu.org>, 
	qemu-devel@nongnu.org
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-3-f4bug@amsat.org>
Date: Mon, 09 Oct 2017 09:28:48 +0200
In-Reply-To: <20171006235023.11952-3-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 6 Oct 2017 20:48:57
	-0300")
Message-ID: <87vajord8v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 09 Oct 2017 07:28:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 02/88] cocci: add more
 g_new() transformations
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
X-List-Received-Date: Mon, 09 Oct 2017 07:28:59 -0000

The commit message should explain the additional transformations briefly
and informally.  In particular, why they're a good idea.  Same for PATCH
3-5.

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/coccinelle/g_new.cocci | 73 ++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 73 insertions(+)
>
> diff --git a/scripts/coccinelle/g_new.cocci b/scripts/coccinelle/g_new.co=
cci
> index 1e57685a6b..c767325a21 100644
> --- a/scripts/coccinelle/g_new.cocci
> +++ b/scripts/coccinelle/g_new.cocci
> @@ -80,6 +80,49 @@ expression p, n;
>  -g_try_realloc(p, sizeof(T) * (n))
>  +g_try_renew(T, p, n)
>=20=20
> +@@
> +type T;
> +expression n;
> +@@
> +(
> +-g_malloc_n(n, sizeof(T))
> ++g_new(T, n)
> +|
> +-g_malloc0_n(n, sizeof(T))
> ++g_new0(T, n)
> +|
> +-g_try_malloc_n(n, sizeof(T))
> ++g_try_new(T, n)
> +|
> +-g_try_malloc0_n(n, sizeof(T))
> ++g_try_new0(T, n)
> +)
> +
> +@@
> +type T;
> +identifier m;
> +@@
> +T *m;
> +...
> +(
> +-m =3D g_malloc(sizeof(*m));
> ++m =3D g_new(T, 1);
> +|
> +-m =3D g_malloc0(sizeof(*m));
> ++m =3D g_new0(T, 1);
> +|
> +-m =3D g_try_malloc(sizeof(*m));
> ++m =3D g_try_new(T, 1);
> +|
> +-m =3D g_try_malloc0(sizeof(*m));
> ++m =3D g_try_new0(T, 1);
> +)
> +
> +////////////////////////////////////////

Please scratch this line.  Overly elaborate comment decoration.

> +//
> +// last transformations: cleanups
> +//
> +
>  // drop superfluous cast
>  @@
>  type T;
> @@ -99,3 +142,33 @@ expression p, n;
>  @@
>  -(T *)g_renew(T, p, n)
>  +g_renew(T, p, n)
> +@@
> +type T;
> +expression n;
> +@@
> +(
> +-(T *)g_try_new(T, n)
> ++g_try_new(T, n)
> +|
> +-(T *)g_try_new0(T, n)
> ++g_try_new0(T, n)
> +)
> +
> +// drop superfluous parenthesis
> +@@
> +type T;
> +expression c;
> +@@
> +(
> +-g_new(T, (c))
> ++g_new(T, c)
> +|
> +-g_try_new(T, (c))
> ++g_try_new(T, c)
> +|
> +-g_new0(T, (c))
> ++g_new0(T, c)
> +|
> +-g_try_new0(T, (c))
> ++g_try_new0(T, c)
> +)

