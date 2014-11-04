Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XleCo-0005aV-Lm
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 08:31:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XleCi-0005U1-Bs
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:31:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XleCd-0007hq-St
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:31:24 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:50037 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XleCS-0007fg-Vl; Tue, 04 Nov 2014 08:31:09 -0500
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XlejI-0006M2-TV; Tue, 04 Nov 2014 15:05:05 +0100
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1415098223-32404-4-git-send-email-zhang.zhanghailiang@huawei.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
In-reply-to: <1415098223-32404-4-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Tue, 04 Nov 2014 13:31:06 +0000
Message-ID: <871tpjum79.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, armbru@redhat.com, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 3/5] qemu-char: fix
	incorrect state in error message
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
X-List-Received-Date: Tue, 04 Nov 2014 13:31:28 -0000


zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> It is either "Failed _to_ do something", or "something failed",
> but not "failed something".
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>

Semantically I'm fine to add:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

I'll leave it to the language pedants to rule on the grammar ;-)

> ---
>  qemu-char.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/qemu-char.c b/qemu-char.c
> index a09bbf6..0f38cdd 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -1872,25 +1872,25 @@ static int win_chr_init(CharDriverState *chr, const char *filename)
>  
>      s->hsend = CreateEvent(NULL, TRUE, FALSE, NULL);
>      if (!s->hsend) {
> -        fprintf(stderr, "Failed CreateEvent\n");
> +        fprintf(stderr, "CreateEvent failed\n");
>          goto fail;
>      }
>      s->hrecv = CreateEvent(NULL, TRUE, FALSE, NULL);
>      if (!s->hrecv) {
> -        fprintf(stderr, "Failed CreateEvent\n");
> +        fprintf(stderr, "CreateEvent failed\n");
>          goto fail;
>      }
>  
>      s->hcom = CreateFile(filename, GENERIC_READ|GENERIC_WRITE, 0, NULL,
>                        OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);
>      if (s->hcom == INVALID_HANDLE_VALUE) {
> -        fprintf(stderr, "Failed CreateFile (%lu)\n", GetLastError());
> +        fprintf(stderr, "CreateFile (%lu) failed\n", GetLastError());
>          s->hcom = NULL;
>          goto fail;
>      }
>  
>      if (!SetupComm(s->hcom, NRECVBUF, NSENDBUF)) {
> -        fprintf(stderr, "Failed SetupComm\n");
> +        fprintf(stderr, "SetupComm failed\n");
>          goto fail;
>      }
>  
> @@ -1901,23 +1901,23 @@ static int win_chr_init(CharDriverState *chr, const char *filename)
>      CommConfigDialog(filename, NULL, &comcfg);
>  
>      if (!SetCommState(s->hcom, &comcfg.dcb)) {
> -        fprintf(stderr, "Failed SetCommState\n");
> +        fprintf(stderr, "SetCommState failed\n");
>          goto fail;
>      }
>  
>      if (!SetCommMask(s->hcom, EV_ERR)) {
> -        fprintf(stderr, "Failed SetCommMask\n");
> +        fprintf(stderr, "SetCommMask failed\n");
>          goto fail;
>      }
>  
>      cto.ReadIntervalTimeout = MAXDWORD;
>      if (!SetCommTimeouts(s->hcom, &cto)) {
> -        fprintf(stderr, "Failed SetCommTimeouts\n");
> +        fprintf(stderr, "SetCommTimeouts failed\n");
>          goto fail;
>      }
>  
>      if (!ClearCommError(s->hcom, &err, &comstat)) {
> -        fprintf(stderr, "Failed ClearCommError\n");
> +        fprintf(stderr, "ClearCommError failed\n");
>          goto fail;
>      }
>      qemu_add_polling_cb(win_chr_poll, chr);
> @@ -2069,12 +2069,12 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
>  
>      s->hsend = CreateEvent(NULL, TRUE, FALSE, NULL);
>      if (!s->hsend) {
> -        fprintf(stderr, "Failed CreateEvent\n");
> +        fprintf(stderr, "CreateEvent failed\n");
>          goto fail;
>      }
>      s->hrecv = CreateEvent(NULL, TRUE, FALSE, NULL);
>      if (!s->hrecv) {
> -        fprintf(stderr, "Failed CreateEvent\n");
> +        fprintf(stderr, "CreateEvent failed\n");
>          goto fail;
>      }
>  
> @@ -2084,7 +2084,7 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
>                                PIPE_WAIT,
>                                MAXCONNECT, NSENDBUF, NRECVBUF, NTIMEOUT, NULL);
>      if (s->hcom == INVALID_HANDLE_VALUE) {
> -        fprintf(stderr, "Failed CreateNamedPipe (%lu)\n", GetLastError());
> +        fprintf(stderr, "CreateNamedPipe (%lu) failed\n", GetLastError());
>          s->hcom = NULL;
>          goto fail;
>      }
> @@ -2093,13 +2093,13 @@ static int win_chr_pipe_init(CharDriverState *chr, const char *filename)
>      ov.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
>      ret = ConnectNamedPipe(s->hcom, &ov);
>      if (ret) {
> -        fprintf(stderr, "Failed ConnectNamedPipe\n");
> +        fprintf(stderr, "ConnectNamedPipe failed\n");
>          goto fail;
>      }
>  
>      ret = GetOverlappedResult(s->hcom, &ov, &size, TRUE);
>      if (!ret) {
> -        fprintf(stderr, "Failed GetOverlappedResult\n");
> +        fprintf(stderr, "GetOverlappedResult failed\n");
>          if (ov.hEvent) {
>              CloseHandle(ov.hEvent);
>              ov.hEvent = NULL;

-- 
Alex Bennée

