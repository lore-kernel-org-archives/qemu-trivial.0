Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAWja-00025m-38
	for mharc-qemu-trivial@gnu.org; Tue, 16 May 2017 03:17:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dAWjX-000242-MQ
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 03:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1dAWjW-0002Cu-Rt
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 03:17:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1dAWjQ-00028i-HM; Tue, 16 May 2017 03:17:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 027C4461FE;
	Tue, 16 May 2017 07:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 027C4461FE
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 027C4461FE
Received: from [10.36.116.195] (ovpn-116-195.ams2.redhat.com [10.36.116.195])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEE3F1824B;
	Tue, 16 May 2017 07:17:16 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	Peter Lieven <pl@kamp.de>
References: <20170516001150.11508-1-f4bug@amsat.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <c84e4ef1-586b-6bb8-0a29-52d14dd7bd81@redhat.com>
Date: Tue, 16 May 2017 09:17:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170516001150.11508-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 16 May 2017 07:17:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] oslib: strip trailing '\n' from
 error_setg() string argument
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
X-List-Received-Date: Tue, 16 May 2017 07:17:28 -0000

On 16/05/2017 02:11, Philippe Mathieu-Daud=C3=A9 wrote:
> spotted by Coccinelle script scripts/coccinelle/err-bad-newline.cocci
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  util/oslib-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 4d9189e9ef..7ca02f0103 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -447,7 +447,7 @@ void os_mem_prealloc(int fd, char *area, size_t mem=
ory, int smp_cpus,
>      /* touch pages simultaneously */
>      if (touch_all_pages(area, hpagesize, numpages, smp_cpus)) {
>          error_setg(errp, "os_mem_prealloc: Insufficient free host memo=
ry "
> -            "pages available to allocate guest RAM\n");
> +            "pages available to allocate guest RAM");
>      }
> =20
>      ret =3D sigaction(SIGBUS, &oldact, NULL);
>=20
Reviewed-by: Laurent Vivier <lvivier@redhat.com>


