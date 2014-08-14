Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHs4z-0006cZ-70
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:16:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHs4t-0006Uo-8o
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:16:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHs4o-0003fE-P4
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:16:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHs4f-0003eN-Tf; Thu, 14 Aug 2014 06:16:02 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EAFOfh003002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 06:15:24 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7EAFJCf030574; Thu, 14 Aug 2014 06:15:20 -0400
Date: Thu, 14 Aug 2014 12:15:57 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814101557.GB31346@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-6-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1408001361-13580-6-git-send-email-zhang.zhanghailiang@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7EAFOfh003002
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 05/10] util/path: Use the GLib memory
 allocation routines
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
X-List-Received-Date: Thu, 14 Aug 2014 10:16:19 -0000

On Thu, Aug 14, 2014 at 03:29:16PM +0800, zhanghailiang wrote:
> In this file, we don't check the return value of malloc/strdup/realloc =
which may fail.
> Instead of using these routines, we use the GLib memory APIs g_malloc/g=
_strdup/g_realloc.
> They will exit on allocation failure, so there is no need to test for f=
ailure,
> which would be fine for setup.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  util/path.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/util/path.c b/util/path.c
> index 5c59d9f..e152f2a 100644
> --- a/util/path.c
> +++ b/util/path.c
> @@ -45,8 +45,8 @@ static struct pathelem *new_entry(const char *root,
>                                    struct pathelem *parent,
>                                    const char *name)
>  {
> -    struct pathelem *new =3D malloc(sizeof(*new));
> -    new->name =3D strdup(name);
> +    struct pathelem *new =3D g_malloc(sizeof(*new));
> +    new->name =3D g_strdup(name);
>      new->pathname =3D g_strdup_printf("%s/%s", root, name);
>      new->num_entries =3D 0;
>      return new;

Would not we have to free name using g_free as well?

> @@ -88,7 +88,7 @@ static struct pathelem *add_entry(struct pathelem *ro=
ot, const char *name,
> =20
>      root->num_entries++;
> =20
> -    root =3D realloc(root, sizeof(*root)
> +    root =3D g_realloc(root, sizeof(*root)
>                     + sizeof(root->entries[0])*root->num_entries);
>      e =3D &root->entries[root->num_entries-1];

> --=20
> 1.7.12.4
>=20

