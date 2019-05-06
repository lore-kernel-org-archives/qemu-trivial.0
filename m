Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNYgg-0002dd-A6
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2019 04:09:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNYgd-0002co-Mm
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 04:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNYgc-0000JA-NX
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 04:09:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40015)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hNYgc-0000IY-HN
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 04:09:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id h4so16017272wre.7
	for <qemu-trivial@nongnu.org>; Mon, 06 May 2019 01:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DJyW7hzwFfLhLUH1Z1bIcC2OS5qVEQgXup+qB9MtToM=;
	b=bGE4vECgA29gTWW3q2jZClGY5CtXniIy11B5x0vSsOG47eJ2FY+DG6Y/EpDKY37uGN
	ensFjyGBsY5IcV9EumrecIWrFwObICt6sv9RV9pM1uesSlDtdPyn30onwRZ4W+auD7Ii
	ji5F1s/2K6yIosdT/hVu1JgUH9OkhpjHCzG5L5guskWDLEMMorXKVwjj/KxXLlvgo29g
	RU8AJpDrpW5S2hx9jHbN00dxLrWs4JZ0ZrS5L4Fk+e9PSgE1YQFAPAhuHjQbogJShFc5
	yWnujviBddtIR/yXQni6L6h9zRv0PHV1SLC+0zmZHo17gCB6ErmghYoY81hbSfygzNfG
	wIYA==
X-Gm-Message-State: APjAAAWEVs56XujR0fmhACyMFGEwpHJRBpeV5ET7q4Sb+VTBKUlIJ9c6
	uejCIt6b5nfjihEx6PGXJOJGqg==
X-Google-Smtp-Source: APXvYqxDu5XbP09ttBHAofmhIiiuAwrv032FQLjMQY3aYOnRW3ImiHhuPKKqn2bqskgWQ+17Qk+Q6Q==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr14398786wrp.240.1557130161592; 
	Mon, 06 May 2019 01:09:21 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	t81sm13682173wmb.47.2019.05.06.01.09.20
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 01:09:21 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, Niels de Vos <ndevos@redhat.com>
References: <20190506061854.22207-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a0785ba5-2cf9-6aca-b468-35c67520afb7@redhat.com>
Date: Mon, 6 May 2019 10:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506061854.22207-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [QEMU PATCH] MAINTAINERS: Downgrade
 status of block sections without "M:" to "Odd Fixes"
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
X-List-Received-Date: Mon, 06 May 2019 08:09:24 -0000

On 5/6/19 8:18 AM, Thomas Huth wrote:
> Fixes might still get picked up via the qemu-block mailing list,
> so the status is not "Orphan" yet.
> Also add the gluster mailing list as suggested by Niels here:
> 
>  https://patchwork.kernel.org/patch/10613297/#22409943
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 66ddbda9c9..899a4cd572 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2404,12 +2404,13 @@ F: block/ssh.c
>  
>  CURL
>  L: qemu-block@nongnu.org
> -S: Supported
> +S: Odd Fixes
>  F: block/curl.c

Fair enough.

>  GLUSTER
>  L: qemu-block@nongnu.org
> -S: Supported
> +L: integration@gluster.org
> +S: Odd Fixes
>  F: block/gluster.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

