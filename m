Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT8Ri-0003ri-2m
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 07:30:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YT8Rf-0003mK-Be
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 07:30:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YT8Re-0005vF-5T
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 07:30:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YT8RZ-0005tS-K2; Wed, 04 Mar 2015 07:30:29 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 56A0540810;
	Wed,  4 Mar 2015 15:30:28 +0300 (MSK)
Message-ID: <54F6FAE4.6090709@msgid.tls.msk.ru>
Date: Wed, 04 Mar 2015 15:30:28 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
	<1425023419-12244-7-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1425023419-12244-7-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 6/9] 9pfs: fix memory leak
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
X-List-Received-Date: Wed, 04 Mar 2015 12:30:36 -0000

27.02.2015 10:50, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/9pfs/virtio-9p-local.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
> index a183eee..bcad4e0 100644
> --- a/hw/9pfs/virtio-9p-local.c
> +++ b/hw/9pfs/virtio-9p-local.c
> @@ -500,7 +500,6 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath =
*dir_path,
>          buffer =3D rpath(fs_ctx, path);
>          err =3D mknod(buffer, SM_LOCAL_MODE_BITS|S_IFREG, 0);
>          if (err =3D=3D -1) {
> -            g_free(buffer);
>              goto out;
>          }
>          err =3D local_set_xattr(buffer, credp);
> @@ -513,7 +512,6 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath =
*dir_path,
>          buffer =3D rpath(fs_ctx, path);
>          err =3D mknod(buffer, SM_LOCAL_MODE_BITS|S_IFREG, 0);
>          if (err =3D=3D -1) {
> -            g_free(buffer);
>              goto out;
>          }
>          err =3D local_set_mapped_file_attr(fs_ctx, path, credp);
> @@ -526,7 +524,6 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath =
*dir_path,
>          buffer =3D rpath(fs_ctx, path);
>          err =3D mknod(buffer, credp->fc_mode, credp->fc_rdev);
>          if (err =3D=3D -1) {
> -            g_free(buffer);
>              goto out;
>          }
>          err =3D local_post_create_passthrough(fs_ctx, path, credp);
> @@ -540,8 +537,8 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath =
*dir_path,
>  err_end:
>      remove(buffer);
>      errno =3D serrno;
> -    g_free(buffer);
>  out:
> +    g_free(buffer);
>      v9fs_string_free(&fullname);
>      return err;
>  }
> @@ -676,7 +673,6 @@ static int local_open2(FsContext *fs_ctx, V9fsPath =
*dir_path, const char *name,
>          buffer =3D rpath(fs_ctx, path);
>          fd =3D open(buffer, flags, SM_LOCAL_MODE_BITS);
>          if (fd =3D=3D -1) {
> -            g_free(buffer);
>              err =3D fd;
>              goto out;
>          }
> @@ -691,7 +687,6 @@ static int local_open2(FsContext *fs_ctx, V9fsPath =
*dir_path, const char *name,
>          buffer =3D rpath(fs_ctx, path);
>          fd =3D open(buffer, flags, SM_LOCAL_MODE_BITS);
>          if (fd =3D=3D -1) {
> -            g_free(buffer);
>              err =3D fd;
>              goto out;
>          }
> @@ -707,7 +702,6 @@ static int local_open2(FsContext *fs_ctx, V9fsPath =
*dir_path, const char *name,
>          buffer =3D rpath(fs_ctx, path);
>          fd =3D open(buffer, flags, credp->fc_mode);
>          if (fd =3D=3D -1) {
> -            g_free(buffer);
>              err =3D fd;
>              goto out;
>          }
> @@ -725,8 +719,8 @@ err_end:
>      close(fd);
>      remove(buffer);
>      errno =3D serrno;
> -    g_free(buffer);
>  out:
> +    g_free(buffer);
>      v9fs_string_free(&fullname);
>      return err;
>  }

This patch introduces a compiler warning, which is technically
correct:

hw/9pfs/virtio-9p-local.c: In function =91local_open2=92:
hw/9pfs/virtio-9p-local.c:723:5: error: =91buffer=92 may be used uninitia=
lized in this function [-Werror=3Dmaybe-uninitialized]
     g_free(buffer);
     ^
hw/9pfs/virtio-9p-local.c: In function =91local_mknod=92:
hw/9pfs/virtio-9p-local.c:541:5: error: =91buffer=92 may be used uninitia=
lized in this function [-Werror=3Dmaybe-uninitialized]
     g_free(buffer);
     ^

This is because `buffer' variable is initialized within one
of the `if' branches but is left uninitialized if none of
the conditions is true.  In reality this can't happen because
at least one condition is always true.

It is a one more reason to rewrite this code like I mentioned
in another mail instead of trying to fix random issues like
this.  I'll try to come up with a patch doing that shortly.
Meanwhile I'll drop this patch.

Thanks,

/mjt

