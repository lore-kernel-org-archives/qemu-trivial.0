Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wo510-0002s5-El
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 02:01:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wo50y-0002q0-S8
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 02:01:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wo50y-0008BA-38
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 02:01:04 -0400
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d]:51873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1Wo50v-0008As-Oc; Sat, 24 May 2014 02:01:01 -0400
Received: by mail-qg0-f45.google.com with SMTP id z60so9433998qgd.32
	for <multiple recipients>; Fri, 23 May 2014 23:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=B3dZirP557bQ3fKzr4pOVG5t72s1549WXHEWLiqsbWg=;
	b=s4yxX1DsZlNSNjP6vAuD2dwtEQXSoXRp4SawmKTLwbfg++FGlTDeBRw6sP4fXYbBwg
	Gsp1txMM2LGZONeyu4LxMxOGzAy0jtx/NIlxszhf+mxRVmqtlH8FvUdgg6MZAq+yOv4+
	3o7RJ1xhKQxlEYxqhbnVyU1ksxT1BdQ+HEhhJd0PoaxnpVO3qI4e5io99QH7pBmCNnlz
	bAjxMq+r62+2JOUx8vSIDrXzOrDzCEDvU2Slzv15y1fJEXhQx51VEJDezwIs8Dv7mGdi
	GbqS0mmhxBSjBhUOa3i3GYCcBUWg3dpFcIw6QPdOO/Oq399iHY2XydSW4Dru1n/dQcCC
	DaxA==
MIME-Version: 1.0
X-Received: by 10.140.81.16 with SMTP id e16mr12342785qgd.110.1400911261225;
	Fri, 23 May 2014 23:01:01 -0700 (PDT)
Received: by 10.140.24.51 with HTTP; Fri, 23 May 2014 23:01:01 -0700 (PDT)
In-Reply-To: <537FAF29.3080600@msgid.tls.msk.ru>
References: <1400631039-7208-1-git-send-email-tamlokveer@gmail.com>
	<1400631039-7208-3-git-send-email-tamlokveer@gmail.com>
	<537FAF29.3080600@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 14:01:01 +0800
Message-ID: <CACrq+iK9+ARbYgkXeAFfdeLMmjb+EE04skdVk-POTyUSgY+xmw@mail.gmail.com>
From: Le Tan <tamlokveer@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22d
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 2/2] block: replace fprintf(stderr,
 ...) with error_report()
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
X-List-Received-Date: Sat, 24 May 2014 06:01:05 -0000

I will fix the whitespace issues and resend this series with a new
version later.
Thanks very much! ;)

Le

2014-05-24 4:27 GMT+08:00 Michael Tokarev <mjt@tls.msk.ru>:
> 21.05.2014 04:10, Le Tan wrote:
>> Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
>> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
>> have been removed because @fmt of error_report() should not contain newline.
>>
>> Signed-off-by: Le Tan <tamlokveer@gmail.com>
>> ---
>>  block-migration.c      |    5 +--
>>  block.c                |    4 +-
>>  block/qcow2-refcount.c |  114 ++++++++++++++++++++++++------------------------
>>  block/qcow2.c          |   18 ++++----
>>  block/raw-posix.c      |   10 ++---
>>  block/raw-win32.c      |    6 +--
>>  block/ssh.c            |    2 +-
>>  block/vdi.c            |   15 ++++---
>>  block/vmdk.c           |   15 +++----
>>  block/vpc.c            |    4 +-
>>  block/vvfat.c          |   69 +++++++++++++++--------------
>>  blockdev.c             |    6 +--
>>  12 files changed, 132 insertions(+), 136 deletions(-)
>
> That's a rather large -trivial patch... ;)
>
> Please check this patch using ./tools/checkpatch.pl - it will show
> many whitespace issues.
>
> I'd apply it to -trivial (after fixing the whitespace issues), all
> the actual changes look sane.  But Cc'ing kwolf and stefanha too
> (who are the block subsystem maintainers), because the patch touches
> too many of block code.
>
> Thanks,
>
> /mjt
>

