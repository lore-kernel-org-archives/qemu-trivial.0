Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wyypo-0005BM-EG
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jun 2014 03:38:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Wyype-0004xM-5P
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 03:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WyypU-0007Wv-Tt
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 03:38:26 -0400
Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b]:38224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WyypU-0007V7-M1; Mon, 23 Jun 2014 03:38:16 -0400
Received: by mail-we0-f171.google.com with SMTP id q58so6427155wes.30
	for <multiple recipients>; Mon, 23 Jun 2014 00:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lGGSyo7PUtyztCFQDm8UhvEgdy3uGEeyb4X7XXVGsHc=;
	b=inCZ1G30Xfey3dHYMQoyHFSFsw9cDvAtf9zKbNb7prTlsRcSVhHQntPvm2QbC/hJyH
	gmPnLcPK6++8ZnMJ29PYxm/NMnrWvxdoWfzl8t7oM4UDzD5bxYPM5A8mK+BR5KrMnsrp
	P8z1P7pSI9eZQFY8Xcm/vJR0i/WH1bZ7Mkz6RRsplDrCovERErZ25zi3vcS3/Qyr6tFh
	jJ/YnZRD8eJ9T9BDBzN1T2iFtA0wMtqAJmfhYIIsS2gSt0ZHp+XRsUD1j+ORQFpGy4e9
	643wREaZdPBDqJYPF+r7kFm8llwnVJhNJnxw4rYj52BlZNwOvt0h3AC5yu6ZvRgL2yra
	mFDQ==
X-Received: by 10.180.75.71 with SMTP id a7mr23646046wiw.27.1403509095554;
	Mon, 23 Jun 2014 00:38:15 -0700 (PDT)
Received: from localhost (1-64-55-022.static.netvigator.com. [1.64.55.22])
	by mx.google.com with ESMTPSA id
	a13sm11868591wjs.12.2014.06.23.00.38.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 00:38:14 -0700 (PDT)
Date: Mon, 23 Jun 2014 15:38:06 +0800
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Message-ID: <20140623073806.GB13485@stefanha-thinkpad.redhat.com>
References: <53A59DD1.2020706@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline
In-Reply-To: <53A59DD1.2020706@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22b
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] block.c: Correct
 the return value and the failure object when failure occurs
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
X-List-Received-Date: Mon, 23 Jun 2014 07:38:35 -0000


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2014 at 10:59:29PM +0800, Chen Gang wrote:
> When failure occurs, 'ret' need be set, or may return 0 to indicate succe=
ss.
> And error_propagate() also need be called only one time within a function.
>=20
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block.c b/block.c
> index 74af8d7..12ce4e4 100644
> --- a/block.c
> +++ b/block.c
> @@ -1497,7 +1497,7 @@ int bdrv_open(BlockDriverState **pbs, const char *f=
ilename,
>      if (snapshot_flags) {
>          bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
>          if (local_err) {
> -            error_propagate(errp, local_err);
> +            ret =3D -1;
>              goto close_and_fail;
>          }
>      }

The return value of bdrv_open() is a negative errno.  -1 does not make
sense in this case.

Please add an int return value to bdrv_append_temp_snapshot() so the
caller can determine the real errno.  Then the remainder of the patch
can be:

     if (snapshot_flags) {
-        bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
+        ret =3D bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
         if (local_err) {
-            error_propagate(errp, local_err);
             goto close_and_fail;
         }
     }

Stefan

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJTp9leAAoJEJykq7OBq3PIsO8IALiMLsn9iDGYC3kQgs5hrFr/
0wJalT4Ss8P4wLBCFHWPnp2am97aM+8EblLVg7Ua1YpUpKcayT5D8wnl5DuSwfgM
H6MPN/4imQ8IpFx5V6s8ASbysbXiSkrpGHZM6tYCdl8ipL/rORy9z2rFaz9trH3a
QdTlbnGgMzViTsEMKfj3c0V6rb9dQE7PdGlj8kohalcl2jKbfo11dsZp7R8saUDZ
hyo0H87CFYziSN4rG5Px2XYuElQyw6aDcO+7JC2H01D+0tzaCbOkXIFq/SbCakQm
lJM2fcUgbVR5yeB55U1x60VqvoyIT9C05pDALm+j/8VVNcQb+tZgWX9CUMymUnI=
=MoCP
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--

