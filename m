Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHv5I-000892-Ip
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 11:37:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1bHv5F-00085k-Ic
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1bHv5E-0000x3-Fb
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 11:37:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1bHv50-0000rl-W5; Tue, 28 Jun 2016 11:37:39 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A1D2C00F702;
	Tue, 28 Jun 2016 15:37:38 +0000 (UTC)
Received: from noname.redhat.com (ovpn-116-75.ams2.redhat.com [10.36.116.75])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5SFbaSX022385; Tue, 28 Jun 2016 11:37:37 -0400
Date: Tue, 28 Jun 2016 17:37:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?utf-8?B?VG9tw6HFoSBHb2xlbWJpb3Zza8O9?= <tgolembi@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <20160628153736.GK6800@noname.redhat.com>
References: <20160628123734.500a3114@fiorina>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160628123734.500a3114@fiorina>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 28 Jun 2016 15:37:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] curl: Operate on
 zero-length file
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
X-List-Received-Date: Tue, 28 Jun 2016 15:37:54 -0000

Am 28.06.2016 um 12:37 hat Tom=C3=A1=C5=A1 Golembiovsk=C3=BD geschrieben:
> This is an attempt to fix small bug 1596870.
>=20
> When creating new disk backed by remote file accessed via HTTPS and the
> backing file has zero length, qemu-img terminates with uniformative
> error message:
>=20
>     qemu-img: disk.qcow2: CURL: Error opening file:
>=20
> While it may not make much sense to operate on empty file, other block
> backends (e.g. raw backend for regular files) seem to allow it. This
> patch fixes it for the curl backend.
>=20
> Signed-off-by: Tom=C3=A1=C5=A1 Golembiovsk=C3=BD <tgolembi@redhat.com>
> ---
>  block/curl.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/block/curl.c b/block/curl.c
> index da9f5e8..ee6c5ea 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -675,11 +675,17 @@ static int curl_open(BlockDriverState *bs, QDict =
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
> +    if (d < 0) {
> +        pstrcpy(state->errmsg, CURL_ERROR_SIZE,
> +                "Received invalid file length.");
> +        goto out;
> +    }

Actually, it seems that d =3D=3D -1 means that there is no information ab=
out
the file length, so maybe the error message could be a bit more precise.


A possible problem with the patch is that curl changed its behaviour in
version 7.19.4. Before this version, it used to return 0 for a missing
length, so we can't distinguish these cases on older versions. It's
probably more common not to have the file length than having a
zero-length file.

Do we care about older versions? Commit 8a8f584 suggests that we did
three years ago, it added an #if for a feature added in 7.19.4. Not sure
if we do any more. RHEL 6 seems to be new enough.

But if we do care, I guess we could do a similar #if that enables your
code for newer curl versions and keeps erroring out for older versions.

Any opinions on whether we still care about curl versions that old?

> +    s->len =3D (size_t)d;
> +
>      if ((!strncasecmp(s->url, "http://", strlen("http://"))
>          || !strncasecmp(s->url, "https://", strlen("https://")))
>          && !s->accept_range) {

Kevin

