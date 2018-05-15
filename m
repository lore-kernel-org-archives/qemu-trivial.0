Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIUbf-0005xR-8v
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 03:42:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fIUbc-0005ux-J4
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 03:42:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fIUbb-0002Iu-EX
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 03:42:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32818 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fIUbW-0002Ec-Pw; Tue, 15 May 2018 03:42:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45F0176FBA;
	Tue, 15 May 2018 07:42:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-100.ams2.redhat.com
	[10.36.116.100])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0686A2026E0E;
	Tue, 15 May 2018 07:42:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B84F41138645; Tue, 15 May 2018 09:42:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	"open list\:All patches CC here" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <20180515055949.6446-1-olaf@aepfle.de>
Date: Tue, 15 May 2018 09:42:36 +0200
In-Reply-To: <20180515055949.6446-1-olaf@aepfle.de> (Olaf Hering's message of
	"Tue, 15 May 2018 07:59:48 +0200")
Message-ID: <87mux1jrf7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 15 May 2018 07:42:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 15 May 2018 07:42:38 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] replace functions which are
 only available in glib-2.24
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
X-List-Received-Date: Tue, 15 May 2018 07:42:46 -0000

Olaf Hering <olaf@aepfle.de> writes:

> Currently the minimal supported version of glib is 2.22.
> Since testing is done with a glib that claims to be 2.22, but in fact
> has APIs from newer version of glib, this bug was not caught during
> submit of the patch referenced below.
>
> Replace g_realloc_n, which is available only since 2.24, with g_renew.

We're about to bump our required GLib version to 2.34.  See
https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg02562.html
Message-ID: <751a3b4f-55ef-dec0-aec9-6b48922b7843@redhat.com>

However, the patch may make sense for stable anyway.

> Fixes commit 418026ca43 ("util: Introduce vfio helpers")
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>
> This must go into stable-2.12.

Please see docs/devel/stable-process.rst for how to get a patch into a
stable release.

>  util/vfio-helpers.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index 006674c916..5fd4f5f212 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -522,8 +522,7 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState *s,
>  
>      assert(index >= 0);
>      s->nr_mappings++;
> -    s->mappings = g_realloc_n(s->mappings, sizeof(s->mappings[0]),
> -                              s->nr_mappings);
> +    s->mappings = g_renew(IOVAMapping *, s->mappings, s->nr_mappings);

I'm afraid this switches from allocating a bunch of IOVAMapping to a
bunch of IOVAMapping *.  My gcc duly warns.

>      insert = &s->mappings[index];
>      shift = s->nr_mappings - index - 1;
>      if (shift) {
> @@ -577,8 +576,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState *s, IOVAMapping *mapping,
>      memmove(mapping, &s->mappings[index + 1],
>              sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
>      s->nr_mappings--;
> -    s->mappings = g_realloc_n(s->mappings, sizeof(s->mappings[0]),
> -                              s->nr_mappings);
> +    s->mappings = g_renew(IOVAMapping *, s->mappings, s->nr_mappings);

Likewise.

>  }
>  
>  /* Check if the mapping list is (ascending) ordered. */

