Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d804m-0005PD-IY
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 04:00:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d804h-0005MK-7T
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 04:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d804b-00050O-KV
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 04:00:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d804R-0004xi-FK; Tue, 09 May 2017 04:00:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17B84C04B94A;
	Tue,  9 May 2017 08:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 17B84C04B94A
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 17B84C04B94A
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3900A2501;
	Tue,  9 May 2017 08:00:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4F57F1138648; Tue,  9 May 2017 10:00:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-devel@nongnu.org,  QEMU Trivial <qemu-trivial@nongnu.org>,  Paolo
	Bonzini <pbonzini@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
	<alex.bennee@linaro.org>
References: <1494266456-2251-1-git-send-email-jcmvbkbc@gmail.com>
Date: Tue, 09 May 2017 10:00:32 +0200
In-Reply-To: <1494266456-2251-1-git-send-email-jcmvbkbc@gmail.com> (Max
	Filippov's message of "Mon, 8 May 2017 11:00:56 -0700")
Message-ID: <87lgq61mu7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 09 May 2017 08:00:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/xtensa: sim: use
 g_string/g_new
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
X-List-Received-Date: Tue, 09 May 2017 08:00:55 -0000

Max Filippov <jcmvbkbc@gmail.com> writes:

> Replace malloc/free/sprintf with g_string/g_string_printf/g_string_free.
> Replace g_malloc with g_new when allocating the MemoryRegion to get more
> type safety.
>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  hw/xtensa/sim.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> index d2d1d3a..b27e28d 100644
> --- a/hw/xtensa/sim.c
> +++ b/hw/xtensa/sim.c
> @@ -41,21 +41,21 @@ static void xtensa_create_memory_regions(const Xtensa=
Memory *memory,
>                                           const char *name)
>  {
>      unsigned i;
> -    char *num_name =3D malloc(strlen(name) + sizeof(i) * 3 + 1);
> +    GString *num_name =3D g_string_new(NULL);
>=20=20
>      for (i =3D 0; i < memory->num; ++i) {
>          MemoryRegion *m;
>=20=20
> -        sprintf(num_name, "%s%u", name, i);
> -        m =3D g_malloc(sizeof(*m));
> -        memory_region_init_ram(m, NULL, num_name,
> +        g_string_printf(num_name, "%s%u", name, i);

I'd make that

           num_name =3D g_strdup_printf("%s%u, name, i);

for less churn.  Have to free(num_name) in the loop, of course.

> +        m =3D g_new(MemoryRegion, 1);
> +        memory_region_init_ram(m, NULL, num_name->str,
>                                 memory->location[i].size,
>                                 &error_fatal);
>          vmstate_register_ram_global(m);
>          memory_region_add_subregion(get_system_memory(),
>                                      memory->location[i].addr, m);
>      }
> -    free(num_name);
> +    g_string_free(num_name, true);
>  }
>=20=20
>  static uint64_t translate_phys_addr(void *opaque, uint64_t addr)

