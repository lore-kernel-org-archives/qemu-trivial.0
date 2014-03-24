Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS1PT-0000Ur-Ep
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 05:43:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1WS0sM-0001X7-Eo
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 05:09:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>) id 1WS0sH-0005sc-Lf
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 05:08:58 -0400
Received: from afflict.kos.to ([92.243.29.197]:56270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nchip@afflict.kos.to>)
	id 1WS0gy-0001XD-BY; Mon, 24 Mar 2014 04:57:12 -0400
Received: by afflict.kos.to (Postfix, from userid 1000)
	id A8B2A26567; Mon, 24 Mar 2014 09:57:09 +0100 (CET)
Date: Mon, 24 Mar 2014 10:57:09 +0200
From: Riku Voipio <riku.voipio@iki.fi>
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
Message-ID: <20140324085709.GA31666@afflict.kos.to>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<1395566923-5074-5-git-send-email-prasadjoshi.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395566923-5074-5-git-send-email-prasadjoshi.linux@gmail.com>
X-message-flag: Warning: message not sent with a DRM-Certified client
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 92.243.29.197
X-Mailman-Approved-At: Mon, 24 Mar 2014 05:43:10 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH 5/6] linux-user: remove duplicate
	statement
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
X-List-Received-Date: Mon, 24 Mar 2014 09:09:03 -0000

On Sun, Mar 23, 2014 at 02:58:42PM +0530, Prasad Joshi wrote:
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>a

Acked-by: Riku Voipio <riku.voipio@linaro.org>

> ---
>  linux-user/signal.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index e5fb933..7d6246f 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -4043,8 +4043,6 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
>      struct target_rt_sigframe *frame;
>      abi_ulong info_addr, uc_addr;
>  
> -    frame_addr = get_sigframe(ka, env, sizeof *frame);
> -
>      frame_addr = get_sigframe(ka, env, sizeof(*frame));
>      if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
>          goto give_sigsegv;
> -- 
> 1.8.1.2

