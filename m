Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1SQQ-0003sH-Cp
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 03:24:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1e1SQN-0003qG-Sw
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 03:24:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1e1SQM-0003sn-L3
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 03:24:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47734)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1e1SQH-0003rA-M5; Mon, 09 Oct 2017 03:24:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33A8313AA0;
	Mon,  9 Oct 2017 07:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 33A8313AA0
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-91.ams2.redhat.com
	[10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE73E5D753;
	Mon,  9 Oct 2017 07:24:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5089B113298A; Mon,  9 Oct 2017 09:24:16 +0200 (CEST)
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
	<20171006235023.11952-2-f4bug@amsat.org>
Date: Mon, 09 Oct 2017 09:24:16 +0200
In-Reply-To: <20171006235023.11952-2-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 6 Oct 2017 20:48:56
	-0300")
Message-ID: <871smcss0v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 09 Oct 2017 07:24:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/88] cocci: script to use
 g_new() & friends
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
X-List-Received-Date: Mon, 09 Oct 2017 07:24:29 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Imported from Markus Armbruster commit b45c03f
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Signed-off-by: Markus Armbruster <armbru@redhat.com>?
>
>  scripts/coccinelle/g_new.cocci | 101 +++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 scripts/coccinelle/g_new.cocci
>
> diff --git a/scripts/coccinelle/g_new.cocci b/scripts/coccinelle/g_new.co=
cci
> new file mode 100644
> index 0000000000..1e57685a6b
> --- /dev/null
> +++ b/scripts/coccinelle/g_new.cocci
> @@ -0,0 +1,101 @@
> +/* transform g_new*() alloc with size arguments of the form sizeof(T) [*=
 N]

Confusing.  Sounds like we transform g_new() into something else.  Also,
wing both ends of the comment, and start with a capital letter.

> + *
> + *   g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safe=
r,
> + *   for two reasons.  One, it catches multiplication overflowing size_t.
> + *   two, it returns T * rather than void *, which lets the compiler cat=
ch

Start your sentences with a capital letter.  Or rather, keep my commit
message's capital letters intact ;)

> + *   more type errors.
> + *
> + *    Copyright: (C) 2017 Markus Armbruster <armbru@redhat.com>. GPLv2+.

If you want to put a copyright note into this file, you should stick to
the common format:

/*
 * Rewrite memory allocations to use g_new() & friends
 *
 * Copyright (C) 2014-2017 Red Hat, Inc.
 *
 * Authors:
 *  Markus Armbruster <armbru@redhat.com>,
 *
 * This work is licensed under the terms of the GNU GPL, version 2 or later.
 * See the COPYING file in the top-level directory.
 */

> + *    (Imported from b45c03f585ea9bb1af76c73e82195418c294919d)

Scratch this line.  It's in the commit message, and that suffices.

> + *
> + * See http://lists.nongnu.org/archive/html/qemu-devel/2017-09/msg00908.=
html:
> + *
> + *   g_new() advantages (from glib doc):
> + *   - the returned pointer is cast to a pointer to the given type.
> + *   - care is taken to avoid overflow when calculating the size of the
> + *   allocated block.

Repeats what you just said in the text pasted from my commit message.

> + *
> + *   p =3D g_malloc(sizeof(*p)) is idiomatic, and not obviously inferior=
 to
> + *   p =3D g_new(T, 1), where T is the type of *p.
> + *   But once you add multiplication, g_new() adds something useful: ove=
rflow
> + *   protection.  Conversion to g_new() might make sense then.
> + */

This part doesn't really apply, yet: the semantic patch doesn't deal
with sizeof(*p).

Please write a coherent introduction instead of a series of quotations.

> +
> +@@
> +type T;
> +@@
> +-g_malloc(sizeof(T))
> ++g_new(T, 1)
> +@@
> +type T;
> +@@
> +-g_try_malloc(sizeof(T))
> ++g_try_new(T, 1)
> +@@
> +type T;
> +@@
> +-g_malloc0(sizeof(T))
> ++g_new0(T, 1)
> +@@
> +type T;
> +@@
> +-g_try_malloc0(sizeof(T))
> ++g_try_new0(T, 1)
> +

Any particular reason for adding this blank line?

You add more below, and a comment.  Okay, but I'd commit the script
exactly as given in commit b45c03f, then add improvements on top.

> +@@
> +type T;
> +expression n;
> +@@
> +-g_malloc(sizeof(T) * (n))
> ++g_new(T, n)
> +@@
> +type T;
> +expression n;
> +@@
> +-g_try_malloc(sizeof(T) * (n))
> ++g_try_new(T, n)
> +@@
> +type T;
> +expression n;
> +@@
> +-g_malloc0(sizeof(T) * (n))
> ++g_new0(T, n)
> +@@
> +type T;
> +expression n;
> +@@
> +-g_try_malloc0(sizeof(T) * (n))
> ++g_try_new0(T, n)
> +
> +@@
> +type T;
> +expression p, n;
> +@@
> +-g_realloc(p, sizeof(T) * (n))
> ++g_renew(T, p, n)
> +@@
> +type T;
> +expression p, n;
> +@@
> +-g_try_realloc(p, sizeof(T) * (n))
> ++g_try_renew(T, p, n)
> +
> +// drop superfluous cast
> +@@
> +type T;
> +expression n;
> +@@
> +-(T *)g_new(T, n)
> ++g_new(T, n)
> +@@
> +type T;
> +expression n;
> +@@
> +-(T *)g_new0(T, n)
> ++g_new0(T, n)
> +@@
> +type T;
> +expression p, n;
> +@@
> +-(T *)g_renew(T, p, n)
> ++g_renew(T, p, n)

