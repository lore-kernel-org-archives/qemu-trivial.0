Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNSiR-0006hJ-Cm
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 20:42:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNSiO-0006fN-8J
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 20:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNSiN-0007ED-Hl
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 20:42:16 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:42523)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNSiI-0007Aq-Hr; Mon, 28 May 2018 20:42:10 -0400
Received: by mail-qt0-x241.google.com with SMTP id c2-v6so16704383qtn.9;
	Mon, 28 May 2018 17:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zrgwAACpngJ+RiialOU7NLqhCiqaynx31tFneNGeIx4=;
	b=QEniwwaA0snuSIEpdCCKhmlxyrFmrWRqsFmF4hWnDSlo4xahs/uhb6Lv33oNh12+Md
	PsgrQt9dlGgnxAMPjXsX3oMD6EmlBnvGSpSlItdjHTkwBv1iNJ7wFHM4OfGYYAsaIf1q
	6JpXchmNKscspHsSQ5PXY23CcA/pQM3y8aTiQMaCi8BedXXjf8fqVxwJs76h5m81C4/V
	xOCvqok9H4+8C1uG4Webn3k3scX4H3GXsyio6iZiirPmJrEfvlSobFBslcVCQMazl+Kx
	m6bzczOJ30Zek9FpIrPdEXJCbZhXLNh1OKRnsSTX6KljEt4ijY8sgYE+e+4TOzoG83/w
	Wmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zrgwAACpngJ+RiialOU7NLqhCiqaynx31tFneNGeIx4=;
	b=aw458qh9MGkH/mcKp4ehJlfgEMtIGJ/VyWzALj535M5LxsfTgcSbphT9F1+oUfuIHc
	5Zz8xPxz8spnhoQrod+q5O1/6uCs0Dm3Lc/pEAnQQcZ0efEs3gVBoR/DZnuYmtLB/c/y
	lZwZ8/JJRH0p2b4XsQxJ8iUXofgnprBxhx6SyQt6KAykj0A3/9TBtdfa/REcbXTQ1YMF
	lV8LTPSpPLXLtN9tuY19fnR/1RiqTlzYi6eqlv93dMOBReQeT39btu8UtgwAct9Prs9R
	2jXv7L51I6CFGJWdJy7CmyhPgjCvLbENOYR/SqCftndsZBFFJkkNItqwpon8+R/c16ui
	0/7Q==
X-Gm-Message-State: ALKqPwdwr6hQ2GNImyEnVDuj8o8SyibBYKkkT0rj3d+38hbdnvShHwOe
	GuHXt9CN5V1PNFciajr7VK/Dp9MiAOU=
X-Google-Smtp-Source: ADUXVKJst7PEUfp1RZtvXumbmp10qkwWYA+/0uPDoksXKanDoIeOVVJu7Dy5udanPbcYJ5oayCIPYg==
X-Received: by 2002:a0c:a106:: with SMTP id d6-v6mr14155854qva.5.1527554529753;
	Mon, 28 May 2018 17:42:09 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	z15-v6sm21737141qti.93.2018.05.28.17.42.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 17:42:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <keith.busch@intel.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"open list:nvme" <qemu-block@nongnu.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-16-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a03e3c6d-52fc-b37c-c4f7-612c5af711a2@amsat.org>
Date: Mon, 28 May 2018 21:42:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180528232719.4721-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH v4 15/21] hw/block/nvme: Include
 "qemu/cutils.h" directly in the source file
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 00:42:18 -0000

On 05/28/2018 08:27 PM, Philippe Mathieu-Daudé wrote:

I forgot to add this commit description:

  "block/nvme.h" does not require any declaration of "qemu/cutils.h".
  Simplify dependencies by directly include it in the source file
  where the declarations are used.

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/block/nvme.h | 1 -
>  hw/block/nvme.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 8f3981121d..cabcf20c32 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -1,6 +1,5 @@
>  #ifndef HW_NVME_H
>  #define HW_NVME_H
> -#include "qemu/cutils.h"
>  #include "block/nvme.h"
>  
>  typedef struct NvmeAsyncEvent {
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 85d2406400..811084b6a7 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -35,6 +35,7 @@
>  #include "sysemu/block-backend.h"
>  
>  #include "qemu/log.h"
> +#include "qemu/cutils.h"
>  #include "trace.h"
>  #include "nvme.h"
>  
> 

