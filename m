Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFSaB-0003uc-8P
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 12:29:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFSa7-0003mW-VQ
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:29:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFSa7-0002On-7R
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:29:27 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:42795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFSa4-0002OM-Ep; Sat, 22 Sep 2012 12:29:24 -0400
Received: by weyt11 with SMTP id t11so2298999wey.4
	for <multiple recipients>; Sat, 22 Sep 2012 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kq9YOqGGqRCal3X8wYoVPkMAiZ2Lz75CgVtXdvfEhm8=;
	b=qPEEWa1oBQIbkJdI89F/PndSrYU4nF8r94I7XJYds6XM4E9mM/gLczrYd7HU0+V4Cu
	uY6YYoX2U06JepEhv8yjdZ42OnbIB/PDn/TK3mvorC0xkhl03DaJefE+ku5z468Ydns6
	lSq0PjKVt6uhJffWHZTV2UIRiGv32pHGh3nxaNBW8DPVxxTvPbs3vJaK0UIuiGoUkZ3S
	esOXZyVdNDRgoGQkFNufDO+xuPvwUAQqrqUyuBzsJd9SSFBw3WunefHjvnsSMjsHgUpN
	xiplBciaQwTaUE4M7zmOPE0Np8lrqWzsJTdER48NkGHJMpDdSwVjUQjJ1Ew+EsHY4s5i
	MNkw==
Received: by 10.216.140.135 with SMTP id e7mr4486009wej.149.1348331363580;
	Sat, 22 Sep 2012 09:29:23 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id k2sm5020006wiz.7.2012.09.22.09.29.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:29:22 -0700 (PDT)
Date: Sat, 22 Sep 2012 17:29:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120922162920.GB14154@stefanha-thinkpad.localdomain>
References: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pflash: Avoid warnings from coverity
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
X-List-Received-Date: Sat, 22 Sep 2012 16:29:29 -0000

On Wed, Sep 19, 2012 at 06:41:14PM +0200, Stefan Weil wrote:
> hw/pflash_cfi01.c:209:
> check_return: Calling function "bdrv_write" without checking return value (as is done elsewhere 35 out of 37 times).
> 
> hw/pflash_cfi02.c:144:
> unterminated_default: The default case is not terminated by a 'break' statement.
> 
> hw/pflash_cfi02.c:238:
> check_return: Calling function "bdrv_write" without checking return value (as is done elsewhere 35 out of 37 times).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/pflash_cfi01.c |    6 ++++--
>  hw/pflash_cfi02.c |    7 +++++--
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
> index 56ed33f..27ae4aa 100644
> --- a/hw/pflash_cfi01.c
> +++ b/hw/pflash_cfi01.c
> @@ -205,8 +205,10 @@ static void pflash_update(pflash_t *pfl, int offset,
>          /* round to sectors */
>          offset = offset >> 9;
>          offset_end = (offset_end + 511) >> 9;
> -        bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
> -                   offset_end - offset);
> +        if (bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
> +                       offset_end - offset) == -1) {

bdrv_write() returns -errno, not -1.

> +            fprintf(stderr, "pflash: Error writing to flash storage\n");
> +        }

Please report the errno and possibly bdrv_get_device_name() to uniquely
identify this block device.

Peter's comments about reporting errors to the guest make sense to me.
I'm not sure how much work that involves, printing the error is a step
in the right direction but we shouldn't forget the TODO.

Stefan

