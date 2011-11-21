Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSTzo-00078T-VC
	for mharc-qemu-trivial@gnu.org; Mon, 21 Nov 2011 08:33:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RSTzi-00077p-1m
	for qemu-trivial@nongnu.org; Mon, 21 Nov 2011 08:33:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RSTzc-0007Wj-6N
	for qemu-trivial@nongnu.org; Mon, 21 Nov 2011 08:33:10 -0500
Received: from mout.web.de ([212.227.15.3]:53903)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1RSTzb-0007WT-RH; Mon, 21 Nov 2011 08:33:04 -0500
Received: from envy.site ([82.113.106.162]) by smtp.web.de (mrweb002) with
	ESMTPA (Nemesis) id 0MC1RI-1RbJhE2yHY-008uph;
	Mon, 21 Nov 2011 14:33:02 +0100
Message-ID: <4ECA52E8.6050801@web.de>
Date: Mon, 21 Nov 2011 14:32:24 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1321730319-21498-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1321730319-21498-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:tirkhbJh7WzRTgk/qRgJm8nbChY/mfsSe1uCaJdwb3N
	6Li/PZjLxrAt+i3Yv7R+V81i7AmPTJjM5HHvPAIQo6hmlg6M7J
	jur6OM6zJrBqLGYNww7iZO6C76Wv1RSGxTdD7UTcBRxVDDu9eD
	wRwLYqSCOnRkAzEOmW8Qo7pm4TSaezTkW9cLMWsEzCg+e9HH7a
	LkE5RLa5SXq1s38iCl8gQ==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.15.3
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] darwin-user: Fix format
 string in debug message
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
X-List-Received-Date: Mon, 21 Nov 2011 13:33:13 -0000

Am 19.11.2011 20:18, schrieb Stefan Weil:
> This was spotted by cppcheck.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  darwin-user/signal.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/darwin-user/signal.c b/darwin-user/signal.c
> index c530227..317ef92 100644
> --- a/darwin-user/signal.c
> +++ b/darwin-user/signal.c
> @@ -270,8 +270,7 @@ int do_sigaction(int sig, const struct sigaction *act,
>          host_sig = target_to_host_signal(sig);
>          if (host_sig != SIGSEGV && host_sig != SIGBUS) {
>  #if defined(DEBUG_SIGNAL)
> -    fprintf(stderr, "sigaction handler going to call sigaction\n",
> -            act->sa_handler, act->sa_flags, act->sa_mask);
> +            fprintf(stderr, "sigaction handler going to call sigaction\n");
>  #endif
>  
>              sigfillset(&act1.sa_mask);

Is the debug output really useful without the information? Maybe rather
append %p %x %x? What does linux-user do?

Andreas

