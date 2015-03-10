Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVOB2-0005uO-Qs
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 13:42:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YVOAz-0005pw-Rw
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 13:42:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YVOAv-0003yu-Bi
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 13:42:41 -0400
Received: from e28smtp05.in.ibm.com ([122.248.162.5]:58887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YVOAu-0003yX-P8
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 13:42:37 -0400
Received: from /spool/local
	by e28smtp05.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Tue, 10 Mar 2015 23:12:34 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
	by e28smtp05.in.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 10 Mar 2015 23:12:31 +0530
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id ECAAD394005A;
	Tue, 10 Mar 2015 23:12:30 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay04.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2AHgUD666256958; Tue, 10 Mar 2015 23:12:30 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2AHgU8J023624; Tue, 10 Mar 2015 23:12:30 +0530
Received: from skywalker.linux.vnet.ibm.com ([9.79.191.119])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2AHgURF023612
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 10 Mar 2015 23:12:30 +0530
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
In-Reply-To: <1425838674-28393-1-git-send-email-sw@weilnetz.de>
References: <1425838674-28393-1-git-send-email-sw@weilnetz.de>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-pc-linux-gnu)
Date: Tue, 10 Mar 2015 23:12:29 +0530
Message-ID: <87bnk0rbp6.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031017-0017-0000-0000-0000040B04E7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 122.248.162.5
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 2/7] 9pfs: Fix warnings from Sparse
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
X-List-Received-Date: Tue, 10 Mar 2015 17:42:43 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Sparse report:
>
> 9pfs/virtio-9p.c:1953:9: warning: returning void-valued expression
> 9pfs/virtio-9p-handle.c:143:5: warning: returning void-valued expression
> 9pfs/virtio-9p-handle.c:160:5: warning: returning void-valued expression
> 9pfs/virtio-9p-local.c:384:5: warning: returning void-valued expression
> 9pfs/virtio-9p-local.c:415:5: warning: returning void-valued expression
> 9pfs/virtio-9p-proxy.c:672:5: warning: returning void-valued expression
> 9pfs/virtio-9p-proxy.c:689:5: warning: returning void-valued expression
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>

> ---
>  hw/9pfs/virtio-9p-handle.c | 4 ++--
>  hw/9pfs/virtio-9p-local.c  | 4 ++--
>  hw/9pfs/virtio-9p-proxy.c  | 4 ++--
>  hw/9pfs/virtio-9p.c        | 3 ++-
>  4 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/hw/9pfs/virtio-9p-handle.c b/hw/9pfs/virtio-9p-handle.c
> index 4b79cef..13eabb9 100644
> --- a/hw/9pfs/virtio-9p-handle.c
> +++ b/hw/9pfs/virtio-9p-handle.c
> @@ -140,7 +140,7 @@ static int handle_opendir(FsContext *ctx,
>  
>  static void handle_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
>  {
> -    return rewinddir(fs->dir);
> +    rewinddir(fs->dir);
>  }
>  
>  static off_t handle_telldir(FsContext *ctx, V9fsFidOpenState *fs)
> @@ -157,7 +157,7 @@ static int handle_readdir_r(FsContext *ctx, V9fsFidOpenState *fs,
>  
>  static void handle_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
>  {
> -    return seekdir(fs->dir, off);
> +    seekdir(fs->dir, off);
>  }
>  
>  static ssize_t handle_preadv(FsContext *ctx, V9fsFidOpenState *fs,
> diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
> index a183eee..fec580b 100644
> --- a/hw/9pfs/virtio-9p-local.c
> +++ b/hw/9pfs/virtio-9p-local.c
> @@ -381,7 +381,7 @@ static int local_opendir(FsContext *ctx,
>  
>  static void local_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
>  {
> -    return rewinddir(fs->dir);
> +    rewinddir(fs->dir);
>  }
>  
>  static off_t local_telldir(FsContext *ctx, V9fsFidOpenState *fs)
> @@ -412,7 +412,7 @@ again:
>  
>  static void local_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
>  {
> -    return seekdir(fs->dir, off);
> +    seekdir(fs->dir, off);
>  }
>  
>  static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
> diff --git a/hw/9pfs/virtio-9p-proxy.c b/hw/9pfs/virtio-9p-proxy.c
> index 59c7445..edab402 100644
> --- a/hw/9pfs/virtio-9p-proxy.c
> +++ b/hw/9pfs/virtio-9p-proxy.c
> @@ -669,7 +669,7 @@ static int proxy_opendir(FsContext *ctx,
>  
>  static void proxy_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
>  {
> -    return rewinddir(fs->dir);
> +    rewinddir(fs->dir);
>  }
>  
>  static off_t proxy_telldir(FsContext *ctx, V9fsFidOpenState *fs)
> @@ -686,7 +686,7 @@ static int proxy_readdir_r(FsContext *ctx, V9fsFidOpenState *fs,
>  
>  static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
>  {
> -    return seekdir(fs->dir, off);
> +    seekdir(fs->dir, off);
>  }
>  
>  static ssize_t proxy_preadv(FsContext *ctx, V9fsFidOpenState *fs,
> diff --git a/hw/9pfs/virtio-9p.c b/hw/9pfs/virtio-9p.c
> index 5861a5b..4964da0 100644
> --- a/hw/9pfs/virtio-9p.c
> +++ b/hw/9pfs/virtio-9p.c
> @@ -1950,7 +1950,8 @@ static void v9fs_write(void *opaque)
>  
>      err = pdu_unmarshal(pdu, offset, "dqd", &fid, &off, &count);
>      if (err < 0) {
> -        return complete_pdu(s, pdu, err);
> +        complete_pdu(s, pdu, err);
> +        return;
>      }
>      offset += err;
>      v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, count, true);
> -- 
> 2.1.4


