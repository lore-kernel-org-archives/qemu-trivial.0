Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqgso-0005xf-Dl
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 03:10:06 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Rqgsj-0005v3-Ob
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 03:10:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Rqgsi-0004Z8-Jx
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 03:10:01 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:33374)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Rqgsi-0004Yx-7Q; Fri, 27 Jan 2012 03:10:00 -0500
Received: by wgbdr12 with SMTP id dr12so1439812wgb.10
	for <multiple recipients>; Fri, 27 Jan 2012 00:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=17ZUNkeGKP8daxb/MTHHYzBu2ZxjyaNbf1EjcnktWwY=;
	b=wHOo8xe///YBM2+d3N7T91wJmzyi02tkHbJb9UWxFi0ewiBoCch47os2Tbj5IbUAkB
	tGWTuzcGVQD8mlQO8ja4iTh9H3neN30+aZeQKqrPzyTSCd6lgHRodR263vGgHPAm4Buc
	UR9rqMOUdyrpRnO5Pb1Wu/4/KRT0xmGZCvB4I=
Received: by 10.180.94.68 with SMTP id da4mr8636885wib.22.1327651799466;
	Fri, 27 Jan 2012 00:09:59 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id t6sm9993659wid.1.2012.01.27.00.09.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 00:09:56 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4F225BD3.4090300@redhat.com>
Date: Fri, 27 Jan 2012 09:09:55 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1327166033-17922-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<20120127054606.GC17836@stefanha-thinkpad.localdomain>
In-Reply-To: <20120127054606.GC17836@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Fri, 27 Jan 2012 08:10:03 -0000

On 01/27/2012 06:46 AM, Stefan Hajnoczi wrote:
> #ifndef _WIN32
> #ifdef __linux__
>      {"dynticks", dynticks_start_timer,
>       dynticks_stop_timer, dynticks_rearm_timer},
> #endif
>      {"unix", unix_start_timer, unix_stop_timer, unix_rearm_timer},
> #else
>      {"mmtimer", mm_start_timer, mm_stop_timer, mm_rearm_timer},
>      {"dynticks", win32_start_timer, win32_stop_timer, win32_rearm_timer},
> #endif
>
> It seems Windows host already has a "dynticks" implementation.  Have you
> tried using this instead of "mmtimer"?

The dynticks Win32 timer doesn't boot Linux successfully, even though 
under Wine it works and it is actually more reliable than mmtimer (which 
is why I haven't thrown it away yet).

> mm_start_timer() is using 1 ms intervals!

No, it's setting a 1 ms system quantum via timeBeginPeriod.  The actual 
implementation is using dynamic rather than periodic ticks (it has a 
rearm callback).  We threw away periodic timers a few months ago.

The problem is that Windows doesn't have something like Linux NOHZ and 
limits the timer resolution to the system quanta.  That's 1 ms for 
mmtimer and 10 ms (the default) for dynticks right now.  However, I 
suspect that the solution is to move timeBeginPeriod and timeEndPeriod 
from timer code to generic QEMU code, dynticks would start working on 
native Windows too.  Besides possibly fixing QEMU, it would definitely 
fix Michael's problem, too.  Tools do not need such a fine-grained 
timer, and shorter quanta cause the increased CPU usage that Michael 
observed.

However, Michael's patch makes sense as a cleanup anyway.  Since we have 
an initialization function, there's no need to have that _and_ a 
constructor.

Paolo

