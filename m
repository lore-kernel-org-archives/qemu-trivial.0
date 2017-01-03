Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cOV0G-0000eG-B2
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2017 14:44:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1cOV0D-0000ce-MN
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2017 14:44:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1cOV0A-0006uV-Kq
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2017 14:44:09 -0500
Received: from mail.weilnetz.de ([37.221.199.173]:54384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1cOV0A-0006uI-E8
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2017 14:44:06 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 4288911810AD;
	Tue,  3 Jan 2017 20:44:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ikZFLxiQy5Q5; Tue,  3 Jan 2017 20:44:01 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC8BA3.dip0.t-ipconnect.de
	[84.172.139.163])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 9BC5A11810A8;
	Tue,  3 Jan 2017 20:44:01 +0100 (CET)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20170103191933.19416-1-marcandre.lureau@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <bd3b52ff-39c8-fcf4-ab47-15fcde35d19c@weilnetz.de>
Date: Tue, 3 Jan 2017 20:44:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170103191933.19416-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.221.199.173
Subject: Re: [Qemu-trivial] [PATCH] win32: use glib gpoll if glib >= 2.50
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
X-List-Received-Date: Tue, 03 Jan 2017 19:44:10 -0000

On 01/03/17 20:19, Marc-Andr=C3=A9 Lureau wrote:
> A fix has been committed in upstream glib commit
> 210a9796f78eb90f76f1bd6a304e9fea05e97617.
> (See also related bug https://bugzilla.gnome.org/show_bug.cgi?id=3D7644=
15)
>
> It is desirable to use the glib version instead of qemu copy, since it
> provides more debugging facilities (G_MAIN_POLL_DEBUG etc), and
> hopefully has a better maintainance. Hopefully, we can drop the qemu
> copy in a few years.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/glib-compat.h | 2 +-
>  util/oslib-win32.c    | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index acf254d2a0..0cd24ffbe9 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -39,7 +39,7 @@ static inline gint64 qemu_g_get_monotonic_time(void)
>  #define g_get_monotonic_time() qemu_g_get_monotonic_time()
>  #endif
>
> -#ifdef _WIN32
> +#if defined(_WIN32) && !GLIB_CHECK_VERSION(2, 50, 0)
>  /*
>   * g_poll has a problem on Windows when using
>   * timeouts < 10ms, so use wrapper.
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index d09863cc9d..0b1890fd33 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -327,6 +327,7 @@ char *qemu_get_exec_dir(void)
>      return g_strdup(exec_dir);
>  }
>
> +#if !GLIB_CHECK_VERSION(2, 50, 0)
>  /*
>   * The original implementation of g_poll from glib has a problem on Wi=
ndows
>   * when using timeouts < 10 ms.
> @@ -530,6 +531,7 @@ gint g_poll(GPollFD *fds, guint nfds, gint timeout)
>
>      return retval;
>  }
> +#endif
>
>  int getpagesize(void)
>  {
>

Thanks for this patch.
I think it can be applied via qemu-trivial (cc'ed).

Reviewed-by: Stefan Weil <sw@weilnetz.de>


