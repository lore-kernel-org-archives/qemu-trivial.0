Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8NVY-0003VO-6N
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2016 03:57:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1b8NVS-0003QL-2J
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 03:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1b8NVP-0004Zz-VZ
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 03:57:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1b8NVG-0004Y1-MF; Thu, 02 Jun 2016 03:57:18 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3A33C0E801D;
	Thu,  2 Jun 2016 07:57:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u527vGcT020168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 2 Jun 2016 03:57:17 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E09741138645; Thu,  2 Jun 2016 09:57:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Cc: <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, kwolf@redhat.com,
	qemu-block@nongnu.org, mreitz@redhat.com
References: <1464764901-8773-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Date: Thu, 02 Jun 2016 09:57:15 +0200
In-Reply-To: <1464764901-8773-1-git-send-email-weijg.fnst@cn.fujitsu.com> (Wei
	Jiangang's message of "Wed, 1 Jun 2016 15:08:21 +0800")
Message-ID: <87lh2oja5g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 02 Jun 2016 07:57:18 +0000 (UTC)
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
X-List-Received-Date: Thu, 02 Jun 2016 07:57:35 -0000

Wei Jiangang <weijg.fnst@cn.fujitsu.com> writes:

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
>  }
>  
>  #endif /* defined(__APPLE__) && defined(__MACH__) */

This is less wrong :)

Beware, I have no suitable machine to actually test this, so the
following is based on code inspection.

print_unmounting_directions() is used by hdev_open().  hdev_open() is a
BlockDriver method bdrv_file_open(), and as such returns errors to its
caller via parameter Error **errp.  The caller may or may not report
errors it gets from hdev_open().

If it reports them, then print_unmounting_directions()'s output
"overtakes" the error message, i.e. the "If device ... is mounted ..."
hint is printed before the error message.  Wrong, it should be printed
after the error message.

If it doesn't report them, the hint gets printed anyway.  More wrong.

In any case, printing each line of the hint with error_report() is also
wrong, because that prefixes each line with program name and location
information.  Your patch fixes this part.

A more complete fix uses error_append_hint(errp, ...) instead of
error_printf().  hdev_open() needs to pass errp to
print_unmounting_directions() for that.  errp must have an error set, or
else error_append_hint() makes no sense.

