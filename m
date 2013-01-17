Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tvvec-0002bg-So
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 15:01:38 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TvveZ-0002Z9-OQ
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 15:01:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TvveY-0000Q8-AQ
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 15:01:35 -0500
Received: from e38.co.us.ibm.com ([32.97.110.159]:45988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TvveY-0000PT-4K
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 15:01:34 -0500
Received: from /spool/local
	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Thu, 17 Jan 2013 13:01:31 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 17 Jan 2013 13:01:18 -0700
Received: from d03relay01.boulder.ibm.com (d03relay01.boulder.ibm.com
	[9.17.195.226])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 6641119D803F;
	Thu, 17 Jan 2013 13:01:17 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r0HK1EKV236322; Thu, 17 Jan 2013 13:01:15 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r0HK1EHI006152; Thu, 17 Jan 2013 13:01:14 -0700
Received: from titi.na.relay.ibm.com (titi.austin.ibm.com [9.41.105.91])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r0HK142u004898; Thu, 17 Jan 2013 13:01:10 -0700
From: Anthony Liguori <aliguori@us.ibm.com>
To: Vadim Evard <v.e.evard@gmail.com>, qemu-devel@nongnu.org
In-Reply-To: <50F70AC3.9070202@gmail.com>
References: <50F5EBDA.2040208@gmail.com> <87mww9jhz1.fsf@codemonkey.ws>
	<50F70AC3.9070202@gmail.com>
User-Agent: Notmuch/0.13.2+93~ged93d79 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Thu, 17 Jan 2013 14:01:03 -0600
Message-ID: <874nifo9z4.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13011720-5518-0000-0000-00000AD286E1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.159
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: silence
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
X-List-Received-Date: Thu, 17 Jan 2013 20:01:37 -0000

Vadim Evard <v.e.evard@gmail.com> writes:

> Signed-off-by: Vadim Evard <v.e.evard@gmail.com>

Please post this as a top-level patch. (no in-reply-to)

Regards,

Anthony Liguori

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


