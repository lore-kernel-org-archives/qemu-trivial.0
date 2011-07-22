Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QkMeZ-00066Z-7U
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jul 2011 16:48:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QkMeW-0005wi-G8
	for qemu-trivial@nongnu.org; Fri, 22 Jul 2011 16:48:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QkMeV-0006Rq-Fn
	for qemu-trivial@nongnu.org; Fri, 22 Jul 2011 16:48:56 -0400
Received: from fmmailgate02.web.de ([217.72.192.227]:34659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QkMeS-0006RN-R9; Fri, 22 Jul 2011 16:48:52 -0400
Received: from smtp02.web.de  ( [172.20.0.184])
	by fmmailgate02.web.de (Postfix) with ESMTP id 8A2121A705521;
	Fri, 22 Jul 2011 22:48:51 +0200 (CEST)
Received: from [87.173.120.112] (helo=[10.0.1.1])
	by smtp02.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QkMeR-0002qt-00; Fri, 22 Jul 2011 22:48:51 +0200
Message-Id: <1A5A263C-4EFA-4BF5-AC6E-937D109C8DA7@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Stefan Weil <weil@mail.berlios.de>
In-Reply-To: <1311190818-4793-1-git-send-email-weil@mail.berlios.de>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Fri, 22 Jul 2011 22:48:50 +0200
References: <1311190818-4793-1-git-send-email-weil@mail.berlios.de>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX1/c7snCx+JEjGXzy0CW7fxnMEMM5p4UY5LtcqMd
	s8JKl8uMGyULWYPMxgfBE2XyRi+E6bnk6WurVJ4HGW5ab0PRdQ
	0tOWloKf5Ct/sbMqkAbw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] darwin-user: Remove two
	unused variables
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
X-List-Received-Date: Fri, 22 Jul 2011 20:48:57 -0000

Hi Stefan W.,

Am 20.07.2011 um 21:40 schrieb Stefan Weil:

> cppcheck report:
>
> darwin-user/signal.c:322: style: Unused variable: i
> darwin-user/signal.c:322: style:
> Variable 'err' is assigned a value that is never used

Does this really bug you? I'm a bit skeptical towards trying to fix  
warnings in code that doesn't compile either way... (or does it by now?)

Andreas

>
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
> darwin-user/signal.c |    1 -
> 1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/darwin-user/signal.c b/darwin-user/signal.c
> index e2adca3..c530227 100644
> --- a/darwin-user/signal.c
> +++ b/darwin-user/signal.c
> @@ -319,7 +319,6 @@ static void setup_frame(int sig, struct  
> emulated_sigaction *ka,
> 			void *set, CPUState *env)
> {
> 	void *frame;
> -	int i, err = 0;
>
>     fprintf(stderr, "setup_frame %d\n", sig);
> 	frame = get_sigframe(ka, env, sizeof(*frame));
> -- 
> 1.7.2.5
>
>


