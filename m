Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RpxyP-0008Gk-Q7
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2012 03:12:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RpxyG-0007r4-NQ
	for qemu-trivial@nongnu.org; Wed, 25 Jan 2012 03:12:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1RpxyA-000892-Ma
	for qemu-trivial@nongnu.org; Wed, 25 Jan 2012 03:12:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:27739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Rpxxy-00087N-Se; Wed, 25 Jan 2012 03:12:27 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0P8CPAu024904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 25 Jan 2012 03:12:25 -0500
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q0P8COWi005603; Wed, 25 Jan 2012 03:12:25 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 1999F6006E; Wed, 25 Jan 2012 09:12:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
References: <1327436008-3553-1-git-send-email-lersek@redhat.com>
Date: Wed, 25 Jan 2012 09:12:23 +0100
In-Reply-To: <1327436008-3553-1-git-send-email-lersek@redhat.com> (Laszlo
	Ersek's message of "Tue, 24 Jan 2012 21:13:28 +0100")
Message-ID: <m3aa5cw68o.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fixup e432cef9 (aio help
	text): end sentences with periods
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
X-List-Received-Date: Wed, 25 Jan 2012 08:12:52 -0000

Patch looks good, cc'ing qemu-trivial.

Laszlo Ersek <lersek@redhat.com> writes:

> (Please keep me CC'd on any followup; I'm not subscribed. Thanks.)

Best to put such notes below the --- line, so they don't get
immortalized in the commit log.

> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  qemu-io.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-io.c b/qemu-io.c
> index ffa62fb..938b20c 100644
> --- a/qemu-io.c
> +++ b/qemu-io.c
> @@ -1118,7 +1118,7 @@ static void aio_read_help(void)
>  " Reads a segment of the currently open file, optionally dumping it to the\n"
>  " standard output stream (with -v option) for subsequent inspection.\n"
>  " The read is performed asynchronously and the aio_flush command must be\n"
> -" used to ensure all outstanding aio requests have been completed\n"
> +" used to ensure all outstanding aio requests have been completed.\n"
>  " -C, -- report statistics in a machine parsable format\n"
>  " -P, -- use a pattern to verify read data\n"
>  " -v, -- dump buffer to standard output\n"
> @@ -1214,7 +1214,7 @@ static void aio_write_help(void)
>  " Writes into a segment of the currently open file, using a buffer\n"
>  " filled with a set pattern (0xcdcdcdcd).\n"
>  " The write is performed asynchronously and the aio_flush command must be\n"
> -" used to ensure all outstanding aio requests have been completed\n"
> +" used to ensure all outstanding aio requests have been completed.\n"
>  " -P, -- use different pattern to fill file\n"
>  " -C, -- report statistics in a machine parsable format\n"
>  " -q, -- quiet mode, do not show I/O statistics\n"

