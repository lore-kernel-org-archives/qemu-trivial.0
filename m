Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVNzI-0000QC-6j
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 13:30:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YVNzE-0000Ji-Qb
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 13:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YVNz1-0007JQ-Fv
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 13:30:32 -0400
Received: from e28smtp05.in.ibm.com ([122.248.162.5]:55264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YVNz0-0007EW-T5
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 13:30:19 -0400
Received: from /spool/local
	by e28smtp05.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Tue, 10 Mar 2015 23:00:15 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
	by e28smtp05.in.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 10 Mar 2015 23:00:12 +0530
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id 5CF663940048;
	Tue, 10 Mar 2015 23:00:12 +0530 (IST)
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2AHUATB62521558; Tue, 10 Mar 2015 23:00:10 +0530
Received: from d28av02.in.ibm.com (localhost [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2AHUAFB021828; Tue, 10 Mar 2015 23:00:10 +0530
Received: from skywalker.linux.vnet.ibm.com ([9.79.191.119])
	by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2AHUAJm021815
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 10 Mar 2015 23:00:10 +0530
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <1425503036-23707-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1425503036-23707-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-pc-linux-gnu)
Date: Tue, 10 Mar 2015 23:00:09 +0530
Message-ID: <87k2yorc9q.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031017-0017-0000-0000-0000040AFC35
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 122.248.162.5
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] 9pfs-local: simplify/optimize
	local_mapped_attr_path()
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
X-List-Received-Date: Tue, 10 Mar 2015 17:30:35 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> Omit one unnecessary memory allocation for components of the path
> and create the resulting path directly given lengths of the components.
>
> This uses (char*) cast because basename() accepts a char* without const,
> for unknown reason.  Maybe it is better to use strrchr(), but I'm not
> sure for various forms of directory component delimiter.

basename(3) says:
Both dirname() and basename() may modify the contents of path, so it may
be desirable to pass a copy when calling one of these functions


>
> And according to basename(3) manpage, it might return different strings
> for various corner cases, for example for empty argument it returns a
> string "." which is obviously at some other address, so both the old
> code and new code will do a bad thing here.  So maybe it is actually
> better to use strrchr() after all.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/9pfs/virtio-9p-local.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
> index d05c917..fddc242 100644
> --- a/hw/9pfs/virtio-9p-local.c
> +++ b/hw/9pfs/virtio-9p-local.c
> @@ -45,19 +45,10 @@
>  
>  static char *local_mapped_attr_path(FsContext *ctx, const char *path)
>  {
> -    char *dir_name;
> -    char *tmp_path = g_strdup(path);
> -    char *base_name = basename(tmp_path);
> -    char *buffer;
> -
> -    /* NULL terminate the directory */
> -    dir_name = tmp_path;
> -    *(base_name - 1) = '\0';
> -
> -    buffer = g_strdup_printf("%s/%s/%s/%s",
> -             ctx->fs_root, dir_name, VIRTFS_META_DIR, base_name);
> -    g_free(tmp_path);
> -    return buffer;
> +    const char *name = basename((char*)path);

as per the man page basename could end up modifying 'path' and we don't
want to modify the input argument of the function.


> +    int dirlen = name - path - 1;
> +    return g_strdup_printf("%s/%.*s/%s/%s", ctx->fs_root,
> +                           dirlen, path, VIRTFS_META_DIR, name);
>  }
>  
>  static FILE *local_fopen(const char *path, const char *mode)

I am not sure whether we really need all these cleanups without really
fixing anyi specific issue.

-aneesh


