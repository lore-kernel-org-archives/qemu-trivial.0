Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XknYm-0005le-Ff
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:18:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknYf-0005dK-Qc
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknYb-0002Pj-0o
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:18:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XknYR-0002PP-2Z; Sun, 02 Nov 2014 01:18:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E13B040231;
	Sun,  2 Nov 2014 08:18:17 +0300 (MSK)
Message-ID: <5455BE99.1000400@msgid.tls.msk.ru>
Date: Sun, 02 Nov 2014 08:18:17 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1414806603-22556-2-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1414806603-22556-2-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 1/4] qemu-char: fix parameter check for
 qemu_chr_open_pipe
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
X-List-Received-Date: Sun, 02 Nov 2014 05:18:38 -0000

01.11.2014 04:50, zhanghailiang wrote:
> The filename parameter never to be NULL, because in qemu_chr_parse_pipe
> it is return value of g_strdup(device), where device will not be
> NULL.
> 
> We should check its length.
> After this patch, when run command:
>  qemu-system-x86_64 -chardev pipe,id=pipe1,path=
> It will report error:
>  chardev: pipe: no filename given
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  qemu-char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-char.c b/qemu-char.c
> index bd0709b..42b1d8f 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -1084,7 +1084,7 @@ static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
>      char filename_out[CHR_MAX_FILENAME_SIZE];
>      const char *filename = opts->device;
>  
> -    if (filename == NULL) {
> +    if (filename == NULL || strlen(filename) == 0) {
>          fprintf(stderr, "chardev: pipe: no filename given\n");
>          return NULL;
>      }

and chr_parse_pipe() looks like:


static void qemu_chr_parse_pipe(QemuOpts *opts, ChardevBackend *backend,
                                Error **errp)
{
    const char *device = qemu_opt_get(opts, "path");

    if (device == NULL) {
        error_setg(errp, "chardev: pipe: no device path given");
        return;
    }

Maybe we should combine the two checks into one in chr_parse_pipe,
and remove the check in chr_open_pipe entirely?

Thanks,

/mjt

