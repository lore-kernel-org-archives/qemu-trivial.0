Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgVzP-00015H-Qo
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 05:12:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVzK-0000yi-IW
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 05:12:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVzG-00065s-2Z
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 05:12:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WgVz6-000640-NI; Sat, 03 May 2014 05:11:52 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0C5224027E;
	Sat,  3 May 2014 13:11:52 +0400 (MSK)
Message-ID: <5364B2D7.8060306@msgid.tls.msk.ru>
Date: Sat, 03 May 2014 13:11:51 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1399041361-30496-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1399041361-30496-3-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1399041361-30496-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2 2/7] glib: move g_poll() replacement
 into glib-compat.h
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
X-List-Received-Date: Sat, 03 May 2014 09:12:11 -0000

02.05.2014 18:35, Michael Tokarev wrote:
> From: Stefan Hajnoczi <stefanha@redhat.com>
> 
> We have a dedicated header file for wrappers to smooth over glib version
> differences.  Move the g_poll() definition into glib-compat.h for
> consistency.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Cc: qemu-trivial@nongnu.org

Applied to -trivial, thanks!

/mjt

>  include/glib-compat.h |   12 ++++++++++++
>  include/qemu-common.h |   12 ------------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 8aa77af..8d25900 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -24,4 +24,16 @@ static inline guint g_timeout_add_seconds(guint interval, GSourceFunc function,
>  }
>  #endif
>  
> +#if !GLIB_CHECK_VERSION(2, 20, 0)
> +/*
> + * Glib before 2.20.0 doesn't implement g_poll, so wrap it to compile properly
> + * on older systems.
> + */
> +static inline gint g_poll(GPollFD *fds, guint nfds, gint timeout)
> +{
> +    GMainContext *ctx = g_main_context_default();
> +    return g_main_context_get_poll_func(ctx)(fds, nfds, timeout);
> +}
> +#endif
> +
>  #endif
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index a998e8d..3f3fd60 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -124,18 +124,6 @@ int qemu_main(int argc, char **argv, char **envp);
>  void qemu_get_timedate(struct tm *tm, int offset);
>  int qemu_timedate_diff(struct tm *tm);
>  
> -#if !GLIB_CHECK_VERSION(2, 20, 0)
> -/*
> - * Glib before 2.20.0 doesn't implement g_poll, so wrap it to compile properly
> - * on older systems.
> - */
> -static inline gint g_poll(GPollFD *fds, guint nfds, gint timeout)
> -{
> -    GMainContext *ctx = g_main_context_default();
> -    return g_main_context_get_poll_func(ctx)(fds, nfds, timeout);
> -}
> -#endif
> -
>  /**
>   * is_help_option:
>   * @s: string to test
> 


