Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VRJ96-0007Yt-AN
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2013 05:55:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1VR2ja-0001EO-D3
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 12:23:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1VR2jO-0007XJ-Po
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 12:23:38 -0400
Received: from e28smtp08.in.ibm.com ([122.248.162.8]:36918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1VR2jO-0007Wo-7e
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 12:23:26 -0400
Received: from /spool/local
	by e28smtp08.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Tue, 1 Oct 2013 21:53:24 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
	by e28smtp08.in.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 1 Oct 2013 21:53:22 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id CAEAAE0040;
	Tue,  1 Oct 2013 21:54:32 +0530 (IST)
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r91GNKnF48758922; Tue, 1 Oct 2013 21:53:20 +0530
Received: from d28av01.in.ibm.com (localhost [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	r91GNLaB010086; Tue, 1 Oct 2013 21:53:21 +0530
Received: from skywalker.linux.vnet.ibm.com ([9.79.197.220])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	r91GNLad010065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 1 Oct 2013 21:53:21 +0530
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
In-Reply-To: <1380626897-500-1-git-send-email-berrange@redhat.com>
References: <1380626897-500-1-git-send-email-berrange@redhat.com>
User-Agent: Notmuch/0.16+84~gcbbf53e (http://notmuchmail.org) Emacs/24.2.1
	(x86_64-pc-linux-gnu)
Date: Tue, 01 Oct 2013 21:53:20 +0530
Message-ID: <87li2dc64n.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13100116-2000-0000-0000-00000DF0A678
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.8
X-Mailman-Approved-At: Wed, 02 Oct 2013 05:55:02 -0400
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [PATCH] hw/9pfs: Fix errno value for xattr
	functions
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
X-List-Received-Date: Tue, 01 Oct 2013 16:23:47 -0000

"Daniel P. Berrange" <berrange@redhat.com> writes:

> From: "Daniel P. Berrange" <berrange@redhat.com>
>
> If there is no operation driver for the xattr type the
> functions return '-1' and set errno to '-EOPNOTSUPP'.
> When the calling code sets 'ret = -errno' this turns
> into a large positive number.
>
> In Linux 3.11, the kernel has switched to using 9p
> version 9p2000.L, instead of 9p2000.u, which enables
> support for xattr operations. This on its own is harmless,
> but for another change which makes it request the xattr
> with a name 'security.capability'.
>
> The result is that the guest sees a succesful return
> of 95 bytes of data, instead of a failure with errno
> set to 95. Since the kernel expects a maximum of 20
> bytes for an xattr return this gets translated to the
> unexpected errno ERANGE.
>
> This all means that when running a binary off a 9p fs
> in 3.11 kernels you get a fun result of:
>
>   # ./date
>   sh: ./date: Numerical result out of range
>
> The only workaround is to pass 'version=9p2000.u' when
> mounting the 9p fs in the guest, to disable all use of
> xattrs.
>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>


Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>

> ---
>  hw/9pfs/virtio-9p-xattr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/9pfs/virtio-9p-xattr.c b/hw/9pfs/virtio-9p-xattr.c
> index 90ae565..3fae557 100644
> --- a/hw/9pfs/virtio-9p-xattr.c
> +++ b/hw/9pfs/virtio-9p-xattr.c
> @@ -36,7 +36,7 @@ ssize_t v9fs_get_xattr(FsContext *ctx, const char *path,
>      if (xops) {
>          return xops->getxattr(ctx, path, name, value, size);
>      }
> -    errno = -EOPNOTSUPP;
> +    errno = EOPNOTSUPP;
>      return -1;
>  }
>
> @@ -123,7 +123,7 @@ int v9fs_set_xattr(FsContext *ctx, const char *path, const char *name,
>      if (xops) {
>          return xops->setxattr(ctx, path, name, value, size, flags);
>      }
> -    errno = -EOPNOTSUPP;
> +    errno = EOPNOTSUPP;
>      return -1;
>
>  }
> @@ -135,7 +135,7 @@ int v9fs_remove_xattr(FsContext *ctx,
>      if (xops) {
>          return xops->removexattr(ctx, path, name);
>      }
> -    errno = -EOPNOTSUPP;
> +    errno = EOPNOTSUPP;
>      return -1;
>
>  }
> -- 
> 1.8.3.1


