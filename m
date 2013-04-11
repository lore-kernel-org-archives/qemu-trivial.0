Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQOAv-00025y-3V
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2013 16:32:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1UQOAt-00023d-2M
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2013 16:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1UQOAs-0003pJ-1P
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2013 16:32:51 -0400
Received: from mail-ea0-x22b.google.com ([2a00:1450:4013:c01::22b]:49994)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1UQOAp-0003oZ-EX; Thu, 11 Apr 2013 16:32:47 -0400
Received: by mail-ea0-f171.google.com with SMTP id b15so920580eae.30
	for <multiple recipients>; Thu, 11 Apr 2013 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VK+w4TqiotQ2brSITX2HbO/fA1Z7mWEI/Sz69EO1Usc=;
	b=r/Ez96pQpqT/tjB0riNj8JZz9ZtCnMbzvGylyaLf5QrdyfQFqj/JohglMw2tFgLcb3
	J9b5/eQx7n+DtgA5TH9O8HjYUqVDgOlaCt6U/asJxbq2bcepa1kAqm9uYWK/nsAGF5Fk
	JQSpw6YsS8/TD67WEHG3+oCvrYFhlJOM7IgodIuL5BnzjOU2resQyKtxwqNPWgqVClTZ
	/GxtTo1wgoE6uHsfjoURCkoTTdO8zUNJ1YVmQbOFyxBe9qjvC9MtIXKTJpVGyKqxbCdz
	YQG5E9wjQrMY8585PxY0646doZsVn28Cq4jZeW+G/UnEJpzteE8l+ThbQk027x3xpc0V
	BaFQ==
X-Received: by 10.14.1.130 with SMTP id 2mr20449055eed.15.1365712365709;
	Thu, 11 Apr 2013 13:32:45 -0700 (PDT)
Received: from localhost (h59ec325f.selukar.dyn.perspektivbredband.net.
	[89.236.50.95])
	by mx.google.com with ESMTPS id b5sm7476154eew.16.2013.04.11.13.32.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 13:32:45 -0700 (PDT)
Date: Thu, 11 Apr 2013 22:32:41 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130411203241.GB4430@smtp.vpn>
References: <1365711706-23960-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365711706-23960-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22b
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cpu-exec: Allow "-d exec"
 in non-debug builds (drop CONFIG_DEBUG_EXEC)
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
X-List-Received-Date: Thu, 11 Apr 2013 20:32:52 -0000

On Thu, Apr 11, 2013 at 09:21:46PM +0100, Peter Maydell wrote:
> The CONFIG_DEBUG_EXEC define compiles out a single qemu_log_mask()
> call, which is a pretty trivial cost even for something in the main
> cpu_exec() loop.  Having this be conditionally defined means that
> '-d exec' on a non-debug build will silently do nothing.  Drop the
> define and the configure machinery that sets it, in favour of just
> always allowing this log option to be enabled at runtime.  As a
> concession to the mainloopiness, we use qemu_loglevel_mask()+qemu_log()
> rather than qemu_log_mask() to avoid the function call overhead.
> 
> Note that DEBUG_DISAS is always defined, so removing the
> '|| defined(CONFIG_DEBUG_EXEC)' from those conditionals makes
> no behavioural change for that logging.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I agree, lack of -d exec has bitten me a couple of times
aswell. A separate patch with an option to disable tb-
chaining would also be helpful imo.

Acked-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>



> ---
> I've been burnt at least once by asking a user to do a '-d exec'
> log only to find it didn't actually log anything...
> 
>  configure  |  3 ---
>  cpu-exec.c | 15 ++++++---------
>  2 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/configure b/configure
> index 1ed939a..73df181 100755
> --- a/configure
> +++ b/configure
> @@ -3471,9 +3471,6 @@ echo "ARCH=$ARCH" >> $config_host_mak
>  if test "$debug_tcg" = "yes" ; then
>    echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
>  fi
> -if test "$debug" = "yes" ; then
> -  echo "CONFIG_DEBUG_EXEC=y" >> $config_host_mak
> -fi
>  if test "$strip_opt" = "yes" ; then
>    echo "STRIP=${strip}" >> $config_host_mak
>  fi
> diff --git a/cpu-exec.c b/cpu-exec.c
> index e74e556..235ddee 100644
> --- a/cpu-exec.c
> +++ b/cpu-exec.c
> @@ -23,8 +23,6 @@
>  #include "qemu/atomic.h"
>  #include "sysemu/qtest.h"
>  
> -//#define CONFIG_DEBUG_EXEC
> -
>  bool qemu_cpu_has_work(CPUState *cpu)
>  {
>      return cpu_has_work(cpu);
> @@ -567,7 +565,7 @@ int cpu_exec(CPUArchState *env)
>                      env->exception_index = EXCP_INTERRUPT;
>                      cpu_loop_exit(env);
>                  }
> -#if defined(DEBUG_DISAS) || defined(CONFIG_DEBUG_EXEC)
> +#if defined(DEBUG_DISAS)
>                  if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
>                      /* restore flags in standard format */
>  #if defined(TARGET_I386)
> @@ -582,7 +580,7 @@ int cpu_exec(CPUArchState *env)
>                      log_cpu_state(env, 0);
>  #endif
>                  }
> -#endif /* DEBUG_DISAS || CONFIG_DEBUG_EXEC */
> +#endif /* DEBUG_DISAS */
>                  spin_lock(&tcg_ctx.tb_ctx.tb_lock);
>                  tb = tb_find_fast(env);
>                  /* Note: we do it here to avoid a gcc bug on Mac OS X when
> @@ -594,11 +592,10 @@ int cpu_exec(CPUArchState *env)
>                      next_tb = 0;
>                      tcg_ctx.tb_ctx.tb_invalidated_flag = 0;
>                  }
> -#ifdef CONFIG_DEBUG_EXEC
> -                qemu_log_mask(CPU_LOG_EXEC, "Trace %p [" TARGET_FMT_lx "] %s\n",
> -                             tb->tc_ptr, tb->pc,
> -                             lookup_symbol(tb->pc));
> -#endif
> +                if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
> +                    qemu_log("Trace %p [" TARGET_FMT_lx "] %s\n",
> +                             tb->tc_ptr, tb->pc, lookup_symbol(tb->pc));
> +                }
>                  /* see if we can patch the calling TB. When the TB
>                     spans two pages, we cannot safely do a direct
>                     jump. */
> -- 
> 1.7.11.4
> 
> 

