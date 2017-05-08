Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7h7n-0000Bg-17
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 07:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7h7k-0000AA-8g
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 07:46:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7h7f-0006hX-93
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 07:46:44 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7h7f-0006hA-2q; Mon, 08 May 2017 07:46:39 -0400
Received: by mail-qt0-x243.google.com with SMTP id l39so9119658qtb.1;
	Mon, 08 May 2017 04:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=wZJHl8mikfHFnalPFnzS60gXFFR2spMx8JIE9fCaJfI=;
	b=LJ/vn3vE3QtapHb/LW9NybZX+KXsjpopL5PtJbPIoXUsPTuvR6P58T/8Vv/M4Nhi4+
	dwJABcwyM+YKKGm4Zgi+QncU7cNpCVrU1hDzzUQX9I5YC5wIFG2uNci6xgyYW2A2PdoY
	b7yD9wXFO5bzC3VYWDxK40n7yluk6kzzFQsmjQyIwlgaGHjftA7X4xmC+b6rK6dS+U83
	tDzofrkV6IfVzQhh/zusVaOuLbF2bP9SuqVhl+lgu79SsDXHfJwpYzZEqHxQNBnvihZN
	r3hbHzHlfyssWMmQJRMCMJ6zVcXIC4JWA3kRhwAGZsgNGjn0A++I6M4B0CiOvgINunyO
	oNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=wZJHl8mikfHFnalPFnzS60gXFFR2spMx8JIE9fCaJfI=;
	b=kYVy5EZmVvKxp92SoidORYZobNUbsgYmzKXNKBiNPPzKKXqYAGX0L8gTR9Yca6kFjP
	85KfAiE5kdyRhBIUmflan2yNujMSZYCr1WMot8MztkfAjRUDqdwUjrEyQ8VD9DJ82o8B
	/wdJ6wvccZ9D77eiWtDU7rS/O7fsUP2QGmBZV9L+UEyIuhZ355lkjnRu23kjGnc1DKmV
	3KR7bmrCul/VRa2ZbL1W1rseyDMVojmISBd8mlFFeX0cmV9y2cwpFDV8L1Guuf/OXPfZ
	8z02SsItvlttrxwzdS4+7tAR0noKToY4PC/YBOXBy6gJ+/SOLk3Vj3r7ilXuKrsRLdla
	8uwA==
X-Gm-Message-State: AN3rC/4PhL2O39F0afMilxSGCmCglxl06betGb9nb/w13vGrrf8pG9Lf
	iFcY+BY8qoVSfQ==
X-Received: by 10.237.56.68 with SMTP id j62mr35709563qte.213.1494243998474;
	Mon, 08 May 2017 04:46:38 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id l15sm9980544qta.7.2017.05.08.04.46.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 04:46:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170508073529.23449-1-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <962a9aa7-6442-1aff-3ab2-400cf3cb8421@amsat.org>
Date: Mon, 8 May 2017 08:46:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170508073529.23449-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] xtensa: use
 g_malloc/g_new/g_free
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
X-List-Received-Date: Mon, 08 May 2017 11:46:45 -0000

On 05/08/2017 04:35 AM, Paolo Bonzini wrote:
> Replace malloc/free with g_malloc/g_free to get a program exit on
> out of memory.
>
> Replace g_malloc with g_new when allocating the MemoryRegion to
> get more type safety.
>
> Reported by Coverity.
>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/xtensa/sim.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> index d2d1d3a6fd..97307728f7 100644
> --- a/hw/xtensa/sim.c
> +++ b/hw/xtensa/sim.c
> @@ -41,13 +41,13 @@ static void xtensa_create_memory_regions(const XtensaMemory *memory,
>                                           const char *name)
>  {
>      unsigned i;
> -    char *num_name = malloc(strlen(name) + sizeof(i) * 3 + 1);
> +    char *num_name = g_malloc(strlen(name) + sizeof(i) * 3 + 1);
>
>      for (i = 0; i < memory->num; ++i) {
>          MemoryRegion *m;
>
>          sprintf(num_name, "%s%u", name, i);
> -        m = g_malloc(sizeof(*m));
> +        m = g_new(MemoryRegion, 1);
>          memory_region_init_ram(m, NULL, num_name,
>                                 memory->location[i].size,
>                                 &error_fatal);
> @@ -55,7 +55,7 @@ static void xtensa_create_memory_regions(const XtensaMemory *memory,
>          memory_region_add_subregion(get_system_memory(),
>                                      memory->location[i].addr, m);
>      }
> -    free(num_name);
> +    g_free(num_name);
>  }
>
>  static uint64_t translate_phys_addr(void *opaque, uint64_t addr)
>

