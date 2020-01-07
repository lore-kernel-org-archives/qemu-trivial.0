Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iok4V-0001yM-55
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 03:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <arei.gonglei@huawei.com>) id 1iok4N-0001gx-E4
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 03:18:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <arei.gonglei@huawei.com>) id 1iok4M-0005eY-6E
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 03:18:31 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2485 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <arei.gonglei@huawei.com>)
 id 1iok4J-0005TJ-CP; Tue, 07 Jan 2020 03:18:27 -0500
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 75A044EAAA86566CD5EF;
 Tue,  7 Jan 2020 16:18:18 +0800 (CST)
Received: from DGGEML531-MBS.china.huawei.com ([169.254.5.203]) by
 dggeml406-hub.china.huawei.com ([10.3.17.50]) with mapi id 14.03.0439.000;
 Tue, 7 Jan 2020 16:18:10 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: RE: [PATCH v1 29/59] cryptodev-vhost.c: remove unneeded 'err' label
 in cryptodev_vhost_start
Thread-Topic: [PATCH v1 29/59] cryptodev-vhost.c: remove unneeded 'err'
 label in cryptodev_vhost_start
Thread-Index: AQHVxL65BOsM+4D/zEWd9ZrocadbLqfe3ASg
Date: Tue, 7 Jan 2020 08:18:09 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020DB6093B9@dggeml531-mbs.china.huawei.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-30-danielhb413@gmail.com>
In-Reply-To: <20200106182425.20312-30-danielhb413@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.133.225.234]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.188
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2020 08:18:36 -0000


> -----Original Message-----
> From: Daniel Henrique Barboza [mailto:danielhb413@gmail.com]
> Sent: Tuesday, January 7, 2020 2:24 AM
> To: qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org; Daniel Henrique Barboza
> <danielhb413@gmail.com>; Gonglei (Arei) <arei.gonglei@huawei.com>
> Subject: [PATCH v1 29/59] cryptodev-vhost.c: remove unneeded 'err' label =
in
> cryptodev_vhost_start
>=20
> 'err' can be replaced by 'return r'.
>=20
> CC: Gonglei <arei.gonglei@huawei.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  backends/cryptodev-vhost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Gonglei <arei.gonglei@huawei.com>


> diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c inde=
x
> 8337c9a495..907ca21fa7 100644
> --- a/backends/cryptodev-vhost.c
> +++ b/backends/cryptodev-vhost.c
> @@ -201,7 +201,7 @@ int cryptodev_vhost_start(VirtIODevice *dev, int
> total_queues)
>      r =3D k->set_guest_notifiers(qbus->parent, total_queues, true);
>      if (r < 0) {
>          error_report("error binding guest notifier: %d", -r);
> -        goto err;
> +        return r;
>      }
>=20
>      for (i =3D 0; i < total_queues; i++) { @@ -236,7 +236,7 @@ err_start=
:
>      if (e < 0) {
>          error_report("vhost guest notifier cleanup failed: %d", e);
>      }
> -err:
> +
>      return r;
>  }
>=20
> --
> 2.24.1


