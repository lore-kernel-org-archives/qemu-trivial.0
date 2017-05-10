Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d8QnQ-0001qU-7F
	for mharc-qemu-trivial@gnu.org; Wed, 10 May 2017 08:32:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d8QnO-0001nu-2x
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 08:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d8QnN-0006l6-5C
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 08:32:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1d8QnG-0006hY-SF; Wed, 10 May 2017 08:32:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0354E4E34D;
	Wed, 10 May 2017 12:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0354E4E34D
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0354E4E34D
Received: from [10.36.116.221] (ovpn-116-221.ams2.redhat.com [10.36.116.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D40C18AC40;
	Wed, 10 May 2017 12:32:35 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170506004106.3291-1-f4bug@amsat.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <7f51d88d-0dea-5d64-7c6d-530365e29923@redhat.com>
Date: Wed, 10 May 2017 14:32:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170506004106.3291-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 10 May 2017 12:32:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] syscall: fix compiler
 warnings (clang 5)
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
X-List-Received-Date: Wed, 10 May 2017 12:32:47 -0000

On 06/05/2017 02:41, Philippe Mathieu-Daud=C3=A9 wrote:
> static code analyzer complain:
>=20
> linux-user/syscall.c:5575:9: warning: Dereference of undefined pointer =
value
>     if (*host_rt_dev_ptr !=3D 0) {
>         ^~~~~~~~~~~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index cec8428589..c541e22693 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5526,7 +5526,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie,=
 uint8_t *buf_temp,
>      int target_size;
>      void *argptr;
>      abi_ulong *target_rt_dev_ptr;
> -    unsigned long *host_rt_dev_ptr;
> +    unsigned long *host_rt_dev_ptr =3D NULL;
>      abi_long ret;
>      int i;
> =20
> @@ -5572,7 +5572,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie,=
 uint8_t *buf_temp,
>      unlock_user(argptr, arg, 0);
> =20
>      ret =3D get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));

I think we should "assert(host_rt_dev_ptr)" here. It's a bug if
host_rt_dev_ptr is not set.

The "for" loop scans the structure to find the rt_dev field, and we
should always enter in the first "if", so "host_rt_dev_ptr" is always set=
.

> -    if (*host_rt_dev_ptr !=3D 0) {
> +    if (host_rt_dev_ptr !=3D NULL && *host_rt_dev_ptr !=3D 0) {
>          unlock_user((void *)*host_rt_dev_ptr,
>                      *target_rt_dev_ptr, 0);
>      }
>=20

Laurent

