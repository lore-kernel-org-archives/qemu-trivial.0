Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmjFM-0006JH-Mn
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 09:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YmjFJ-0006Fk-OZ
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 09:38:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YmjFE-0005ps-Lq
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 09:38:49 -0400
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a]:35544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YmjFE-0005pZ-ET; Mon, 27 Apr 2015 09:38:44 -0400
Received: by wgyo15 with SMTP id o15so116226736wgy.2;
	Mon, 27 Apr 2015 06:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=qGXTh/wmf1EoDkIrcWblQdNr1CL3/OiCBW835XLYTlI=;
	b=CTZQuHC2dpncHQ0QA0mAbHtYqmAxqmcZ0TEgHzYf5cQCz2stQ1P4BO02vxru5m9s3i
	FXGXaGbOTMj30yGSieqTabYQKzlNWELaXCHEh7AP2KryoGwChf/mYQ6PSHQut/LQW9rF
	BrSItm6mYjpnL37ioGHfuwjxZkVlFLEP/HVJb4I/USAMllIv12EXF0vi2HaS4DE6YAB2
	1PJ2RKwNbaqh6klJy8kZUI339OofSh9VqlDpRAykxGRKTizZTpKrlltv3+mQahkIbwjj
	+fmiMeBnj0Kj5zma0jE5nLoZJkEMD0HxliDBqCHDRYC3G5FvfaEygYibwGc18XYrq8Hn
	ppsQ==
X-Received: by 10.180.231.40 with SMTP id td8mr21186375wic.9.1430141922110;
	Mon, 27 Apr 2015 06:38:42 -0700 (PDT)
Received: from [192.168.10.165] (net-37-116-199-255.cust.vodafonedsl.it.
	[37.116.199.255]) by mx.google.com with ESMTPSA id
	pm1sm11194710wjb.23.2015.04.27.06.38.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 06:38:40 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <553E3BDE.2050605@redhat.com>
Date: Mon, 27 Apr 2015 15:38:38 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1430141433-20203-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1430141433-20203-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22a
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] libcacard: do not use full paths for
 include files in the same dir
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
X-List-Received-Date: Mon, 27 Apr 2015 13:38:50 -0000



On 27/04/2015 15:30, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  libcacard/vcard_emul_nss.c | 2 +-
>  libcacard/vcardt.c         | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
> index 6955f69..d9761ee 100644
> --- a/libcacard/vcard_emul_nss.c
> +++ b/libcacard/vcard_emul_nss.c
> @@ -33,7 +33,7 @@
>  #include "vreader.h"
>  #include "vevent.h"
>  
> -#include "libcacard/vcardt_internal.h"
> +#include "vcardt_internal.h"
>  
>  
>  typedef enum {
> diff --git a/libcacard/vcardt.c b/libcacard/vcardt.c
> index 9ce4648..c67de2f 100644
> --- a/libcacard/vcardt.c
> +++ b/libcacard/vcardt.c
> @@ -2,9 +2,9 @@
>  #include <string.h>
>  #include <glib.h>
>  
> -#include "libcacard/vcardt.h"
> +#include "vcardt.h"
>  
> -#include "libcacard/vcardt_internal.h"
> +#include "vcardt_internal.h"
>  
>  /* create an ATR with appropriate historical bytes */
>  #define ATR_TS_DIRECT_CONVENTION 0x3b
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

