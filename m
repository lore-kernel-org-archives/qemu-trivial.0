Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TtaBV-0006w9-71
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 03:41:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TtaBR-0006w2-Gk
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:41:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TtaBM-0003kK-4w
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:41:49 -0500
Received: from mail-wg0-f47.google.com ([74.125.82.47]:58847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TtaBL-0003k7-V9; Fri, 11 Jan 2013 03:41:44 -0500
Received: by mail-wg0-f47.google.com with SMTP id dq11so680344wgb.26
	for <multiple recipients>; Fri, 11 Jan 2013 00:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=oDvjC5p9DegWQzCAo1cB/qhkoKQ7NiQsSmEFSA3WvUw=;
	b=PRlG8rZLov1QcS3WgVURRB+uoAbPV+Tck3bQncDx62cKDr9ohMw6Qm4Rvyn9GzXpL8
	cP4DJ+XiLGi+orokMjJvwfbNj3PaSh/Ui2fWpYwPcONT+OCPnYUpAllkMONRl3Tcjf1C
	3/NavlomI8lnJkIXyQHMHLt3Sa3v8M7nQgr3I+EI4OHMqfSrkPV/S11q3+UOXTWbiLX3
	Q2ElN3pbUgDSWumZUMGHpP2V1e4FS1NIVtPkWbHt8N+IHLnlziM6Ki4PyrdnY51IblV2
	kRlpklmTrPTOCLMPVIINeravf0MobUz4kU7n4nBI9AGAF4Vqj8HZHu/BLalQJbDqsxzw
	tasQ==
X-Received: by 10.194.76.7 with SMTP id g7mr40631182wjw.50.1357893703155;
	Fri, 11 Jan 2013 00:41:43 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id dm3sm11821567wib.9.2013.01.11.00.41.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 00:41:42 -0800 (PST)
Date: Fri, 11 Jan 2013 09:41:37 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130111084137.GD23656@stefanha-thinkpad.muc.redhat.com>
References: <1357596493-27396-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1357596493-27396-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.47
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Replace remaining gmtime,
 localtime by gmtime_r, localtime_r
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
X-List-Received-Date: Fri, 11 Jan 2013 08:41:52 -0000

On Mon, Jan 07, 2013 at 11:08:13PM +0100, Stefan Weil wrote:
> This allows removing of MinGW specific code and improves
> reentrancy for POSIX hosts.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  block.c       |   10 ----------
>  block/vvfat.c |    4 ----
>  hw/omap1.c    |    2 +-
>  vl.c          |    8 +++-----
>  4 files changed, 4 insertions(+), 20 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

