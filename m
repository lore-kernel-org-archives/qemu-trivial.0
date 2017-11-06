Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eBndD-0005YI-8p
	for mharc-qemu-trivial@gnu.org; Mon, 06 Nov 2017 15:04:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1eBndC-0005Xs-1W
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 15:04:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1eBndB-0001IJ-2S
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 15:04:26 -0500
Received: from jessie.kos.to ([212.47.231.226]:50012 helo=pilvi.kos.to)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <voipio@kos.to>)
	id 1eBnd5-0001GX-Rm; Mon, 06 Nov 2017 15:04:19 -0500
Received: from kos.to (jessie.kos.to [212.47.231.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pilvi.kos.to (Postfix) with ESMTPSA id 2BFA12C19BE;
	Mon,  6 Nov 2017 20:04:18 +0000 (UTC)
Received: (nullmailer pid 20775 invoked by uid 1000);
	Mon, 06 Nov 2017 20:04:17 -0000
Date: Mon, 6 Nov 2017 20:04:17 +0000
From: Riku Voipio <riku.voipio@iki.fi>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20171106200417.GC19281@kos.to>
References: <1508364103-16131-1-git-send-email-cota@braap.org>
	<1508364103-16131-3-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508364103-16131-3-git-send-email-cota@braap.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.47.231.226
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] linux-user: fix
 'finshed' typo in comment
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
X-List-Received-Date: Mon, 06 Nov 2017 20:04:27 -0000

Applied to linux-user, thanks

Riku

On Wed, Oct 18, 2017 at 06:01:41PM -0400, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9d4cc4c..47b4a79 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6231,7 +6231,7 @@ static void *clone_func(void *arg)
>      pthread_mutex_lock(&info->mutex);
>      pthread_cond_broadcast(&info->cond);
>      pthread_mutex_unlock(&info->mutex);
> -    /* Wait until the parent has finshed initializing the tls state.  */
> +    /* Wait until the parent has finished initializing the tls state.  */
>      pthread_mutex_lock(&clone_lock);
>      pthread_mutex_unlock(&clone_lock);
>      cpu_loop(env);
> -- 
> 2.7.4
> 
> 

