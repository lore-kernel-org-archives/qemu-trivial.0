Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xle7P-0002Os-VB
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 08:25:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Xle7J-0002Hv-Sf
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:25:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Xle7F-00062c-JB
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:25:49 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:50001 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Xle76-00061O-FG; Tue, 04 Nov 2014 08:25:36 -0500
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Xledu-0006Jc-Fb; Tue, 04 Nov 2014 14:59:30 +0100
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1415098223-32404-2-git-send-email-zhang.zhanghailiang@huawei.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
In-reply-to: <1415098223-32404-2-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Tue, 04 Nov 2014 13:25:31 +0000
Message-ID: <874mufumgk.fsf@linaro.org>
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
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/5] qemu-char: fix
	parameter check in some qemu_chr_parse_* functions
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
X-List-Received-Date: Tue, 04 Nov 2014 13:25:54 -0000


zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> For some qemu_chr_parse_* functions, we just check whether the parameter
> is NULL or not, but do not check if it is empty.
>
> For example:
> qemu-system-x86_64 -chardev pipe,id=id,path=
> It will pass the check of NULL but will not find the error until
> trying to open it, while essentially missing and empty parameter
> is the same thing.
>
> So check the parameters for emptiness too, and avoid emptiness
> check at open time.
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  qemu-char.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/qemu-char.c b/qemu-char.c
> index bd0709b..a09bbf6 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -1084,11 +1084,6 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
>      char filename_out[CHR_MAX_FILENAME_SIZE];
>      const char *filename = opts->device;
>  
> -    if (filename == NULL) {
> -        fprintf(stderr, "chardev: pipe: no filename given\n");
> -        return NULL;
> -    }
> -

You seem to have dropped a check here, are you sure all avenues into
this code have validated filename? What if a new function gets added?

At a minimum I'd replace it with a g_assert(filename) to make the
calling contract clear.

>      snprintf(filename_in, CHR_MAX_FILENAME_SIZE, "%s.in", filename);
>      snprintf(filename_out, CHR_MAX_FILENAME_SIZE, "%s.out",
>      filename);

We'll probably end up with "(null).in" as the filename which may be
exploitation vector.

>      TFR(fd_in = qemu_open(filename_in, O_RDWR | O_BINARY));
> @@ -3419,7 +3414,7 @@ static void qemu_chr_parse_file_out(QemuOpts *opts, ChardevBackend *backend,
>  {
>      const char *path = qemu_opt_get(opts, "path");
>  
> -    if (path == NULL) {
> +    if (path == NULL || !path[0]) {
>          error_setg(errp, "chardev: file: no filename given");
>          return;
>      }
> @@ -3453,7 +3448,7 @@ static void qemu_chr_parse_parallel(QemuOpts *opts, ChardevBackend *backend,
>  {
>      const char *device = qemu_opt_get(opts, "path");
>  
> -    if (device == NULL) {
> +    if (device == NULL || !device[0]) {
>          error_setg(errp, "chardev: parallel: no device path given");
>          return;
>      }
> @@ -3466,7 +3461,7 @@ static void qemu_chr_parse_pipe(QemuOpts *opts, ChardevBackend *backend,
>  {
>      const char *device = qemu_opt_get(opts, "path");
>  
> -    if (device == NULL) {
> +    if (device == NULL || !device[0]) {
>          error_setg(errp, "chardev: pipe: no device path given");
>          return;
>      }
> @@ -3515,11 +3510,11 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
>      SocketAddress *addr;
>  
>      if (!path) {
> -        if (!host) {
> +        if (!host || !host[0]) {
>              error_setg(errp, "chardev: socket: no host given");
>              return;
>          }
> -        if (!port) {
> +        if (!port || !port[0]) {
>              error_setg(errp, "chardev: socket: no port given");
>              return;
>          }

All this boilerplate checking makes me think that either the qemu_opt
machinery should be ensuring we get a valid option string?

-- 
Alex Bennée

