Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9yMz-0000bL-El
	for mharc-qemu-trivial@gnu.org; Fri, 07 Sep 2012 09:13:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1T9yMs-0000F2-4L
	for qemu-trivial@nongnu.org; Fri, 07 Sep 2012 09:13:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1T9yMo-0007gK-5d
	for qemu-trivial@nongnu.org; Fri, 07 Sep 2012 09:13:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1T9yMb-0007ec-T2; Fri, 07 Sep 2012 09:12:50 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q87DCltS002916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 7 Sep 2012 09:12:48 -0400
Received: from dhcp-5-188.str.redhat.com (vpn1-5-61.ams2.redhat.com
	[10.36.5.61])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q87DCjQG009714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 7 Sep 2012 09:12:46 -0400
Message-ID: <5049F2CD.9010809@redhat.com>
Date: Fri, 07 Sep 2012 15:12:45 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: riegamaths@gmail.com
References: <1346851493-9149-1-git-send-email-riegamaths@gmail.com>
In-Reply-To: <1346851493-9149-1-git-send-email-riegamaths@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q87DCltS002916
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] block: output more error
 messages if failed to create temporary snapshot
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
X-List-Received-Date: Fri, 07 Sep 2012 13:13:12 -0000

Am 05.09.2012 15:24, schrieb riegamaths@gmail.com:
> From: Dunrong Huang <riegamaths@gmail.com>
>=20
> If we failed to create temporary snapshot, the error message did not ma=
tch
> with the error, for example:
>=20
> $ TMPDIR=3D/tmp/bad_path qemu-system-x86_64 -enable-kvm debian.qcow2 -s=
napshot
> qemu-system-x86_64: -enable-kvm: could not open disk image /home/mathsl=
inux/Images/debian.qcow2: No such file or directory
>=20
> Indeed, the file which cant be created is /tmp/bad_path/vl.xxxxxx,  not
> debian.qcow2. so the error message makes users feel confused.
>=20
> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
> ---
> v1 -> v2:
>    Output error message only if fd < 0
> v2 -> v3:
>    Output error message in the caller of get_tmp_filename()
>  block.c | 2 ++
>  1 =E4=B8=AA=E6=96=87=E4=BB=B6=E8=A2=AB=E4=BF=AE=E6=94=B9=EF=BC=8C=E6=8F=
=92=E5=85=A5 2 =E8=A1=8C(+)
>=20
> diff --git a/block.c b/block.c
> index 470bdcc..074987e 100644
> --- a/block.c
> +++ b/block.c
> @@ -764,6 +764,8 @@ int bdrv_open(BlockDriverState *bs, const char *fil=
ename, int flags,
> =20
>          ret =3D get_tmp_filename(tmp_filename, sizeof(tmp_filename));
>          if (ret < 0) {
> +            fprintf(stderr, "Could not create temporary snapshot %s: %=
s\n",
> +                    tmp_filename, strerror(errno));

This should be strerror(-ret). Also consider using error_report()
instead of fprintf().

>              return ret;
>          }
> =20

Kevin

