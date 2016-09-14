Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk4Nv-0008PB-4E
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:13:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4Np-0008Jb-Cs
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:13:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4Nn-0007HS-9l
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:13:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk4Nd-0007Dk-Ij; Wed, 14 Sep 2016 03:13:13 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C80BE417FF;
	Wed, 14 Sep 2016 10:13:11 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 5CAE9AAB;
	Wed, 14 Sep 2016 10:13:11 +0300 (MSK)
To: =?UTF-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
References: <20160708131809.07a8e7dc@fiorina>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <96ed9f00-3edc-1c5d-abdb-c7e6619da244@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:13:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160708131809.07a8e7dc@fiorina>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] curl: Operate on zero-length file
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
X-List-Received-Date: Wed, 14 Sep 2016 07:13:30 -0000

08.07.2016 14:18, Tom=C3=A1=C5=A1 Golembiovsk=C3=BD wrote:
> Another attempt to fix the bug 1596870.
>
> When creating new disk backed by remote file accessed via HTTPS and the
> backing file has zero length, qemu-img terminates with uniformative
> error message:
>
>     qemu-img: disk.qcow2: CURL: Error opening file:
>
> While it may not make much sense to operate on empty file, other block
> backends (e.g. raw backend for regular files) seem to allow it. This
> patch fixes it for the curl backend and improves the reported error.
>
> Signed-off-by: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>
> ---
>  block/curl.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/block/curl.c b/block/curl.c
> index da9f5e8..a8cdb44 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -675,11 +675,28 @@ static int curl_open(BlockDriverState *bs, QDict =
*options, int flags,
>      curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s);
>      if (curl_easy_perform(state->curl))
>          goto out;
> -    curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &=
d);
> -    if (d)
> -        s->len =3D (size_t)d;
> -    else if(!s->len)
> +    if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOA=
D, &d)) {
>          goto out;
> +    }
> +    /* Prior CURL 7.19.4 return value of 0 could mean that the file si=
ze is not
> +     * know or the size is zero. From 7.19.4 CURL returns -1 if size i=
s not
> +     * known and zero if it is realy zero-length file. */
> +#if LIBCURL_VERSION_NUM >=3D 0x071304
> +    if (d < 0) {
> +        pstrcpy(state->errmsg, CURL_ERROR_SIZE,
> +                "Server didn't report file size.");
> +        goto out;
> +    }
> +#else
> +    if (d <=3D 0) {
> +        pstrcpy(state->errmsg, CURL_ERROR_SIZE,
> +                "Unknown file size or zero-length file.");
> +        goto out;
> +    }
> +#endif

This is somewhat ugly ifdeffery, but ohwell..

> +    s->len =3D (size_t)d;
> +
>      if ((!strncasecmp(s->url, "http://", strlen("http://"))
>          || !strncasecmp(s->url, "https://", strlen("https://")))
>          && !s->accept_range) {
>


Applied to -trivial, thank you!

/mjt

