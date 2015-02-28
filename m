Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdyk-0001wP-J0
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:46:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdyh-0001ps-L0
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:46:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdyg-00017r-Rh
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:46:31 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41180)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YRdyc-000175-BU; Sat, 28 Feb 2015 04:46:26 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D4F7243F31;
	Sat, 28 Feb 2015 12:46:22 +0300 (MSK)
Message-ID: <54F18E6E.2040703@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 12:46:22 +0300
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
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sat, 28 Feb 2015 09:46:32 -0000

27.02.2015 10:50, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/9pfs/virtio-9p-local.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
> index a183eee..bcad4e0 100644
> --- a/hw/9pfs/virtio-9p-local.c
> +++ b/hw/9pfs/virtio-9p-local.c
> @@ -500,7 +500,6 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
>          buffer = rpath(fs_ctx, path);
>          err = mknod(buffer, SM_LOCAL_MODE_BITS|S_IFREG, 0);
>          if (err == -1) {
> -            g_free(buffer);
>              goto out;
>          }
>          err = local_set_xattr(buffer, credp);
> @@ -513,7 +512,6 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
>          buffer = rpath(fs_ctx, path);
>          err = mknod(buffer, SM_LOCAL_MODE_BITS|S_IFREG, 0);
>          if (err == -1) {
> -            g_free(buffer);
>              goto out;
>          }
>          err = local_set_mapped_file_attr(fs_ctx, path, credp);
> @@ -526,7 +524,6 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
>          buffer = rpath(fs_ctx, path);
>          err = mknod(buffer, credp->fc_mode, credp->fc_rdev);
>          if (err == -1) {
> -            g_free(buffer);
>              goto out;
>          }
...

I wonder if we should change this code to drop repeated code blocks which changes
only slightly by mknod parameters...

>          err = local_post_create_passthrough(fs_ctx, path, credp);
> @@ -540,8 +537,8 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
>  err_end:
>      remove(buffer);
>      errno = serrno;
> -    g_free(buffer);
>  out:
> +    g_free(buffer);
>      v9fs_string_free(&fullname);
>      return err;
>  }

..and this goto jumping (here and in a few other places) is q bit disgusting too... ;)

But this is the original code, the patch is still correct.

Thanks,

/mjt

