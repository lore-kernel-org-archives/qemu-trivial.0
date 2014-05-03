Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgVyf-0000Av-8l
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 05:11:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVyZ-0008Vf-Uu
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 05:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVyV-0005qX-EG
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 05:11:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WgVyL-0005nn-TZ; Sat, 03 May 2014 05:11:06 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BEDF94027E;
	Sat,  3 May 2014 13:11:04 +0400 (MSK)
Message-ID: <5364B2A8.7050709@msgid.tls.msk.ru>
Date: Sat, 03 May 2014 13:11:04 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1399041361-30496-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1399041361-30496-2-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1399041361-30496-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2 1/7] do not call g_thread_init() for
 glib >= 2.31
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
X-List-Received-Date: Sat, 03 May 2014 09:11:24 -0000

02.05.2014 18:35, Michael Tokarev wrote:
> glib >= 2.31 always enables thread support and g_thread_supported()
> is #defined to 1, there's no need to call g_thread_init() anymore,
> and it definitely does not need to report error which never happens.
> Keep code for old < 2.31 glibc anyway for now, just #ifdef it
> differently.

Applied to -trivial, thanks!

/mjt

> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: qemu-trivial@nongnu.org
> ---
>  coroutine-gthread.c |    7 ++-----
>  util/osdep.c        |   21 +++++++++------------
>  2 files changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/coroutine-gthread.c b/coroutine-gthread.c
> index d3e5b99..a61efe0 100644
> --- a/coroutine-gthread.c
> +++ b/coroutine-gthread.c
> @@ -115,14 +115,11 @@ static inline GThread *create_thread(GThreadFunc func, gpointer data)
>  
>  static void __attribute__((constructor)) coroutine_init(void)
>  {
> -    if (!g_thread_supported()) {
>  #if !GLIB_CHECK_VERSION(2, 31, 0)
> +    if (!g_thread_supported()) {
>          g_thread_init(NULL);
> -#else
> -        fprintf(stderr, "glib threading failed to initialize.\n");
> -        exit(1);
> -#endif
>      }
> +#endif
>  
>      init_coroutine_cond();
>  }
> diff --git a/util/osdep.c b/util/osdep.c
> index a9029f8..b2bd154 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -436,23 +436,20 @@ int socket_init(void)
>      return 0;
>  }
>  
> -/* Ensure that glib is running in multi-threaded mode */
> +#if !GLIB_CHECK_VERSION(2, 31, 0)
> +/* Ensure that glib is running in multi-threaded mode
> + * Old versions of glib require explicit initialization.  Failure to do
> + * this results in the single-threaded code paths being taken inside
> + * glib.  For example, the g_slice allocator will not be thread-safe
> + * and cause crashes.
> + */
>  static void __attribute__((constructor)) thread_init(void)
>  {
>      if (!g_thread_supported()) {
> -#if !GLIB_CHECK_VERSION(2, 31, 0)
> -        /* Old versions of glib require explicit initialization.  Failure to do
> -         * this results in the single-threaded code paths being taken inside
> -         * glib.  For example, the g_slice allocator will not be thread-safe
> -         * and cause crashes.
> -         */
> -        g_thread_init(NULL);
> -#else
> -        fprintf(stderr, "glib threading failed to initialize.\n");
> -        exit(1);
> -#endif
> +       g_thread_init(NULL);
>      }
>  }
> +#endif
>  
>  #ifndef CONFIG_IOVEC
>  /* helper function for iov_send_recv() */
> 


