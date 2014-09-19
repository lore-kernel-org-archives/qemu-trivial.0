Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUslE-0000rX-0H
	for mharc-qemu-trivial@gnu.org; Fri, 19 Sep 2014 03:37:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XUsl6-0000g2-KA
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 03:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XUsl1-0001v9-HP
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 03:37:36 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:16572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XUsl0-0001uS-N8; Fri, 19 Sep 2014 03:37:31 -0400
Received: from 172.24.2.119 (EHLO SZXEMA406-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBW60232; Fri, 19 Sep 2014 15:37:15 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.188]) by
	SZXEMA406-HUB.china.huawei.com ([10.82.72.38]) with mapi id
	14.03.0158.001; Fri, 19 Sep 2014 15:37:12 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Markus Armbruster <armbru@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] qemu-socket: Polish errors for connect()
	and	listen() failure
Thread-Index: AQHP09tsndk+dvLVpUW7bJv2VaR+9ZwIECOQ
Date: Fri, 19 Sep 2014 07:37:11 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086DD8292@SZXEMA503-MBS.china.huawei.com>
References: <1411111624-3064-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1411111624-3064-1-git-send-email-armbru@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.19.102]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"lcapitulino@redhat.com" <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-socket: Polish errors
 for connect() and	listen() failure
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
X-List-Received-Date: Fri, 19 Sep 2014 07:37:41 -0000

> Subject: [Qemu-devel] [PATCH] qemu-socket: Polish errors for connect() an=
d
> listen() failure
>=20
> connect() doesn't "connect to socket", it connects a socket to an
> address and, if it's of type SOCK_STREAM, initiates a connection.
> Scratch "to".
>=20
> listen() does "set socket to listening mode", but it sounds awkward.
> Change to "listen on socket".
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/qmp/qerror.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

And Cc'ing qemu-trivial@

Best regards,
-Gonglei

> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index 902d1a7..774e75d 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -155,10 +155,10 @@ void qerror_report_err(Error *err);
>      ERROR_CLASS_GENERIC_ERROR, "this feature or command is not
> currently supported"
>=20
>  #define QERR_SOCKET_CONNECT_FAILED \
> -    ERROR_CLASS_GENERIC_ERROR, "Failed to connect to socket"
> +    ERROR_CLASS_GENERIC_ERROR, "Failed to connect socket"
>=20
>  #define QERR_SOCKET_LISTEN_FAILED \
> -    ERROR_CLASS_GENERIC_ERROR, "Failed to set socket to listening mode"
> +    ERROR_CLASS_GENERIC_ERROR, "Failed to listen on socket"
>=20
>  #define QERR_SOCKET_BIND_FAILED \
>      ERROR_CLASS_GENERIC_ERROR, "Failed to bind socket"
> --
> 1.9.3
>=20


