Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTVWQ-000875-11
	for mharc-qemu-trivial@gnu.org; Wed, 10 Feb 2016 09:13:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aTVWN-00084p-PL
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 09:13:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aTVWM-0002mB-Rq
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 09:13:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aTVWI-0002lL-Fn; Wed, 10 Feb 2016 09:13:26 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 25E80804FD;
	Wed, 10 Feb 2016 14:13:26 +0000 (UTC)
Received: from [10.36.112.58] (ovpn-112-58.ams2.redhat.com [10.36.112.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1AEDLHW001807
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 10 Feb 2016 09:13:23 -0500
To: Christopher Covington <cov@codeaurora.org>
References: <1455113192-27139-1-git-send-email-cov@codeaurora.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56BB4581.5010508@redhat.com>
Date: Wed, 10 Feb 2016 15:13:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455113192-27139-1-git-send-email-cov@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] Rename cpu_get_icount_{locked,biased}
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
X-List-Received-Date: Wed, 10 Feb 2016 14:13:32 -0000



On 10/02/2016 15:06, Christopher Covington wrote:
> The function does not provide locking but rather adds a bias value.

"Locked" means that you need to take a look outside its call; see how
cpu_get_icount() uses it.

Basically the idea is that a "_locked" in the name warns you to pay
attention. :)

Paolo

> Signed-off-by: Christopher Covington <cov@codeaurora.org>
> ---
>  cpus.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/cpus.c b/cpus.c
> index 898426c..50403c4 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -164,7 +164,7 @@ int64_t cpu_get_icount_raw(void)
>  }
>  
>  /* Return the virtual CPU time, based on the instruction counter.  */
> -static int64_t cpu_get_icount_locked(void)
> +static int64_t cpu_get_icount_biased(void)
>  {
>      int64_t icount = cpu_get_icount_raw();
>      return timers_state.qemu_icount_bias + cpu_icount_to_ns(icount);
> @@ -177,7 +177,7 @@ int64_t cpu_get_icount(void)
>  
>      do {
>          start = seqlock_read_begin(&timers_state.vm_clock_seqlock);
> -        icount = cpu_get_icount_locked();
> +        icount = cpu_get_icount_biased();
>      } while (seqlock_read_retry(&timers_state.vm_clock_seqlock, start));
>  
>      return icount;
> @@ -293,7 +293,7 @@ static void icount_adjust(void)
>  
>      seqlock_write_lock(&timers_state.vm_clock_seqlock);
>      cur_time = cpu_get_clock_locked();
> -    cur_icount = cpu_get_icount_locked();
> +    cur_icount = cpu_get_icount_biased();
>  
>      delta = cur_icount - cur_time;
>      /* FIXME: This is a very crude algorithm, somewhat prone to oscillation.  */
> @@ -356,7 +356,7 @@ static void icount_warp_rt(void)
>               * In adaptive mode, do not let QEMU_CLOCK_VIRTUAL run too
>               * far ahead of real time.
>               */
> -            int64_t cur_icount = cpu_get_icount_locked();
> +            int64_t cur_icount = cpu_get_icount_biased();
>              int64_t delta = clock - cur_icount;
>              warp_delta = MIN(warp_delta, delta);
>          }
> 

