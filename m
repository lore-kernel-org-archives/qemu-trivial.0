Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xkozj-0005Cq-Kp
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:50:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xkozd-00055y-Rs
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:50:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkozZ-000291-1n
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:50:29 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XkozO-000255-RT; Sun, 02 Nov 2014 01:50:15 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id F2B0440231;
	Sun,  2 Nov 2014 09:50:11 +0300 (MSK)
Message-ID: <5455D423.2000008@msgid.tls.msk.ru>
Date: Sun, 02 Nov 2014 09:50:11 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1414806603-22556-3-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1414806603-22556-3-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 2/4] spice-qemu-char: fix check for
	in-parameter
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
X-List-Received-Date: Sun, 02 Nov 2014 06:50:34 -0000

01.11.2014 04:50, zhanghailiang wrote:
> For qemu_chr_open_spice_vmc and qemu_chr_open_spice_port, the in-parameter
> never to be NULL, because the checks in qemu_chr_parse_spice_vmc
> and qemu_chr_parse_spice_port have ensured this.
> 
> So we should check the length of the in-parameter.

The same applies here as to qemu_chr_open in patch 1/4.
But here we've one more thing:

> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  spice-qemu-char.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/spice-qemu-char.c b/spice-qemu-char.c
> index 8106e06..45e7d69 100644
> --- a/spice-qemu-char.c
> +++ b/spice-qemu-char.c
> @@ -290,7 +290,7 @@ CharDriverState *qemu_chr_open_spice_vmc(const char *type)
>  {
>      const char **psubtype = spice_server_char_device_recognized_subtypes();
>  
> -    if (type == NULL) {
> +    if (type == NULL || strlen(type) == 0) {
>          fprintf(stderr, "spice-qemu-char: missing name parameter\n");

This is 'missing TYPE parameter' not name.  If we merge the check with
qemu_chr_parse_* it will go away.

Thanks,

/mjt

>          print_allowed_subtypes();
>          return NULL;
> @@ -315,7 +315,7 @@ CharDriverState *qemu_chr_open_spice_port(const char *name)
>      CharDriverState *chr;
>      SpiceCharDriver *s;
>  
> -    if (name == NULL) {
> +    if (name == NULL || strlen(name) == 0) {
>          fprintf(stderr, "spice-qemu-char: missing name parameter\n");
>          return NULL;
>      }
> 


