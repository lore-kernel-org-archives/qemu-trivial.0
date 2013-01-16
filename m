Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvUOe-0003nQ-9c
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 09:55:20 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TvUOX-0003Xk-Nm
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:55:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TvUOV-0007Q4-By
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:55:13 -0500
Received: from e36.co.us.ibm.com ([32.97.110.154]:48920)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TvUOV-0007Pg-5A
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:55:11 -0500
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Wed, 16 Jan 2013 07:55:09 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 16 Jan 2013 07:55:08 -0700
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id DF1FC19D8053;
	Wed, 16 Jan 2013 07:55:04 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r0GEt3s0131686; Wed, 16 Jan 2013 07:55:03 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r0GEt3sY022845; Wed, 16 Jan 2013 07:55:03 -0700
Received: from titi.na.relay.ibm.com (sig-9-76-20-104.mts.ibm.com
	[9.76.20.104])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r0GEswdB022281; Wed, 16 Jan 2013 07:55:01 -0700
From: Anthony Liguori <aliguori@us.ibm.com>
To: Vadim Evard <v.e.evard@gmail.com>, qemu-devel@nongnu.org
In-Reply-To: <50F5EBDA.2040208@gmail.com>
References: <50F5EBDA.2040208@gmail.com>
User-Agent: Notmuch/0.13.2+93~ged93d79 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Wed, 16 Jan 2013 08:54:58 -0600
Message-ID: <87mww9jhz1.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13011614-7606-0000-0000-0000077A7F17
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.154
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: silencing
	pkg-config's check for curses
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
X-List-Received-Date: Wed, 16 Jan 2013 14:55:18 -0000

Vadim Evard <v.e.evard@gmail.com> writes:

>>From d10856f3b1d893b5d3c6ab213eb921d0a24e7766 Mon Sep 17 00:00:00 2001
> From: Vadim Evard <v.e.evard@gmail.com>
> Date: Wed, 16 Jan 2013 03:45:44 +0400
> Subject: [PATCH] configure: silencing pkg-config's check for curses


This is fubar above and it's missing a Signed-off-by.  Please CC me when
you send out a new version that fixes this.

Regards,

Anthony Liguori

>
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 4ebb60d..6211db9 100755
> --- a/configure
> +++ b/configure
> @@ -2039,7 +2039,7 @@ fi
>  if test "$mingw32" = "yes" ; then
>      curses_list="-lpdcurses"
>  else
> -    curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses)"
> +    curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses 2>/dev/null)"
>  fi
>  
>  if test "$curses" != "no" ; then
> -- 
> 1.7.10.4


