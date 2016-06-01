Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b80VE-0002Uz-Tz
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2016 03:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1b80V9-0002Qj-S7
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 03:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1b80V8-0001z4-Sa
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 03:23:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1b80V1-0001vk-29; Wed, 01 Jun 2016 03:23:31 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2758C04B307;
	Wed,  1 Jun 2016 07:23:29 +0000 (UTC)
Received: from localhost (dhcp-15-133.nay.redhat.com [10.66.15.133])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u517NS7Q006093; Wed, 1 Jun 2016 03:23:28 -0400
Date: Wed, 1 Jun 2016 15:23:26 +0800
From: Fam Zheng <famz@redhat.com>
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, kwolf@redhat.com,
	qemu-block@nongnu.org, mreitz@redhat.com
Message-ID: <20160601072326.GF8639@ad.usersys.redhat.com>
References: <1464764901-8773-1-git-send-email-weijg.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464764901-8773-1-git-send-email-weijg.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 01 Jun 2016 07:23:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/raw-posix: Fix
 error_report of mounting message
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2016 07:23:43 -0000

On Wed, 06/01 15:08, Wei Jiangang wrote:
> Use a single error_printf to replace triple error_report.
> 
> Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
> ---
>  block/raw-posix.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/block/raw-posix.c b/block/raw-posix.c
> index a4f5a1b..141b01a 100644
> --- a/block/raw-posix.c
> +++ b/block/raw-posix.c
> @@ -2061,11 +2061,11 @@ static bool setup_cdrom(char *bsd_path, Error **errp)
>  /* Prints directions on mounting and unmounting a device */
>  static void print_unmounting_directions(const char *file_name)
>  {
> -    error_report("If device %s is mounted on the desktop, unmount"
> -                 " it first before using it in QEMU", file_name);
> -    error_report("Command to unmount device: diskutil unmountDisk %s",
> -                 file_name);
> -    error_report("Command to mount device: diskutil mountDisk %s", file_name);
> +    error_printf("If device %s is mounted on the desktop, unmount"
> +        " it first before using it in QEMU\n"
> +        "Command to unmount device: diskutil unmountDisk %s\n"
> +        "Command to mount device: diskutil mountDisk %s\n",
> +        file_name, file_name, file_name);

I'd say it's less readable with a worse alignment to the parameters.

Fam

