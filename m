Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RsiO4-0006JE-BV
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2012 17:10:44 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiO1-0006Cv-Tz
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:10:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RsiO0-00087l-U5
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 17:10:41 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:47302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RsiNs-00083E-BP; Wed, 01 Feb 2012 17:10:32 -0500
Received: by mail-pw0-f45.google.com with SMTP id a11so1880865pba.4
	for <multiple recipients>; Wed, 01 Feb 2012 14:10:31 -0800 (PST)
Received: by 10.68.235.103 with SMTP id ul7mr1449761pbc.46.1328134231807;
	Wed, 01 Feb 2012 14:10:31 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id c5sm1196653pbq.13.2012.02.01.14.10.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 14:10:30 -0800 (PST)
Message-ID: <4F29B853.4070805@codemonkey.ws>
Date: Wed, 01 Feb 2012 16:10:27 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Michael Roth <mdroth@linux.vnet.ibm.com>
References: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1327166033-17922-1-git-send-email-mdroth@linux.vnet.ibm.com>
In-Reply-To: <1327166033-17922-1-git-send-email-mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] main-loop: For tools,
 initialize timers as part of qemu_init_main_loop()
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
X-List-Received-Date: Wed, 01 Feb 2012 22:10:43 -0000

On 01/21/2012 11:13 AM, Michael Roth wrote:
> In some cases initializing the alarm timers can lead to non-negligable
> overhead from programs that link against qemu-tool.o. At least,
> setting a max-resolution WinMM alarm timer via mm_start_timer() (the
> current default for Windows) can increase the "tick rate" on Windows
> OSs and affect frequency scaling, and in the case of tools that run
> in guest OSs such has qemu-ga, the impact can be fairly dramatic
> (+20%/20% user/sys time on a core 2 processor was observed from an idle
> Windows XP guest).
>
> This patch doesn't address the issue directly (not sure what a good
> solution would be for Windows, or what other situations it might be
> noticeable), but it at least limits the scope of the issue to programs
> that "opt-in" to using the main-loop.c functions by only enabling alarm
> timers when qemu_init_main_loop() is called, which is already required
> to make use of those facilities, so existing users shouldn't be
> affected.
>
> Signed-off-by: Michael Roth<mdroth@linux.vnet.ibm.com>

Applied.  Thanks.

Regards,

Anthony Liguori
> ---
>   main-loop.c |    2 +-
>   main-loop.h |   12 ++++++++++++
>   qemu-tool.c |    3 ++-
>   vl.c        |    5 +++++
>   4 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/main-loop.c b/main-loop.c
> index 62d95b9..db23de0 100644
> --- a/main-loop.c
> +++ b/main-loop.c
> @@ -199,7 +199,7 @@ static int qemu_signal_init(void)
>   }
>   #endif
>
> -int qemu_init_main_loop(void)
> +int main_loop_init(void)
>   {
>       int ret;
>
> diff --git a/main-loop.h b/main-loop.h
> index f971013..4987041 100644
> --- a/main-loop.h
> +++ b/main-loop.h
> @@ -41,10 +41,22 @@
>    * SIGUSR2, thread signals (SIGFPE, SIGILL, SIGSEGV, SIGBUS) and real-time
>    * signals if available.  Remember that Windows in practice does not have
>    * signals, though.
> + *
> + * In the case of QEMU tools, this will also start/initialize timers.
>    */
>   int qemu_init_main_loop(void);
>
>   /**
> + * main_loop_init: Initializes main loop
> + *
> + * Internal (but shared for compatibility reasons) initialization routine
> + * for the main loop. This should not be used by applications directly,
> + * use qemu_init_main_loop() instead.
> + *
> + */
> +int main_loop_init(void);
> +
> +/**
>    * main_loop_wait: Run one iteration of the main loop.
>    *
>    * If @nonblocking is true, poll for events, otherwise suspend until
> diff --git a/qemu-tool.c b/qemu-tool.c
> index 6b69668..183a583 100644
> --- a/qemu-tool.c
> +++ b/qemu-tool.c
> @@ -83,11 +83,12 @@ void qemu_clock_warp(QEMUClock *clock)
>   {
>   }
>
> -static void __attribute__((constructor)) init_main_loop(void)
> +int qemu_init_main_loop(void)
>   {
>       init_clocks();
>       init_timer_alarm();
>       qemu_clock_enable(vm_clock, false);
> +    return main_loop_init();
>   }
>
>   void slirp_select_fill(int *pnfds, fd_set *readfds,
> diff --git a/vl.c b/vl.c
> index ba55b35..74a47e6 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2136,6 +2136,11 @@ static void free_and_trace(gpointer mem)
>       free(mem);
>   }
>
> +int qemu_init_main_loop(void)
> +{
> +    return main_loop_init();
> +}
> +
>   int main(int argc, char **argv, char **envp)
>   {
>       const char *gdbstub_dev = NULL;


