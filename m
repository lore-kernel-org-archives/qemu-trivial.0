Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpDkx-000181-Ms
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 04:28:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDku-000131-LO
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:28:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UpDks-0005at-RC
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:28:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UpDko-0005ZE-N2; Wed, 19 Jun 2013 04:28:35 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 189D141974;
	Wed, 19 Jun 2013 12:28:33 +0400 (MSK)
Message-ID: <51C16BB0.7070206@msgid.tls.msk.ru>
Date: Wed, 19 Jun 2013 12:28:32 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1371527137-16949-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1371527137-16949-3-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1371527137-16949-3-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 3/5] qemu-char: use bool in
	qemu_chr_open_socket
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
X-List-Received-Date: Wed, 19 Jun 2013 08:28:42 -0000

18.06.2013 07:45, liguang wrote:
> local variables is_* should be bool by usage,
> and last parameter of qemu_opt_get_bool is bool,
> so pass true/false for it.
> 
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  qemu-char.c |   20 ++++++++++----------
>  1 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/qemu-char.c b/qemu-char.c
> index 2c3cfe6..0d695e0 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -2679,16 +2679,16 @@ static CharDriverState *qemu_chr_open_socket(QemuOpts *opts)
>      CharDriverState *chr = NULL;
>      Error *local_err = NULL;
>      int fd = -1;
> -    int is_listen;
> -    int is_waitconnect;
> -    int do_nodelay;
> -    int is_unix;
> -    int is_telnet;
> -
> -    is_listen      = qemu_opt_get_bool(opts, "server", 0);
> -    is_waitconnect = qemu_opt_get_bool(opts, "wait", 1);
> -    is_telnet      = qemu_opt_get_bool(opts, "telnet", 0);
> -    do_nodelay     = !qemu_opt_get_bool(opts, "delay", 1);
> +    bool is_listen;
> +    bool is_waitconnect;
> +    bool do_nodelay;
> +    bool is_unix;
> +    bool is_telnet;
> +
> +    is_listen      = qemu_opt_get_bool(opts, "server", false);
> +    is_waitconnect = qemu_opt_get_bool(opts, "wait", true);
> +    is_telnet      = qemu_opt_get_bool(opts, "telnet", false);
> +    do_nodelay     = !qemu_opt_get_bool(opts, "delay", true);
>      is_unix        = qemu_opt_get(opts, "path") != NULL;
>      if (!is_listen)
>          is_waitconnect = 0;

So is is_waitconnect a booleand or integer? :)

How about this (I'm unsure about the author anymore ):

commit c5b775f85f5049d7315b8f8643a65ea1cc7107eb
Author: liguang <lig.fnst@cn.fujitsu.com>
Date:   Tue Jun 18 11:45:35 2013 +0800

    qemu-char: use bool in qemu_chr_open_socket and simplify code a bit

    Local variables is_* should be bool by usage.
    While at it, simplify the logic/code a bit.

    Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
    Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/qemu-char.c b/qemu-char.c
index 2c3cfe6..a030e6b 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2679,19 +2679,12 @@ static CharDriverState *qemu_chr_open_socket(QemuOpts *opts)
     CharDriverState *chr = NULL;
     Error *local_err = NULL;
     int fd = -1;
-    int is_listen;
-    int is_waitconnect;
-    int do_nodelay;
-    int is_unix;
-    int is_telnet;
-
-    is_listen      = qemu_opt_get_bool(opts, "server", 0);
-    is_waitconnect = qemu_opt_get_bool(opts, "wait", 1);
-    is_telnet      = qemu_opt_get_bool(opts, "telnet", 0);
-    do_nodelay     = !qemu_opt_get_bool(opts, "delay", 1);
-    is_unix        = qemu_opt_get(opts, "path") != NULL;
-    if (!is_listen)
-        is_waitconnect = 0;
+
+    bool is_listen      = qemu_opt_get_bool(opts, "server", false);
+    bool is_waitconnect = is_listen && qemu_opt_get_bool(opts, "wait", true);
+    bool is_telnet      = qemu_opt_get_bool(opts, "telnet", false);
+    bool do_nodelay     = !qemu_opt_get_bool(opts, "delay", true);
+    bool is_unix        = qemu_opt_get(opts, "path") != NULL;

     if (is_unix) {
         if (is_listen) {


