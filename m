Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ViWQy-0002pe-7H
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2013 16:32:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ViWQq-0002fh-K7
	for qemu-trivial@nongnu.org; Mon, 18 Nov 2013 16:32:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ViWQk-0007ff-FJ
	for qemu-trivial@nongnu.org; Mon, 18 Nov 2013 16:32:32 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:53408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ViWQX-0007cz-V9; Mon, 18 Nov 2013 16:32:14 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	56613728008B; Mon, 18 Nov 2013 22:32:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id tZGiz-K8lxyv; Mon, 18 Nov 2013 22:32:01 +0100 (CET)
Received: from [192.168.178.35] (p54AD8E0D.dip0.t-ipconnect.de [84.173.142.13])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	04F2B728008A; Mon, 18 Nov 2013 22:32:00 +0100 (CET)
Message-ID: <528A8750.7000303@weilnetz.de>
Date: Mon, 18 Nov 2013 22:32:00 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Anthony Liguori <aliguori@amazon.com>
References: <1384712392-10458-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384712392-10458-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH for 1.7 v2] qga: Fix compiler warnings
 (missing format attribute, wrong format strings)
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
X-List-Received-Date: Mon, 18 Nov 2013 21:32:38 -0000

Please note that this patch fixes real bugs, namely wrong format strings.

As far as I could see those bugs are only in code branches which handle
rare error conditions, so maybe they only have a low priority.
Nevertheless they can be fixed in QEMU 1.7.

Do we need a pull request, or can it be applied directly?

Stefan


Am 17.11.2013 19:19, schrieb Stefan Weil:
> gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextra=
):
>
>   CC    qga/commands.o
> qga/commands.c: In function =E2=80=98slog=E2=80=99:
> qga/commands.c:28:5: error:
>  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 =
format attribute [-Werror=3Dsuggest-attribute=3Dformat]
>      g_logv("syslog", G_LOG_LEVEL_INFO, fmt, ap);
>      ^
>
> gcc 4.8.2 reports this warning when slog is declared with the
> gnu_printf format attribute:
>
> qga/commands-posix.c: In function =E2=80=98qmp_guest_file_open=E2=80=99=
:
> qga/commands-posix.c:404:5: warning:
>  format =E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=
=99, but argument 2 has type =E2=80=98int64_t=E2=80=99 [-Wformat=3D]
>      slog("guest-file-open, handle: %d", handle);
>      ^
>
> On 32 bit hosts there are three more warnings which are also fixed here=
.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> v2: Fix three more wrong format strings for 32 bit hosts.
>
>  qga/commands-posix.c   |    8 ++++----
>  qga/guest-agent-core.h |    2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 10682f5..8100bee 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -401,7 +401,7 @@ int64_t qmp_guest_file_open(const char *path, bool =
has_mode, const char *mode, E
>          return -1;
>      }
> =20
> -    slog("guest-file-open, handle: %d", handle);
> +    slog("guest-file-open, handle: %" PRId64, handle);
>      return handle;
>  }
> =20
> @@ -410,7 +410,7 @@ void qmp_guest_file_close(int64_t handle, Error **e=
rr)
>      GuestFileHandle *gfh =3D guest_file_handle_find(handle, err);
>      int ret;
> =20
> -    slog("guest-file-close called, handle: %ld", handle);
> +    slog("guest-file-close called, handle: %" PRId64, handle);
>      if (!gfh) {
>          return;
>      }
> @@ -451,7 +451,7 @@ struct GuestFileRead *qmp_guest_file_read(int64_t h=
andle, bool has_count,
>      read_count =3D fread(buf, 1, count, fh);
>      if (ferror(fh)) {
>          error_setg_errno(err, errno, "failed to read file");
> -        slog("guest-file-read failed, handle: %ld", handle);
> +        slog("guest-file-read failed, handle: %" PRId64, handle);
>      } else {
>          buf[read_count] =3D 0;
>          read_data =3D g_malloc0(sizeof(GuestFileRead));
> @@ -496,7 +496,7 @@ GuestFileWrite *qmp_guest_file_write(int64_t handle=
, const char *buf_b64,
>      write_count =3D fwrite(buf, 1, count, fh);
>      if (ferror(fh)) {
>          error_setg_errno(err, errno, "failed to write to file");
> -        slog("guest-file-write failed, handle: %ld", handle);
> +        slog("guest-file-write failed, handle: %" PRId64, handle);
>      } else {
>          write_data =3D g_malloc0(sizeof(GuestFileWrite));
>          write_data->count =3D write_count;
> diff --git a/qga/guest-agent-core.h b/qga/guest-agent-core.h
> index 624a559..e422208 100644
> --- a/qga/guest-agent-core.h
> +++ b/qga/guest-agent-core.h
> @@ -29,7 +29,7 @@ GACommandState *ga_command_state_new(void);
>  bool ga_logging_enabled(GAState *s);
>  void ga_disable_logging(GAState *s);
>  void ga_enable_logging(GAState *s);
> -void slog(const gchar *fmt, ...);
> +void GCC_FMT_ATTR(1, 2) slog(const gchar *fmt, ...);
>  void ga_set_response_delimited(GAState *s);
>  bool ga_is_frozen(GAState *s);
>  void ga_set_frozen(GAState *s);


