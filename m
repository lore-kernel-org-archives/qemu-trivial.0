Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0Fmm-0006rU-5G
	for mharc-qemu-trivial@gnu.org; Sat, 02 Mar 2019 20:19:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h0Fmk-0006oY-3V
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 20:19:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1h0Fmj-0000cx-Ea
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 20:19:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57576)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1h0Fmh-0000Zj-OQ; Sat, 02 Mar 2019 20:19:19 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56EDE30EBE70;
	Sun,  3 Mar 2019 01:12:32 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F58D100194A;
	Sun,  3 Mar 2019 01:12:26 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20190302223825.11192-1-philmd@redhat.com>
	<20190302223825.11192-3-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <26f2a83e-588a-c26c-86dc-51d5b8170ae9@redhat.com>
Date: Sat, 2 Mar 2019 19:12:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190302223825.11192-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Sun, 03 Mar 2019 01:12:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] util/error: Remove
 unnecessary saved_errno
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
X-List-Received-Date: Sun, 03 Mar 2019 01:19:22 -0000

On 3/2/19 4:38 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Since 552375088a8, error_set_errno() calls error_setv() which
> already protect errno for clobbering.
> Remove the now unnecessary saved_errno.
>=20
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  util/error.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/util/error.c b/util/error.c
> index 934a78e1b1..0402fa1b9d 100644
> --- a/util/error.c
> +++ b/util/error.c
> @@ -101,14 +101,11 @@ void error_setg_errno_internal(Error **errp,
>                                 int os_errno, const char *fmt, ...)
>  {
>      va_list ap;
> -    int saved_errno =3D errno;
> =20
>      va_start(ap, fmt);
>      error_setv(errp, src, line, func, ERROR_CLASS_GENERIC_ERROR, fmt, =
ap,
>                 os_errno !=3D 0 ? strerror(os_errno) : NULL);
>      va_end(ap);
> -
> -    errno =3D saved_errno;

NACK. strerror() can clobber errno, so you still need to restore
saved_errno, regardless of what error_setv() does internally.
--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

