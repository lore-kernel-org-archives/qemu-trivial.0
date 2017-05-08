Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7ilW-0003SP-4j
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 09:31:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1d7ilU-0003SA-Kg
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 09:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1d7ilP-0006zw-VH
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 09:31:52 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:34758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1d7ilP-0006zg-Od
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 09:31:47 -0400
Received: by mail-wr0-x233.google.com with SMTP id l9so43687685wre.1
	for <qemu-trivial@nongnu.org>; Mon, 08 May 2017 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=bxiQXI2x6LT+6eWTy1MDC68wZD8L87rTHOKfvGH3dZc=;
	b=QFQE10RxaGuehDGmHhQaGm5KFFCzvPmOEyyvPzlwdUU3azM+Rfy2i97QkANY01mwdV
	YlK5M0TUHsiZkZenALn2pr8rBAnhqedhUNQ3bUTn4JhFKEcbl6jqDD3H21R3A9JhQleU
	lLkd4fr+vaURsvYmdM5zyfJ6zZs6NJC51Z9p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=bxiQXI2x6LT+6eWTy1MDC68wZD8L87rTHOKfvGH3dZc=;
	b=uhDTDVbwHAUi0exB3a2LT9jYxZOE+M+CRsYeSArpUqsbR/NImPw7Juyy58sZenclcu
	tRNVcL05QiJ1URE+q1LwVE4Q0Qog9Dqj4yPUbBam7tKbcY2GVGhFmL6+uGjqjYen6JfH
	WMY38p1FZfXUGpfUyqT5EQzSjVm02j2qDE9t0OEqevrMcVRL1x56mkVvdPz63KzxkUe8
	/2uGWroVx42p6xYmnj5oJ3c83AFpRe35xavGtpZpVBNDtufFZqYSgqFdrndHJ3PJMoqL
	9lRR1I3HmHlw+pGdcEeYEdvGT8oMJOovysgb4i81FAFqOYCWVDiDYC+CjinfzC6sak7f
	Yttw==
X-Gm-Message-State: AN3rC/6DvR+cDi9pV8LCHRgNMcL5XUzilIe1Mq7poxVucjSqWf4l97qm
	T1SRx98Ge7h07Rc2
X-Received: by 10.223.130.15 with SMTP id 15mr45489982wrb.59.1494250306634;
	Mon, 08 May 2017 06:31:46 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id 7sm10942092wrs.69.2017.05.08.06.31.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 06:31:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E1EEB3E004E;
	Mon,  8 May 2017 14:32:30 +0100 (BST)
References: <20170508073529.23449-1-pbonzini@redhat.com>
User-agent: mu4e 0.9.19; emacs 25.2.17
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>
In-reply-to: <20170508073529.23449-1-pbonzini@redhat.com>
Date: Mon, 08 May 2017 14:32:30 +0100
Message-ID: <87r2zz8oep.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
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
X-List-Received-Date: Mon, 08 May 2017 13:31:53 -0000


Paolo Bonzini <pbonzini@redhat.com> writes:

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

It seems a little sketchy using the size of the storage type as a proxy
for the number of bytes used by the format specifier in a format string.
In this sort of situation I'd just use Glib and stop worrying about it:

  GString num_name = g_string_new(NULL);
  ...

      g_string_printf(num_name, "%s%u", name, i);
      m = g_new(MemoryRegion, 1);
      memory_region_init_ram(m, NULL, num_name->str,
                             memory->location[i].size,
                             &error_fatal);

      ...

  g_string_free(name, TRUE);

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


--
Alex Bennée

