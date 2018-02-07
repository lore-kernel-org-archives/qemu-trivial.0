Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ejSNh-00055V-87
	for mharc-qemu-trivial@gnu.org; Wed, 07 Feb 2018 11:15:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejSNe-00052z-7i
	for qemu-trivial@nongnu.org; Wed, 07 Feb 2018 11:15:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejSNa-0005tK-L7
	for qemu-trivial@nongnu.org; Wed, 07 Feb 2018 11:15:30 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37985)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejSNa-0005ss-Dl; Wed, 07 Feb 2018 11:15:26 -0500
Received: by mail-qt0-x242.google.com with SMTP id z10so2338240qti.5;
	Wed, 07 Feb 2018 08:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lUaNo6Znx4+HlM81C+tVeDRHLheXekMjw61gZ64R4Cs=;
	b=FsAqa4iauE8ATx9uj/OXWXu0h+JFzWBAiBldWMlK2ZK72DIpaPUgqxgqIduGu38vwZ
	RpgRDag0J7Li0Z8k2ch4wQwl+RRTh7KZJYXmr4UHlpnSGSRl6bErRhSPxfkasOv9HIdQ
	wtFoTBUyvQ7ulWClb3OVa6SIm06IBbNYUCNQXlUhOTLvkQOlBoGgwaWHOIpSL5XwpfqL
	iNzv6yNrapBIvZZ/0Ju6narb8MQz9HGqQZ122/bYKR7YIFJUUNnpasQLODKVHv1RmuMg
	BmyS5VA4i7kpEcuuS8/t4zHNWN6E95HXTsj1TIXY7gzV8dpqUjAdCrbYR8eyqqvMNS6C
	8KRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=lUaNo6Znx4+HlM81C+tVeDRHLheXekMjw61gZ64R4Cs=;
	b=ZUvciXBGdcK43LQtE0TNUitevai6Z2Tc6rfp84wCWTE2S+vHhuUZcLXU5XdgBfTnmN
	LBggFvlqg6nkxLHNV/lRRc3O/e6jnker2F6/y8WdkLe2tInnk9Hq9QaSIb3km01Fxbp1
	BSWzz8V8YMnQTguv4KqiLdym0dloj4AsLfgxOyFyS4rwnCaYNyV58R8aWrill8br1/NQ
	/sKYmfqaogsiwPyDd0nQ1NIAg7wY8XtHlUlpxhkb3EFSoLLyrfkIQmhACtV7FxWhet+u
	RtR2e8tf6RQN5WANr7GrAyoSoTEwUocsL6txHpLnO1cJaNANwQQ7M6FF0waxmuz6ESAH
	wvHA==
X-Gm-Message-State: APf1xPARN//xsejLDTpJul+ZoT0hs4eUczw2eVoaOSFyZMAILqb0jS8X
	ByKjlclLbi/8MdjTP1gYVJQ=
X-Google-Smtp-Source: AH8x224YZ+1M5N2bXRp3EDpdAu8+OFyxRpQmjquJqOONVxfrvH0BpVNrKPnbYRAYxXRAyAY6N/Cqqg==
X-Received: by 10.237.45.231 with SMTP id i94mr10680407qtd.44.1518020125900;
	Wed, 07 Feb 2018 08:15:25 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id o2sm1308576qtg.12.2018.02.07.08.15.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 08:15:25 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	armbru@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>
References: <20180207160302.15651-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <502805c5-e418-a27c-2a94-ae88c6efb12f@amsat.org>
Date: Wed, 7 Feb 2018 13:15:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180207160302.15651-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop unneeded system header
 includes
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
X-List-Received-Date: Wed, 07 Feb 2018 16:15:31 -0000

On 02/07/2018 01:03 PM, Eric Blake wrote:
> <memory.h> is a non-standard obsolete header that was long ago
> replaced by <string.h>.
> 
> <malloc.h> is a non-standard header; it is not obsolete (we must
> use it for malloc_trim, for example), but generally should not
> be used in files that just need malloc() and friends, where
> <stdlib.h> is the standard header.
> 
> And since osdep.h already guarantees string.h and stdlib.h, we
> can drop these unusual system header includes as redundant
> rather than replacing them.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
> Based-on: <20180207124009.12376-1-armbru@redhat.com>
> ([PULL 00/20] Miscellaneous patches for 2018-02-07)
> 
>  target/i386/hax-windows.h | 2 --
>  target/i386/hvf/x86_mmu.c | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/target/i386/hax-windows.h b/target/i386/hax-windows.h
> index 004f8676949..20e2f85407b 100644
> --- a/target/i386/hax-windows.h
> +++ b/target/i386/hax-windows.h
> @@ -20,8 +20,6 @@
>  #ifndef TARGET_I386_HAX_WINDOWS_H
>  #define TARGET_I386_HAX_WINDOWS_H
> 
> -#include <memory.h>
> -#include <malloc.h>
>  #include <winioctl.h>
>  #include <windef.h>
> 
> diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
> index c6be2cca357..d5a0efe7188 100644
> --- a/target/i386/hvf/x86_mmu.c
> +++ b/target/i386/hvf/x86_mmu.c
> @@ -17,7 +17,6 @@
>   */
> 
>  #include "qemu/osdep.h"
> -#include <memory.h>
>  #include "panic.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> 

