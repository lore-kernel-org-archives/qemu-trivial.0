Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaIhn-0001iE-9v
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 03:25:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaIhl-0001dS-4O
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:25:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaIhk-0001b3-Ha
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:25:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaIhf-0001TU-Cz; Fri, 11 Sep 2015 03:24:59 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 78CB6413F3;
	Fri, 11 Sep 2015 10:24:58 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 62F51A52;
	Fri, 11 Sep 2015 10:24:58 +0300 (MSK)
Message-ID: <55F281CA.4030902@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 10:24:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1441744192-6110-1-git-send-email-marcandre.lureau@redhat.com>
In-Reply-To: <1441744192-6110-1-git-send-email-marcandre.lureau@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] specs/vhost-user.txt: fix name of
	messages
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
X-List-Received-Date: Fri, 11 Sep 2015 07:25:05 -0000

08.09.2015 23:29, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/specs/vhost-user.txt | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/docs/specs/vhost-user.txt b/docs/specs/vhost-user.txt
> index 0322bcf..1bc6adb 100644
> --- a/docs/specs/vhost-user.txt
> +++ b/docs/specs/vhost-user.txt
> @@ -112,19 +112,19 @@ The communication consists of master sending mess=
age requests and slave sending
>  message replies. Most of the requests don't require replies. Here is a=
 list of
>  the ones that do:
> =20
> - * VHOST_GET_FEATURES
> - * VHOST_GET_PROTOCOL_FEATURES
> - * VHOST_GET_VRING_BASE
> + * VHOST_USER_GET_FEATURES
> + * VHOST_USER_GET_PROTOCOL_FEATURES
> + * VHOST_USER_GET_VRING_BASE

The patch doesn't apply to qemu master as vhost-user.txt does not
have VHOST_GET_PROTOCOL_FEATURES in here.  What treee you're basing
your patch on?

Besides, this is quite confusing.  Both VHOST_USER_GET_FEATURES and
VHOST_GET_FEATURES #defines exists and used, which one is which?

Thanks,

/mjt

