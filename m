Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bFRG0-0006ah-Bx
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jun 2016 15:22:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riku.voipio@linaro.org>) id 1bFRFx-0006YT-8o
	for qemu-trivial@nongnu.org; Tue, 21 Jun 2016 15:22:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riku.voipio@linaro.org>) id 1bFRFw-0004nK-Bz
	for qemu-trivial@nongnu.org; Tue, 21 Jun 2016 15:22:41 -0400
Received: from jessie.kos.to ([212.47.231.226]:41134 helo=pilvi.kos.to)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riku.voipio@linaro.org>)
	id 1bFRFp-0004ks-W1; Tue, 21 Jun 2016 15:22:34 -0400
Received: from beaming.home (91-157-170-157.elisa-laajakaista.fi
	[91.157.170.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pilvi.kos.to (Postfix) with ESMTPSA id 7748F2C34EB;
	Tue, 21 Jun 2016 19:22:28 +0000 (UTC)
Received: (nullmailer pid 31578 invoked by uid 1000);
	Tue, 21 Jun 2016 19:22:27 -0000
Date: Tue, 21 Jun 2016 22:22:27 +0300
From: Riku Voipio <riku.voipio@iki.fi>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160621192227.GB21172@beaming.home>
References: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.47.231.226
Subject: Re: [Qemu-trivial] [PATCH] linux-user,
 trivial: display "0x%x" instead of "0x%d"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2016 19:22:42 -0000

On Mon, Jun 20, 2016 at 11:51:32AM +0200, Laurent Vivier wrote:
> Display an exception number, generally defined as an hexadecimal
> number (for instance, EXCP_HLT is 0x10001).

Acked-by: Riku Voipio <riku.voipio@linaro.org>

> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
> Resent to fix qemu-trivial email address.
> 
>  linux-user/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index b9a4e0e..c79f5cb 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -2036,7 +2036,7 @@ void cpu_loop(CPUPPCState *env)
>              /* just indicate that signals should be handled asap */
>              break;
>          default:
> -            cpu_abort(cs, "Unknown exception 0x%d. Aborting\n", trapnr);
> +            cpu_abort(cs, "Unknown exception 0x%x. Aborting\n", trapnr);
>              break;
>          }
>          process_pending_signals(env);
> -- 
> 2.5.5
> 

