Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gc8jk-0005rK-Lc
	for mharc-qemu-trivial@gnu.org; Wed, 26 Dec 2018 07:56:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gc8jj-0005r9-O5
	for qemu-trivial@nongnu.org; Wed, 26 Dec 2018 07:56:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gc8jg-0007Dg-JW
	for qemu-trivial@nongnu.org; Wed, 26 Dec 2018 07:56:35 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]:55467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gc8jg-0007BW-CG
	for qemu-trivial@nongnu.org; Wed, 26 Dec 2018 07:56:32 -0500
Received: by mail-wm1-f46.google.com with SMTP id y139so14436254wmc.5
	for <qemu-trivial@nongnu.org>; Wed, 26 Dec 2018 04:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pMNt5sKDB+w41QundCjpoyUidMKANL3ibYVU2Qyxpfc=;
	b=MhBPAm41GpR2HGwW+3a6fMfNwb9t9j9KWL44QckQub2LUDVEO7LYwAhHdMoqj55+Ef
	kkpk+9zHHKp9PMbuw97kfxVplkHxj8GifBoWn7Wbd2ccOpmZqWXD3YqKTQOo1aijTGhu
	yxP2LCnlwxxzIENBW+Y+LergaQcOG42j1ctQ7e9NzJi4WdiQtkmQNpzkescxYaqCgjge
	5ZSN1Ky/LZhct9iF5m12Uii28Tp2RgUHdoPvQUNPqJ51lhRi69jmgbehsrJhwDGav/o1
	/cKKP2qSiKb13EwxJ+J6L9FicR1Y799O8KN8HJAAS0+WX5r6RBM0zKQgwAXNwNMBoPI1
	kMGQ==
X-Gm-Message-State: AJcUukfGEHfqmz4PUTHJ9FEfGltP99MdmYpzaXh4npyyHlp7YntHEN4i
	UUn+T6AjM1btboCBsXzX39KKiwui6JhAaQ==
X-Google-Smtp-Source: ALg8bN7djKlxEIAxtsuj5IHVE6rLwOSIySMJCSAm8iSHLqDtmHgOHqZMxpVnQKVz9ldspTWOn4Gk/A==
X-Received: by 2002:a1c:4955:: with SMTP id w82mr18876212wma.33.1545828990270; 
	Wed, 26 Dec 2018 04:56:30 -0800 (PST)
Received: from [10.9.9.175] ([109.190.253.16])
	by smtp.gmail.com with ESMTPSA id
	10sm25555292wmy.40.2018.12.26.04.56.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 04:56:29 -0800 (PST)
To: Priit Laes <plaes@plaes.org>, Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20181226003722.31257-1-plaes@plaes.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8d71a38b-f907-c959-0bb5-aed5b62f5652@redhat.com>
Date: Wed, 26 Dec 2018 13:56:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181226003722.31257-1-plaes@plaes.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.46
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom: Include
 qemu/fprintf-fn.h in cpu.h
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
X-List-Received-Date: Wed, 26 Dec 2018 12:56:36 -0000

On 12/26/18 1:37 AM, Priit Laes wrote:
> QOM cpu.h uses fprintf_function which requires Qemu's
> qemu/fprintf-fn.h header. Include it.
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  include/qom/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 1396f53e5b..6d1ba53d72 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -26,6 +26,7 @@
>  #include "exec/memattrs.h"
>  #include "qapi/qapi-types-run-state.h"
>  #include "qemu/bitmap.h"
> +#include "qemu/fprintf-fn.h"
>  #include "qemu/rcu_queue.h"
>  #include "qemu/queue.h"
>  #include "qemu/thread.h"
> 

