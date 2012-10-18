Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOtLw-0005xG-6r
	for mharc-qemu-trivial@gnu.org; Thu, 18 Oct 2012 12:53:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TOtLt-0005qv-Bx
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 12:53:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TOtLs-000813-8g
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 12:53:45 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:37062)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TOtLm-0007zB-Ib; Thu, 18 Oct 2012 12:53:38 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6304E7280041; Thu, 18 Oct 2012 18:53:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id oV0oLv0jo8kY; Thu, 18 Oct 2012 18:53:36 +0200 (CEST)
Received: from [192.168.178.20] (p5086EFF2.dip.t-dialin.net [80.134.239.242])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	8095F728003B; Thu, 18 Oct 2012 18:53:36 +0200 (CEST)
Message-ID: <5080340F.8000205@weilnetz.de>
Date: Thu, 18 Oct 2012 18:53:35 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1350578453-24368-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1350578453-24368-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] ui/vnc-jobs.c: Fix minor typos in
	comments
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
X-List-Received-Date: Thu, 18 Oct 2012 16:53:46 -0000

Am 18.10.2012 18:40, schrieb Peter Maydell:
> Fix some minor typos/grammar errors in comments.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: reinstated carelessly dropped 'if', noted by Stefan Weil.
>
>   ui/vnc-jobs.c |   16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
> index 087b84d..3c592b3 100644
> --- a/ui/vnc-jobs.c
> +++ b/ui/vnc-jobs.c
> @@ -33,21 +33,21 @@
>   /*
>    * Locking:
>    *
> - * There is three levels of locking:
> + * There are three levels of locking:
>    * - jobs queue lock: for each operation on the queue (push, pop, isEmpty?)
>    * - VncDisplay global lock: mainly used for framebuffer updates to avoid
>    *                      screen corruption if the framebuffer is updated
> - *			while the worker is doing something.
> + *                      while the worker is doing something.
>    * - VncState::output lock: used to make sure the output buffer is not corrupted
> - * 		   	 if two threads try to write on it at the same time
> + *                          if two threads try to write on it at the same time
>    *
> - * While the VNC worker thread is working, the VncDisplay global lock is hold
> - * to avoid screen corruptions (this does not block vnc_refresh() because it
> - * uses trylock()) but the output lock is not hold because the thread work on
> + * While the VNC worker thread is working, the VncDisplay global lock is held
> + * to avoid screen corruption (this does not block vnc_refresh() because it
> + * uses trylock()) but the output lock is not held because the thread works on
>    * its own output buffer.
>    * When the encoding job is done, the worker thread will hold the output lock
>    * and copy its output buffer in vs->output.
> -*/
> + */
>   
>   struct VncJobQueue {
>       QemuCond cond;
> @@ -62,7 +62,7 @@ typedef struct VncJobQueue VncJobQueue;
>   
>   /*
>    * We use a single global queue, but most of the functions are
> - * already reetrant, so we can easilly add more than one encoding thread
> + * already reentrant, so we can easily add more than one encoding thread
>    */
>   static VncJobQueue *queue;
>   


Reviewed-by: Stefan Weil <sw@weilnetz.de>


