Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFFud-0001fn-Gc
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2013 00:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VFFuW-0001X5-GX
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 00:02:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VFFuR-0004YO-5H
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 00:02:12 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:38206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VFFuG-0004Xa-5J; Fri, 30 Aug 2013 00:01:56 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A289772819EA; Fri, 30 Aug 2013 06:01:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id kv4l3kJL9GDA; Fri, 30 Aug 2013 06:01:52 +0200 (CEST)
Received: from [192.168.178.35] (p54AD81C0.dip0.t-ipconnect.de
	[84.173.129.192])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	6C4FC72819DE; Fri, 30 Aug 2013 06:01:52 +0200 (CEST)
Message-ID: <5220192E.5040301@weilnetz.de>
Date: Fri, 30 Aug 2013 06:01:50 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Alex Bligh <alex@alex.org.uk>
References: <1377815534-13608-1-git-send-email-alex@alex.org.uk>
In-Reply-To: <1377815534-13608-1-git-send-email-alex@alex.org.uk>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCHv2] aio / timers: use g_usleep() not
	sleep()
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
X-List-Received-Date: Fri, 30 Aug 2013 04:02:18 -0000

Am 30.08.2013 00:32, schrieb Alex Bligh:
> sleep() apparently doesn't exist under mingw. Use g_usleep for
> portability.
>
> Signed-off-by: Alex Bligh <alex@alex.org.uk>
> ---
>  tests/test-aio.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/test-aio.c b/tests/test-aio.c
> index 4215701..c4fe0fc 100644
> --- a/tests/test-aio.c
> +++ b/tests/test-aio.c
> @@ -400,7 +400,7 @@ static void test_timer_schedule(void)
>      g_assert(!aio_poll(ctx, false));
>      g_assert_cmpint(data.n, ==, 0);
>  
> -    sleep(1);
> +    g_usleep(1 * G_USEC_PER_SEC);
>      g_assert_cmpint(data.n, ==, 0);
>  
>      g_assert(aio_poll(ctx, false));
> @@ -736,7 +736,7 @@ static void test_source_timer_schedule(void)
>  
>      g_assert_cmpint(data.n, ==, 0);
>  
> -    sleep(1);
> +    g_usleep(1 * G_USEC_PER_SEC);
>      g_assert_cmpint(data.n, ==, 0);
>  
>      g_assert(g_main_context_iteration(NULL, false));
> @@ -746,7 +746,7 @@ static void test_source_timer_schedule(void)
>      do {
>          g_assert(g_main_context_iteration(NULL, true));
>      } while (qemu_clock_get_ns(data.clock_type) <= expiry);
> -    sleep(1);
> +    g_usleep(1 * G_USEC_PER_SEC);
>      g_main_context_iteration(NULL, false);
>  
>      g_assert_cmpint(data.n, ==, 2);


Reviewed-by: Stefan Weil <sw@weilnetz.de>

I cc'ed the mail to qemu-trivial, so it can be applied there.

Stefan


