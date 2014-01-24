Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6a1m-0001h5-HI
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jan 2014 01:14:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1W6a1e-0001WF-B4
	for qemu-trivial@nongnu.org; Fri, 24 Jan 2014 01:14:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1W6a1Y-0000uU-96
	for qemu-trivial@nongnu.org; Fri, 24 Jan 2014 01:13:58 -0500
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:33015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1W6a1M-0000sH-2k; Fri, 24 Jan 2014 01:13:40 -0500
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 8B65B1024C0;
	Fri, 24 Jan 2014 07:13:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9AhECjfT2OrL; Fri, 24 Jan 2014 07:13:37 +0100 (CET)
Received: from [192.168.178.35] (p54AD8374.dip0.t-ipconnect.de
	[84.173.131.116])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 371711024B6;
	Fri, 24 Jan 2014 07:13:34 +0100 (CET)
Message-ID: <52E2048C.3000401@weilnetz.de>
Date: Fri, 24 Jan 2014 07:13:32 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Stewart Smith <stewart@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>	<1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
	<1390527551-22069-2-git-send-email-stewart@linux.vnet.ibm.com>
In-Reply-To: <1390527551-22069-2-git-send-email-stewart@linux.vnet.ibm.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 134.155.96.80
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/6] configure: add hint
 of libfdt to DTC dependency not found message
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
X-List-Received-Date: Fri, 24 Jan 2014 06:14:04 -0000

Am 24.01.2014 02:39, schrieb Stewart Smith:
> Most distros package it as libfdt, and mentioning libfdt here makes it
> much easier to find the package you're missing.
> 
> Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 3782a6a..8b6e64a 100755
> --- a/configure
> +++ b/configure
> @@ -2654,8 +2654,8 @@ EOF
>      fdt_libs="-L\$(BUILD_DIR)/dtc/libfdt $fdt_libs"
>    elif test "$fdt" = "yes" ; then
>      # have neither and want - prompt for system/submodule install
> -    error_exit "DTC not present. Your options:" \
> -        "  (1) Preferred: Install the DTC devel package" \
> +    error_exit "DTC (libfdt) not present. Your options:" \
> +        "  (1) Preferred: Install the DTC (libfdt) devel package" \
>          "  (2) Fetch the DTC submodule, using:" \
>          "      git submodule update --init dtc"
>    else
> 


Reviewed-by: Stefan Weil <sw@weilnetz.de>


