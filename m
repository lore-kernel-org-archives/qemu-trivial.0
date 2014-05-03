Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgVSm-0001w8-0i
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 04:38:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVSg-0001pD-3s
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 04:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVSb-0004Gq-Ev
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 04:38:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WgVSS-0004Dh-4W; Sat, 03 May 2014 04:38:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C26994027E;
	Sat,  3 May 2014 12:38:06 +0400 (MSK)
Message-ID: <5364AAEE.7000500@msgid.tls.msk.ru>
Date: Sat, 03 May 2014 12:38:06 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1398725186-8202-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1398725186-8202-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?B?QW5kcmVhcyA=?= =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qmp: Report path ambiguity error.
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 03 May 2014 08:38:26 -0000

29.04.2014 02:46, Hani Benhabiles wrote:
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> Suggested-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  qmp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/qmp.c b/qmp.c
> index 74107be..0d49abf 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -199,7 +199,10 @@ ObjectPropertyInfoList *qmp_qom_list(const char *p=
ath, Error **errp)
>      ObjectProperty *prop;
> =20
>      obj =3D object_resolve_path(path, &ambiguous);
> -    if (obj =3D=3D NULL) {
> +    if (ambiguous) {
> +        error_setg(errp, "Path '%s' is ambiguous", path);
> +        return NULL;
> +    } else if (obj =3D=3D NULL) {
>          error_set(errp, QERR_DEVICE_NOT_FOUND, path);
>          return NULL;
>      }

How about this:

--- a/qmp.c
+++ b/qmp.c
@@ -200,7 +200,9 @@ ObjectPropertyInfoList *qmp_qom_list(const char *path=
, Error **errp)

     obj =3D object_resolve_path(path, &ambiguous);
     if (obj =3D=3D NULL) {
-        error_set(errp, QERR_DEVICE_NOT_FOUND, path);
+        error_set(errp,
+                  ambiguous ? "Path '%s' is ambiguous" : QERR_DEVICE_NOT=
_FOUND,
+                  path);
         return NULL;
     }

The difference here is that we test "ambiguous" variable only if obj is N=
ULL,
ie, only on error path.  Please note that object_resolve_path() does not
initialize *ambiguous in all code paths.

Thanks,

/mjt

