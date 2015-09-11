Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaIYH-0005ZH-Hc
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 03:15:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaIYF-0005Uf-6L
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:15:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaIYE-0003v0-Cb
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:15:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaIY8-0003sE-Ny; Fri, 11 Sep 2015 03:15:08 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1A6F6413F3;
	Fri, 11 Sep 2015 10:15:07 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 09271A52;
	Fri, 11 Sep 2015 10:15:07 +0300 (MSK)
Message-ID: <55F27F7B.7080104@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 10:15:07 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Jerome Forissier <jerome.forissier@linaro.org>, 
 qemu-trivial@nongnu.org
References: <1441185266-25643-1-git-send-email-jerome.forissier@linaro.org>
In-Reply-To: <1441185266-25643-1-git-send-email-jerome.forissier@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Makefile: suppress command echoing in
 silent mode (make -s)
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
X-List-Received-Date: Fri, 11 Sep 2015 07:15:16 -0000

02.09.2015 12:14, Jerome Forissier wrote:
> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>

Please Cc qemu-devel on patches.

>  rules.mak | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/rules.mak b/rules.mak
> index 4551b9e..a44ba29 100644
> --- a/rules.mak
> +++ b/rules.mak
> @@ -125,7 +125,18 @@ modules:
>  %.a:
>  	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR    $(TARGET_DIR)$@")
>  
> -quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))
> +# Suppress command echoing in silent mode (make -s)
> +ifneq ($(filter 4.%,$(MAKE_VERSION)),)  # make-4
> +ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
> +SILENT := 1
> +endif
> +else                                    # make-3.8x
> +ifneq ($(findstring s, $(MAKEFLAGS)),)
> +SILENT := 1
> +endif
> +endif
> +
> +quiet-command = $(if $(V),$1,$(if $(2),$(if $(SILENT),@$1,@echo $2 && $1),@$1))

I'm not sure this is needed.  We have V=1/V=0 way of controlling silent mode
already, why add another way, which is also twisted (depends on make version
and complicates already complex makefiles)?

Thanks,

/mjt

