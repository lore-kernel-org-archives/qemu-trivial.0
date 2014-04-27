Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeLWo-0004id-69
	for mharc-qemu-trivial@gnu.org; Sun, 27 Apr 2014 05:37:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeLWi-0004YS-7C
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 05:37:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeLWd-0002FG-U9
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 05:37:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WeLWM-00028X-Or; Sun, 27 Apr 2014 05:37:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EE6B842F06;
	Sun, 27 Apr 2014 13:37:11 +0400 (MSK)
Message-ID: <535CCFC7.1040605@msgid.tls.msk.ru>
Date: Sun, 27 Apr 2014 13:37:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1397822131-24372-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1397822131-24372-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] po/Makefile: Fix source path for in-tree
 builds
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
X-List-Received-Date: Sun, 27 Apr 2014 09:37:40 -0000

18.04.2014 15:55, Stefan Weil wrote:
> Use an absolute value for SRC_PATH. This fixes a build problem:
> 
> $ LANG=C make -C po update
> make: Entering directory `/qemu/po'
>   GEN   ../po/messages.po
> /bin/sh: 1: cannot create ../po/messages.po: Directory nonexistent
> make: *** [../po/messages.po] Error 2
> make: Leaving directory `/qemu/po'
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  po/Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/po/Makefile b/po/Makefile
> index 705166e..576b172 100644
> --- a/po/Makefile
> +++ b/po/Makefile
> @@ -2,7 +2,7 @@
>  # process and also within the source tree to update the translation files.
>  
>  # Set SRC_PATH for in-tree builds without configuration.
> -SRC_PATH=..
> +SRC_PATH=$(shell cd .. && pwd)
>  
>  -include ../config-host.mak
>  include $(SRC_PATH)/rules.mak

How about moving it below inclusion of config-host.mak and using something like

 SRC_PATH ?= $(realpath ..)

?  I dunno how gnu'ish this construct is... :)


However, I think I've a better fix for this:

Author: Michael Tokarev <mjt@tls.msk.ru>
Date:   Sun Apr 27 13:32:07 2014 +0400

    po/Makefile: fix $SRC_PATH reference

    The rule for messages.po appears to be slightly wrong.
    Move the `cd' command within parens.

    Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
    Cc: Stefan Weil <sw@weilnetz.de>
    Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/po/Makefile b/po/Makefile
index 705166e..669f865 100644
--- a/po/Makefile
+++ b/po/Makefile
@@ -37,8 +37,8 @@ install: $(OBJS)
        $(call quiet-command, msgfmt -o $@ $<, "  GEN   $@")

 $(PO_PATH)/messages.po: $(SRC_PATH)/ui/gtk.c
-       $(call quiet-command, cd $(SRC_PATH) && \
-        (xgettext -o - --from-code=UTF-8 --foreign-user \
+       $(call quiet-command, ( cd $(SRC_PATH) && \
+          xgettext -o - --from-code=UTF-8 --foreign-user \
            --package-name=QEMU --package-version=$(VERSION) \
            --msgid-bugs-address=qemu-devel@nongnu.org -k_ -C ui/gtk.c | \
          sed -e s/CHARSET/UTF-8/) >$@, "  GEN   $@")


Note the already existing parens () -- it looks like this is in order to
run commands within a subshell (with its own current directory) but still
have correct output redirection.

If you don't have objections, I'll apply my version (it also fixes the issue).

Thanks,

/mjt

Thanks,

/mjt

