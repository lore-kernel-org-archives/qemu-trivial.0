Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRcu5-0000hV-Jw
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 05:46:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRctz-0000cp-7g
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:46:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRcty-0007cj-FJ
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:46:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55620)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRctr-0007Zw-T5; Thu, 12 Jan 2017 05:46:32 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B71C640A0E;
	Thu, 12 Jan 2017 13:46:31 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 01D8D54C;
	Thu, 12 Jan 2017 13:46:31 +0300 (MSK)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20161212173151.18092-1-marcandre.lureau@redhat.com>
	<20161212173151.18092-2-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <cd10cc95-39dc-d960-ac06-f7c9f0946df3@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 13:46:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161212173151.18092-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 2/3] object.h: improve
 OBJECT/OBJECT_CLASS doc
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
X-List-Received-Date: Thu, 12 Jan 2017 10:46:44 -0000

12.12.2016 20:31, Marc-Andr=C3=A9 Lureau wrote:
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qom/object.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/qom/object.h b/include/qom/object.h
> index c5e6fc1f5d..c5456db05d 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -467,7 +467,7 @@ struct TypeInfo
>   * OBJECT:
>   * @obj: A derivative of #Object
>   *
> - * Converts an object to a #Object.  Since all objects are #Objects,
> + * Converts an object to a #Object.  Since all objects are #Object,
>   * this function will always succeed.

I'm not sure this is a good change. Yes the type name is "Object"
(singular), but we refer to multiple objectS (plural), so... :)
If we had some coloring, we'd wrote it like, eg, #<b>Object</b>s,
with "s" being outside of the type name.

Thanks,

/mjt

