Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ti4FE-0005RU-NT
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 09:22:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Ti4F6-0005R9-QK
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 09:22:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Ti4F5-0007vT-3d
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 09:22:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:64911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Ti4F4-0007vI-Rt
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 09:21:59 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBAELpJS013682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Dec 2012 09:21:52 -0500
Received: from localhost (vpn1-112-23.nay.redhat.com [10.66.112.23])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qBAELodS010417; Mon, 10 Dec 2012 09:21:51 -0500
Date: Mon, 10 Dec 2012 22:21:33 +0800
From: Amos Kong <akong@redhat.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20121210142133.GB5484@t430s.redhat.com>
References: <20121210135131.GA40753@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20121210135131.GA40753@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	qBAELpJS013682
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Remove Sparc v7 and v8 host support from
 the configure list
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
X-List-Received-Date: Mon, 10 Dec 2012 14:22:07 -0000

On Mon, Dec 10, 2012 at 09:51:31PM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB (We=
i-Ren Chen) wrote:
>   According to QEMU 1.3 release note, sparc v7 and v8 host support have
> been removed. [1] Fix configure list as well.
>=20
> [1] http://wiki.qemu.org/ChangeLog/1.3#Host_support
>=20
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/configure b/configure
> index e5aedef..56cf49d 100755
> --- a/configure
> +++ b/configure
> @@ -1089,7 +1089,7 @@ echo "  --fmod-inc               path to FMOD inc=
ludes"
>  echo "  --oss-lib                path to OSS library"
>  echo "  --enable-uname-release=3DR Return R for uname -r in usermode e=
mulation"
>  echo "  --cpu=3DCPU                Build for host CPU [$cpu]"
> -echo "  --sparc_cpu=3DV            Build qemu for Sparc architecture v=
7, v8, v8plus, v8plusa, v9"
> +echo "  --sparc_cpu=3DV            Build qemu for Sparc architecture v=
8plus, v8plusa, v9"


Reviewed-by: Amos Kong <akong@redhat.com>

>  echo "  --disable-uuid           disable uuid support"
>  echo "  --enable-uuid            enable uuid support"
>  echo "  --disable-vde            disable support for vde network"
> --=20
> 1.7.3.4

--=20
		Amos.

