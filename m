Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpDtF-0006g0-PX
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 04:37:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDtD-0006di-Jw
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:37:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDtC-00009I-D5
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:37:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45135)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UpDt5-00008k-M8; Wed, 19 Jun 2013 04:37:07 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2730B41974;
	Wed, 19 Jun 2013 12:37:06 +0400 (MSK)
Message-ID: <51C16DB0.1090905@msgid.tls.msk.ru>
Date: Wed, 19 Jun 2013 12:37:04 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1371527137-16949-5-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1371527137-16949-5-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 5/5] ui: boolize 'full_screen'
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
X-List-Received-Date: Wed, 19 Jun 2013 08:37:16 -0000

18.06.2013 07:45, liguang wrote:
[]
> -void sdl_display_init(DisplayState *ds, int full_screen, int no_frame);
> +void sdl_display_init(DisplayState *ds, bool full_screen, int no_frame);

The same applies to no_frame, isn't it?

These conversions to bool are like this -- "thankless", because there are
so many of them all around, you touch one place and it becomes obvious
that nearby places should be touched too.  Like this:

> --- a/vl.c
> +++ b/vl.c
> @@ -198,7 +198,7 @@ static int rtc_utc = 1;
>  static int rtc_date_offset = -1; /* -1 means no change */
>  QEMUClock *rtc_clock;
>  int vga_interface_type = VGA_NONE;
> -static int full_screen = 0;
> +static bool full_screen = false;
>  static int no_frame = 0;
>  int no_quit = 0;

This no_quit is bool too... :) But I think _this_ one might be in a
separate patch.  But it is also display-specific.

Besides, I think we should rewamp this display init thing entirely,
making displays to be modules and implementing options parsing
properly.

I think I'll do that today, and will convert these to bools while
at it.

Thanks,

/mjt

