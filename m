Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xle8u-0003Qj-HJ
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 08:27:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Xle8o-0003Kh-SM
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:27:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Xle8i-0006io-Tb
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:27:22 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:50009 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Xle8Y-0006ZM-LB; Tue, 04 Nov 2014 08:27:06 -0500
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XlefR-0006KG-Bn; Tue, 04 Nov 2014 15:01:05 +0100
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1415098223-32404-3-git-send-email-zhang.zhanghailiang@huawei.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
In-reply-to: <1415098223-32404-3-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Tue, 04 Nov 2014 13:27:06 +0000
Message-ID: <87389zumdx.fsf@linaro.org>
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
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 2/5] spice-qemu-char: fix
	parameter checks in qemu_chr_parse_* functions
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
X-List-Received-Date: Tue, 04 Nov 2014 13:27:28 -0000


zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> For functions qemu_chr_parse_spice_vmc and qemu_chr_parse_spice_port,
> we should also check if parameter name is empty, and it will help finding
> the wrong configure, such as
> 'qemu-system-x86_64 -chardev spiceport(or spiceport),id=id,name='
>
> After check the parameter in parse function, we can remove the
> superfluous parameter checks in qemu_chr_open_spice_*
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  spice-qemu-char.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/spice-qemu-char.c b/spice-qemu-char.c
> index 8106e06..d3c1f5c 100644
> --- a/spice-qemu-char.c
> +++ b/spice-qemu-char.c
> @@ -290,11 +290,6 @@ CharDriverState *qemu_chr_open_spice_vmc(const char *type)
>  {
>      const char **psubtype = spice_server_char_device_recognized_subtypes();
>  
> -    if (type == NULL) {
> -        fprintf(stderr, "spice-qemu-char: missing name parameter\n");
> -        print_allowed_subtypes();
> -        return NULL;
> -    }

As with patch 1 I'd at least assert the contract. But this also drops a
helpful info dump on a missing parameter.

>      for (; *psubtype != NULL; ++psubtype) {
>          if (strcmp(type, *psubtype) == 0) {
>              break;
> @@ -315,11 +310,6 @@ CharDriverState *qemu_chr_open_spice_port(const char *name)
>      CharDriverState *chr;
>      SpiceCharDriver *s;
>  
> -    if (name == NULL) {
> -        fprintf(stderr, "spice-qemu-char: missing name parameter\n");
> -        return NULL;
> -    }
> -
>      chr = chr_open("port", spice_port_set_fe_open);
>      s = chr->opaque;
>      s->sin.portname = g_strdup(name);
> @@ -345,7 +335,7 @@ static void qemu_chr_parse_spice_vmc(QemuOpts *opts, ChardevBackend *backend,
>  {
>      const char *name = qemu_opt_get(opts, "name");
>  
> -    if (name == NULL) {
> +    if (name == NULL || !name[0]) {
>          error_setg(errp, "chardev: spice channel: no name given");
>          return;
>      }
> @@ -358,7 +348,7 @@ static void qemu_chr_parse_spice_port(QemuOpts *opts, ChardevBackend *backend,
>  {
>      const char *name = qemu_opt_get(opts, "name");
>  
> -    if (name == NULL) {
> +    if (name == NULL || !name[0]) {
>          error_setg(errp, "chardev: spice port: no name given");
>          return;
>      }

Same comments as for 1/5

-- 
Alex Bennée

