Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VhcyM-0000a3-FK
	for mharc-qemu-trivial@gnu.org; Sat, 16 Nov 2013 05:19:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VhcyI-0000Tb-0B
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 05:19:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VhcyD-0003kK-Rt
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 05:19:21 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=47371
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Vhcy5-0003UQ-6b; Sat, 16 Nov 2013 05:19:09 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	69B70728019E; Sat, 16 Nov 2013 11:19:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id QLNgoSJhrPAz; Sat, 16 Nov 2013 11:19:05 +0100 (CET)
Received: from [192.168.178.35] (p54AD85D3.dip0.t-ipconnect.de
	[84.173.133.211])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	648197280100; Sat, 16 Nov 2013 11:19:05 +0100 (CET)
Message-ID: <52874698.7080000@weilnetz.de>
Date: Sat, 16 Nov 2013 11:19:04 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
References: <1384596884-29358-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1384596884-29358-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: Luigi Rizzo <rizzo@iet.unipi.it>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw/i386/Makefile.obj: use $(PYTHON) to
 run .py scripts consistently
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
X-List-Received-Date: Sat, 16 Nov 2013 10:19:26 -0000

Am 16.11.2013 11:14, schrieb Michael Tokarev:
> $(PYTHON) is a Make variable which is set by configure.
> In all other places over the tree, .py files are run from
> Makefiles using this variable, except of a single leftover
> in hw/i386/Makefile.obj (and a nearby place in there uses
> $(PYTHON) correctly).  Fix this leftover too.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Cc: Luigi Rizzo <rizzo@iet.unipi.it>
> Cc: Stefan Weil <sw@weilnetz.de>
>
> --
> mjt: I want to apply this to trivial-patches for-1.7
> ---
>  hw/i386/Makefile.objs |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
> index 185aacb..09ac433 100644
> --- a/hw/i386/Makefile.objs
> +++ b/hw/i386/Makefile.objs
> @@ -20,7 +20,7 @@ hw/i386/%.hex: $(SRC_PATH)/hw/i386/%.dsl $(SRC_PATH)/scripts/acpi_extract_prepro
>  	$(call quiet-command, cpp -P $< -o $*.dsl.i.orig, "  CPP $(TARGET_DIR)$*.dsl.i.orig")
>  	$(call quiet-command, $(PYTHON) $(SRC_PATH)/scripts/acpi_extract_preprocess.py $*.dsl.i.orig > $*.dsl.i, "  ACPI_PREPROCESS $(TARGET_DIR)$*.dsl.i")
>  	$(call quiet-command, $(IASL) $(call iasl-option,$(IASL),-Pn,) -vs -l -tc -p $* $*.dsl.i $(if $(V), , > /dev/null) 2>&1 ,"  IASL $(TARGET_DIR)$*.dsl.i")
> -	$(call quiet-command, $(SRC_PATH)/scripts/acpi_extract.py $*.lst > $*.off, "  ACPI_EXTRACT $(TARGET_DIR)$*.off")
> +	$(call quiet-command, $(PYTHON) $(SRC_PATH)/scripts/acpi_extract.py $*.lst > $*.off, "  ACPI_EXTRACT $(TARGET_DIR)$*.off")
>  	$(call quiet-command, cat $*.off > $@, "  CAT $(TARGET_DIR)$@")
>  else
>  #IASL Not present. Restore pre-generated hex files.


Reviewed-by: Stefan Weil <sw@weilnetz.de>

Yes, this is a bug fix which should be included in QEMU 1.7.

Regards,
Stefan


