Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQrd0-0008M4-Ea
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 02:13:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQrcx-0008Hx-N3
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 02:13:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQrcw-00029i-R8
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 02:13:23 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aQrcr-00028n-1j; Wed, 03 Feb 2016 02:13:17 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C042D403BC;
	Wed,  3 Feb 2016 10:13:16 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1454469583-15753-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56B1A88C.6020604@msgid.tls.msk.ru>
Date: Wed, 3 Feb 2016 10:13:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1454469583-15753-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] Fix inconsistency between comment and
	variable name
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
X-List-Received-Date: Wed, 03 Feb 2016 07:13:24 -0000

03.02.2016 06:19, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  include/hw/qdev-core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index abcdee8..42fa5db 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -221,7 +221,7 @@ typedef struct BusChild {
> =20
>  /**
>   * BusState:
> - * @hotplug_device: link to a hotplug device associated with bus.
> + * @hotplug_handler: link to a hotplug device associated with bus.

Hmm.  Now while the field name in comment and in the structure
do match, the comment is still wrong, since it is a linke to
a handler, not a device=85 :)

Thanks,

/mjt

