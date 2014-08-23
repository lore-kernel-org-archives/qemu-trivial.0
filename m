Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XL5j5-0004cr-Nx
	for mharc-qemu-trivial@gnu.org; Sat, 23 Aug 2014 03:27:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XL5iy-0004SQ-6l
	for qemu-trivial@nongnu.org; Sat, 23 Aug 2014 03:27:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XL5is-0003TO-3p
	for qemu-trivial@nongnu.org; Sat, 23 Aug 2014 03:26:56 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:57238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1XL5if-0003SI-Cr; Sat, 23 Aug 2014 03:26:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 80D21102EE4;
	Sat, 23 Aug 2014 09:26:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id l2WCdD1Ljvc4; Sat, 23 Aug 2014 09:26:35 +0200 (CEST)
Received: from [192.168.178.35] (p54AC88CD.dip0.t-ipconnect.de
	[84.172.136.205])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 2911E102250;
	Sat, 23 Aug 2014 09:26:35 +0200 (CEST)
Message-ID: <53F84229.3020404@weilnetz.de>
Date: Sat, 23 Aug 2014 09:26:33 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1405695149-27462-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1405695149-27462-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.80
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 for-2.1] po: Fix Makefile
 rules for in-tree builds without configuration
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
X-List-Received-Date: Sat, 23 Aug 2014 07:27:02 -0000

Am 18.07.2014 um 16:52 schrieb Stefan Weil:
> Adding 'update' to the phony targets fixes this error:
> 
> $ LANG=C make -C po update
> make: Entering directory `/qemu/po'
>   LINK  update
> /qemu/po/de_DE.po: file not recognized: File format not recognized
> collect2: error: ld returned 1 exit status
> make: *** [update] Error 1
> make: Leaving directory `/qemu/po'
> 
> Some other phony targets (build, install) were also added, and the
> existing .PHONY statement was moved to a more prominent position at
> the beginning of the Makefile.
> 
> The patch also fixes a 2nd bug. The default target should be 'all',
> but instead 'modules' (from rules.mak) was the default. Fix this by
> adding 'all' as a target before any include statement.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> v2: Update the subject line because the patch is only needed for
>     in-tree builds without configuration).
>     Rebase patch (v1 was based on a locally modified tree).
> 
>  po/Makefile |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/po/Makefile b/po/Makefile
> index 669f865..1ab241a 100644
> --- a/po/Makefile
> +++ b/po/Makefile
> @@ -4,6 +4,11 @@
>  # Set SRC_PATH for in-tree builds without configuration.
>  SRC_PATH=..
>  
> +# The default target must come before any include statements.
> +all:
> +
> +.PHONY:	all build clean install update
> +
>  -include ../config-host.mak
>  include $(SRC_PATH)/rules.mak
>  
> @@ -45,5 +50,3 @@ $(PO_PATH)/messages.po: $(SRC_PATH)/ui/gtk.c
>  
>  $(PO_PATH)/%.po: $(PO_PATH)/messages.po
>  	$(call quiet-command, msgmerge -q $@ $< > $@.bak && mv $@.bak $@, "  GEN   $@")
> -
> -.PHONY: clean all
> 


Ping. Please consider this patch for the trivial qeueue.

Thanks,
Stefan


