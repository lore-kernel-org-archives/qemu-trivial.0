Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7gSQ-00059W-Vc
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 04:54:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Z7gSO-00058P-9U
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 04:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Z7gSK-0006MG-LH
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 04:54:56 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:33141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Z7gSK-0006LT-Eq; Wed, 24 Jun 2015 04:54:52 -0400
Received: by wiwl6 with SMTP id l6so88725187wiw.0;
	Wed, 24 Jun 2015 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Pvxr/eItLTEl82NyPNG5gBIX9mOkBFogpaAUjPkEVW0=;
	b=qcso4b467suOgP7CCVMwVktPRmlTkN4nO3f5h//lL9p7MQ/BLJt2JJMNdJaJZVuiJ5
	h6ucQIWl1Om6ga1BNBo9A4wF69ABP20gu2brTZSbFq6XY9ygURtnPMfPMPfoy7plsAfw
	VAuJ/OopW5trL7tUHvzRu6d2ecHwZlbnkUTHSHapU/pmFIiFy3SUz7dRqIBocw0XPqMW
	syqtjvq/w01chNxMM332LPKdsyOYiduaI41sQgI9xGr7vJ9O2137K+Phj4QyRgVgkcJH
	AkSiWwge/XMciLQsaolGpk6noPmU9dGQ0wfg6XeQcYIpCHpaCSjU4hCrzSGBHZHMtJew
	oUZQ==
X-Received: by 10.180.86.129 with SMTP id p1mr2845742wiz.71.1435136090915;
	Wed, 24 Jun 2015 01:54:50 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-132-37.clienti.tiscali.it.
	[94.39.132.37])
	by mx.google.com with ESMTPSA id ee1sm1441616wic.8.2015.06.24.01.54.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 01:54:50 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <558A7059.9080001@redhat.com>
Date: Wed, 24 Jun 2015 10:54:49 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
 qemu-devel@nongnu.org
References: <1433714349-7262-1-git-send-email-crosthwaite.peter@gmail.com>
In-Reply-To: <1433714349-7262-1-git-send-email-crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH v2] memory_mapping: Rework cpu related
	includes
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
X-List-Received-Date: Wed, 24 Jun 2015 08:54:57 -0000



On 07/06/2015 23:59, Peter Crosthwaite wrote:
> This makes it more consistent with all other core code files, which
> either just rely on qemu-common.h inclusion or precede cpu.h with
> qemu-common.h.
> 
> cpu-all.h should not be included in addition to cpu.h. Remove it.
> 
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Applied, will send a pull request today or tomorrow.

Paolo

> ---
> changed since v1:
> Leave in cpu.h include
> 
> Picked up by my multi arch WIP where target-multi/cpu.h cant handle
> random core code inclusion without preceeded qemu-common.h. I guess
> this is the only one in tree?
> ---
>  memory_mapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memory_mapping.c b/memory_mapping.c
> index 7b69801..36d6b26 100644
> --- a/memory_mapping.c
> +++ b/memory_mapping.c
> @@ -13,8 +13,8 @@
>  
>  #include <glib.h>
>  
> +#include "qemu-common.h"
>  #include "cpu.h"
> -#include "exec/cpu-all.h"
>  #include "sysemu/memory_mapping.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
> 

