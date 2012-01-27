Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqedg-0001UW-1l
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 00:46:20 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rqedd-0001MQ-Al
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 00:46:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rqedc-0005q6-7s
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 00:46:17 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:63395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RqedZ-0005pl-7d; Fri, 27 Jan 2012 00:46:13 -0500
Received: by dajr28 with SMTP id r28so1408420daj.4
	for <multiple recipients>; Thu, 26 Jan 2012 21:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F/EUeuoG9lwr98Eco1iYViPTma7mhTeG7FKc9njOFeo=;
	b=Zp9c6MgAyOdZ0gde6pes07T8p+yAyEikiQZ0oq4RoaJluMavZLjMZAEoj1TGdKxBNh
	74/aIIU+yB5dO9ZrsZWQYlt66fGTBW8a3zkMvl8IF6h2VFg3q/OywUdOWb0RTO29vp/F
	8JWoNq23ECnIX9BEIz8bvhjg90cNq22GBQTVA=
Received: by 10.68.199.170 with SMTP id jl10mr11784090pbc.21.1327643172002;
	Thu, 26 Jan 2012 21:46:12 -0800 (PST)
Received: from localhost (42-98-55-070.static.netvigator.com. [42.98.55.70])
	by mx.google.com with ESMTPS id i4sm17273298pbl.2.2012.01.26.21.46.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 21:46:10 -0800 (PST)
Date: Fri, 27 Jan 2012 05:46:06 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20120127054606.GC17836@stefanha-thinkpad.localdomain>
References: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1327166033-17922-1-git-send-email-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1327166033-17922-1-git-send-email-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] main-loop: For tools,
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
X-List-Received-Date: Fri, 27 Jan 2012 05:46:18 -0000

On Sat, Jan 21, 2012 at 11:13:53AM -0600, Michael Roth wrote:
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
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> ---
>  main-loop.c |    2 +-
>  main-loop.h |   12 ++++++++++++
>  qemu-tool.c |    3 ++-
>  vl.c        |    5 +++++
>  4 files changed, 20 insertions(+), 2 deletions(-)

static struct qemu_alarm_timer alarm_timers[] = {
#ifndef _WIN32
#ifdef __linux__
    {"dynticks", dynticks_start_timer,
     dynticks_stop_timer, dynticks_rearm_timer},
#endif
    {"unix", unix_start_timer, unix_stop_timer, unix_rearm_timer},
#else
    {"mmtimer", mm_start_timer, mm_stop_timer, mm_rearm_timer},
    {"dynticks", win32_start_timer, win32_stop_timer, win32_rearm_timer},
#endif

It seems Windows host already has a "dynticks" implementation.  Have you
tried using this instead of "mmtimer"?

mm_start_timer() is using 1 ms intervals!

Stefan

