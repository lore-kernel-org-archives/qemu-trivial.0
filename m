Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRPIH-0004dR-Qu
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2011 09:47:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QRPIF-0004ZG-Pj
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 09:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1QRPIE-0003lB-OO
	for qemu-trivial@nongnu.org; Tue, 31 May 2011 09:47:35 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:37876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1QRPIC-0003kj-Jt; Tue, 31 May 2011 09:47:32 -0400
Received: by yxk8 with SMTP id 8so2125602yxk.4
	for <multiple recipients>; Tue, 31 May 2011 06:47:31 -0700 (PDT)
Received: by 10.236.119.81 with SMTP id m57mr5982011yhh.504.1306849651736;
	Tue, 31 May 2011 06:47:31 -0700 (PDT)
Received: from [192.168.0.107] (cpe-70-123-132-139.austin.res.rr.com
	[70.123.132.139])
	by mx.google.com with ESMTPS id o47sm55365yhn.72.2011.05.31.06.47.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 06:47:27 -0700 (PDT)
Message-ID: <4DE4F16D.6030009@codemonkey.ws>
Date: Tue, 31 May 2011 08:47:25 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>
References: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>
In-Reply-To: <1306705831-59385-1-git-send-email-andreas.faerber@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use SIGIO with caution
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
X-List-Received-Date: Tue, 31 May 2011 13:47:36 -0000

On 05/29/2011 04:50 PM, Andreas Färber wrote:
> BeOS and Haiku don't define SIGIO. When undefined, it won't arrive
> and doesn't need to be blocked.
>
> Signed-off-by: Andreas Färber<andreas.faerber@web.de>

Anything to do with signal masks is never a trivial patch BTW...

But I actually think explicit handling of SIGIO is unneeded.  I think 
this is a hold over from the pre-I/O thread days where we selectively 
set SIGIO on certain file descriptors to make sure that when an IO fd 
became readable, we received a signal to break out of the KVM emulation 
loop.

Can the folks on CC confirm/deny?

I can't see any use of SIGIO in the current source tree.

Regards,

Anthony Liguori

> ---
>   cpus.c |    8 ++++++++
>   1 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/cpus.c b/cpus.c
> index 1fc34b7..42af291 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -395,7 +395,9 @@ static int qemu_signal_init(void)
>       pthread_sigmask(SIG_UNBLOCK,&set, NULL);
>
>       sigemptyset(&set);
> +#ifdef SIGIO
>       sigaddset(&set, SIGIO);
> +#endif
>       sigaddset(&set, SIGALRM);
>       sigaddset(&set, SIG_IPI);
>       sigaddset(&set, SIGBUS);
> @@ -408,7 +410,9 @@ static int qemu_signal_init(void)
>            * We need to process timer signals synchronously to avoid a race
>            * between exit_request check and KVM vcpu entry.
>            */
> +#ifdef SIGIO
>           sigaddset(&set, SIGIO);
> +#endif
>           sigaddset(&set, SIGALRM);
>       }
>   #endif
> @@ -449,12 +453,16 @@ static void qemu_kvm_init_cpu_signals(CPUState *env)
>   #else
>       sigemptyset(&set);
>       sigaddset(&set, SIG_IPI);
> +#ifdef SIGIO
>       sigaddset(&set, SIGIO);
> +#endif
>       sigaddset(&set, SIGALRM);
>       pthread_sigmask(SIG_BLOCK,&set, NULL);
>
>       pthread_sigmask(SIG_BLOCK, NULL,&set);
> +#ifdef SIGIO
>       sigdelset(&set, SIGIO);
> +#endif
>       sigdelset(&set, SIGALRM);
>   #endif
>       sigdelset(&set, SIG_IPI);


