Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHs8R-0000hL-Ak
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:19:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHs8L-0000YQ-Jf
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:19:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHs8H-0004Ov-4b
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:19:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHs87-0004NA-Aa; Thu, 14 Aug 2014 06:19:35 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EAJJhS004845
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 06:19:19 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7EAJFnB003385; Thu, 14 Aug 2014 06:19:16 -0400
Date: Thu, 14 Aug 2014 12:19:52 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814101952.GD31346@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-2-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1408001361-13580-2-git-send-email-zhang.zhanghailiang@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7EAJJhS004845
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 01/10] l2cap: fix access freed memory
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
X-List-Received-Date: Thu, 14 Aug 2014 10:19:54 -0000

On Thu, Aug 14, 2014 at 03:29:12PM +0800, zhanghailiang wrote:
> Pointer 'ch' will be used in function 'l2cap_channel_open_req_msg' afte=
r
> it was previously freed in 'l2cap_channel_open'.
> Assigned it to NULL after it is freed.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


>=20
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hw/bt/l2cap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/bt/l2cap.c b/hw/bt/l2cap.c
> index 2301d6f..591e047 100644
> --- a/hw/bt/l2cap.c
> +++ b/hw/bt/l2cap.c
> @@ -429,7 +429,7 @@ static struct l2cap_chan_s *l2cap_channel_open(stru=
ct l2cap_instance_s *l2cap,
>                  status =3D L2CAP_CS_NO_INFO;
>              } else {
>                  g_free(ch);
> -
> +                ch =3D NULL;
>                  result =3D L2CAP_CR_NO_MEM;
>                  status =3D L2CAP_CS_NO_INFO;
>              }
> --=20
> 1.7.12.4
>=20

