Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VqMZ0-0005wx-Lm
	for mharc-qemu-trivial@gnu.org; Tue, 10 Dec 2013 07:37:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VqMYu-0005pv-Sl
	for qemu-trivial@nongnu.org; Tue, 10 Dec 2013 07:37:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VqMYm-0005cw-R0
	for qemu-trivial@nongnu.org; Tue, 10 Dec 2013 07:37:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:11733)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VqMYZ-0005aE-Vy; Tue, 10 Dec 2013 07:36:56 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBACasn1018260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 10 Dec 2013 07:36:54 -0500
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
	[10.36.116.111])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBACaoWN013770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 Dec 2013 07:36:53 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EBB90200CC; Tue, 10 Dec 2013 13:12:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <1386675153-1147-1-git-send-email-imammedo@redhat.com>
Date: Tue, 10 Dec 2013 13:12:14 +0100
In-Reply-To: <1386675153-1147-1-git-send-email-imammedo@redhat.com> (Igor
	Mammedov's message of "Tue, 10 Dec 2013 12:32:33 +0100")
Message-ID: <87a9g8lxb5.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix build regression in
	qxl-render.c caused by ac86048
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
X-List-Received-Date: Tue, 10 Dec 2013 12:37:22 -0000

Igor Mammedov <imammedo@redhat.com> writes:

> fixes regression caused by commit
>   ac86048 trace: Remove trace.h from console.h (less dependencies)
> which makes build fail with:
>
> hw/display/qxl-render.c: In function =E2=80=98qxl_blit=E2=80=99:
> hw/display/qxl-render.c:34:5: error: implicit declaration of function =E2=
=80=98trace_qxl_render_blit=E2=80=99 [-Werror=3Dimplicit-function-declarati=
on]
>      trace_qxl_render_blit(qxl->guest_primary.qxl_stride,
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/display/qxl-render.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> index d34b0c4..84f1367 100644
> --- a/hw/display/qxl-render.c
> +++ b/hw/display/qxl-render.c
> @@ -20,6 +20,7 @@
>   */
>=20=20
>  #include "qxl.h"
> +#include "trace.h"
>=20=20
>  static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)
>  {

Fix is pending already:
https://lists.nongnu.org/archive/html/qemu-devel/2013-12/msg01314.html

