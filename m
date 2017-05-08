Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7nqf-0006EE-8V
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 14:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7nqc-0006Cq-NL
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 14:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7nqZ-0004vi-MN
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 14:57:30 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33919)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7nqZ-0004v0-Hf; Mon, 08 May 2017 14:57:27 -0400
Received: by mail-qk0-x242.google.com with SMTP id u75so11407427qka.1;
	Mon, 08 May 2017 11:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=u/N+h82PSJK1WNo9tdTEL0D8SwiJgHWuHCTTNeWN+RQ=;
	b=m5w+c80Y80xTOPgc3Q52TfzMc/Ul/WSVPqPdcDM11nq86Q2MR3DUt6aGEv9G6Id3F/
	68H60QYFx5CuHwo0IPjsYW9DH7PlTMxeCO865icAMTo28lzB2eG+6SgsQKw79ey5yCft
	qHSl6UdQKImhly6boIPuoWBDnbucLn6cgDoa1AKs/i0ooK11SC2RP6VKtX+iLPRr4Kws
	lD4uRQ0BIiAiz90/ZaBFhFRpYjjGWbZLK7l2tDIMsBAILn9M7TMfkGqHNKUKWVH04g6p
	y9vHXdw/Q2aILVMVbsqxpWl850r8XwY49gnJ1OQB2tAfClk/kUbgMFP12arhCqm9dJkN
	iDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=u/N+h82PSJK1WNo9tdTEL0D8SwiJgHWuHCTTNeWN+RQ=;
	b=Y7M0aIQDy1NB84bM5ccydcGtmP+CB7dWLcVmu+7RBpGJAC5asxeuqTz5Mdynl1vR0N
	drgnfApewQb61RTQFZWmbIT/jDwsxlyJlgY8bp2W974wvojK8Vag2KFq9HeL6OUI9pzn
	gfOC+wu1a8bhm3bg0WGZWMTz5xscEr6kZNFvD9a4Hz1MS+usN26OzPtrw0dqjBJ2/Yb3
	lWL0/sV0hY65B3blrHUSSThYa/C5y0qbejVLvIbeyxi0G/qWC0HBfa4qYwHvnWaJMKY2
	BAga5hBzGamtJ5l/HE5yncr3HxJpe+ohZz8lVU9oZ6k6QCuQPpTKXvQAFpGMqQ8gbeQo
	rJjQ==
X-Gm-Message-State: AN3rC/7V38N+pn16DstkXWlsgZaZQRM8NrH8W15wxqQDuBIaRdWa4Yc5
	TPWI/YSuc886BA==
X-Received: by 10.233.216.68 with SMTP id u65mr25005283qkf.37.1494269846832;
	Mon, 08 May 2017 11:57:26 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	x27sm7448565qtb.54.2017.05.08.11.57.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 11:57:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <1494266456-2251-1-git-send-email-jcmvbkbc@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e73e252e-61fc-6b2c-6e3f-f5a2e1f934cc@amsat.org>
Date: Mon, 8 May 2017 15:57:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494266456-2251-1-git-send-email-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/xtensa: sim: use
 g_string/g_new
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
X-List-Received-Date: Mon, 08 May 2017 18:57:31 -0000

On 05/08/2017 03:00 PM, Max Filippov wrote:
> Replace malloc/free/sprintf with g_string/g_string_printf/g_string_free.
> Replace g_malloc with g_new when allocating the MemoryRegion to get more
> type safety.
>
> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/xtensa/sim.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> index d2d1d3a..b27e28d 100644
> --- a/hw/xtensa/sim.c
> +++ b/hw/xtensa/sim.c
> @@ -41,21 +41,21 @@ static void xtensa_create_memory_regions(const XtensaMemory *memory,
>                                           const char *name)
>  {
>      unsigned i;
> -    char *num_name = malloc(strlen(name) + sizeof(i) * 3 + 1);
> +    GString *num_name = g_string_new(NULL);
>
>      for (i = 0; i < memory->num; ++i) {
>          MemoryRegion *m;
>
> -        sprintf(num_name, "%s%u", name, i);
> -        m = g_malloc(sizeof(*m));
> -        memory_region_init_ram(m, NULL, num_name,
> +        g_string_printf(num_name, "%s%u", name, i);
> +        m = g_new(MemoryRegion, 1);
> +        memory_region_init_ram(m, NULL, num_name->str,
>                                 memory->location[i].size,
>                                 &error_fatal);
>          vmstate_register_ram_global(m);
>          memory_region_add_subregion(get_system_memory(),
>                                      memory->location[i].addr, m);
>      }
> -    free(num_name);
> +    g_string_free(num_name, true);
>  }
>
>  static uint64_t translate_phys_addr(void *opaque, uint64_t addr)
>

