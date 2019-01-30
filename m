Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gotYH-0008Ur-Ib
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 12:21:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gotYD-0008Ro-Rs
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 12:21:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gotY9-0000qG-WF
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 12:21:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gotY8-0000oh-Ee
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 12:21:20 -0500
Received: by mail-wm1-f68.google.com with SMTP id t200so377241wmt.0
	for <qemu-trivial@nongnu.org>; Wed, 30 Jan 2019 09:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tlcgjuhPbVfZh6Mzm3WByRGCKu70IGvv5sCXSkFlfBw=;
	b=s6IAUhrsXRMwwCT5c+5lWXbc3UIKU+6uuXw8ZcsZfe6nzJFRi1d2zHkrjOKDdxolon
	wqtRfIg0ToVWysShR0GwOonnJuThr8fbXgeTLzhNSUnyFAqaTsDxqJtqLk8IxYXu3o5M
	hsm/rssqJSzlPpF4BRNBhQeIUt/wRq5zgWCFkDLleQQwSI9dWyjEoRgXTJM95o8aekch
	Ey0EK3dE9fat1in5FPcmIbxUa+2GWIchDZf0opHddc/wKqg3L1iFyZ5vhFbUuCjXy32c
	X9vd9Ub9w4O2Xz+McUQ+ZcyGadsRH1d8tIkSGSiFwLcDfLCtBcXJcCAgT2K8oYC5D2IN
	DYtQ==
X-Gm-Message-State: AJcUukdRlMcXaP/18v8hwk/WmLKd3+SGsAdnZV5EbWl6Ccd5E+98U/zr
	BKcrV0YqwduXyB3MZ8njutgwEA==
X-Google-Smtp-Source: ALg8bN5nvdR9OhyfvxfqxOyrIaqCyVpsybak0p7fguHtI7nHrbM+/0xzlXDs32q7UB6egqhoYW87zw==
X-Received: by 2002:a1c:b189:: with SMTP id a131mr27149784wmf.38.1548868878528;
	Wed, 30 Jan 2019 09:21:18 -0800 (PST)
Received: from [10.32.224.134] (red-hat-inc.vlan560.asr1.mad1.gblx.net.
	[159.63.51.90]) by smtp.gmail.com with ESMTPSA id
	k128sm4171373wmd.37.2019.01.30.09.21.17
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:21:17 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1548866382-14488-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4e8dcc26-7e62-c79d-c354-8ade5db33f26@redhat.com>
Date: Wed, 30 Jan 2019 18:21:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1548866382-14488-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/ppc: Don't include
 m48t59.h if it is not necessary
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
X-List-Received-Date: Wed, 30 Jan 2019 17:21:26 -0000

On 1/30/19 5:39 PM, Thomas Huth wrote:
> These files don't use anything from m48t59.h, so no need to include
> this header here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/ppc/mac_newworld.c | 1 -
>  hw/ppc/mac_oldworld.c | 1 -
>  hw/ppc/ppc.c          | 2 --
>  hw/ppc/ppc_booke.c    | 1 -
>  4 files changed, 5 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index bb19eab..f1c8400 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -53,7 +53,6 @@
>  #include "hw/ppc/mac.h"
>  #include "hw/input/adb.h"
>  #include "hw/ppc/mac_dbdma.h"
> -#include "hw/timer/m48t59.h"
>  #include "hw/pci/pci.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 817f70e..98d531d 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -30,7 +30,6 @@
>  #include "hw/ppc/ppc.h"
>  #include "mac.h"
>  #include "hw/input/adb.h"
> -#include "hw/timer/m48t59.h"
>  #include "sysemu/sysemu.h"
>  #include "net/net.h"
>  #include "hw/isa/isa.h"
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 98b409f..cffdc39 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -30,10 +30,8 @@
>  #include "qemu/timer.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/cpus.h"
> -#include "hw/timer/m48t59.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
> -#include "hw/loader.h"

I supposed the "hw/loader.h" change slipped in by mistake.

For m48t59.h:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  #include "sysemu/kvm.h"
>  #include "kvm_ppc.h"
>  #include "trace.h"
> diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
> index 23bcf1b..4f11e00 100644
> --- a/hw/ppc/ppc_booke.c
> +++ b/hw/ppc/ppc_booke.c
> @@ -28,7 +28,6 @@
>  #include "hw/ppc/ppc.h"
>  #include "qemu/timer.h"
>  #include "sysemu/sysemu.h"
> -#include "hw/timer/m48t59.h"
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_ppc.h"
> 

