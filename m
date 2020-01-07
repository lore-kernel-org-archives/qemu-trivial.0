Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioioL-00077Z-P2
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 01:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ioioE-0006kz-EG
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 01:57:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ioioC-000413-Kg
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 01:57:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36584
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ioioC-00040f-GV
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 01:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578380264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpOkeoKoXEKKyNRY7Ln59c934syBDj+3pmaQUilkUio=;
 b=YSbg9SozHpeSOerROQGrtY1rod7dLeGEikAL26b4/V7GbHkQnD4J+W0vm4L8GKpK9a+A5m
 ifQnNS/nWsQV/8F8a7FrV/KxvZapzkc1aqUSGjg2ft/sMrWVFK2JFU/pWE35IOFxrRK6aH
 uw/rmBglJ7rl1bvhbgL2dU3SYCA2r9c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-A_MYyxABMLiAeby6WflhEA-1; Tue, 07 Jan 2020 01:57:42 -0500
Received: by mail-wr1-f71.google.com with SMTP id b13so10580910wrx.22
 for <qemu-trivial@nongnu.org>; Mon, 06 Jan 2020 22:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VpOkeoKoXEKKyNRY7Ln59c934syBDj+3pmaQUilkUio=;
 b=dEgZDVluPpMDwi5saKTII40NWxZdLxnOcJM3Ku/hD9EuhNMY7O4lMQS0ycg60mmipn
 0MPE5lE84GLTL5BR7sAfN4eG8jFnewy9mIOrmNhycyFhbp/SReJhfngOEPH+IsDUSxWB
 kOJiRcWkvMz2Qd+C57QTfFK4yjlbWfQyGZHXMU561UFJVxwF2lJhGtfQkXIWZvrXmk/z
 6sFzp8s5V7LWCN83IkptZs3myybB7MCOL1G5vsbl2jOwxOH6rdLtUtSQN78cdMGTdxWb
 mJ6/+WYSrFuALnW+SNKeAqq1TNkHM8069fQNYzIeW7/U8Bxix2mtTXfnw9/r3zHmxQM7
 0s2g==
X-Gm-Message-State: APjAAAWEEUuQa1DlLkXePlSxvSpSVspjmLMG3XekFQCwcv00o/xqvxss
 ssTvsOEVrQU6dHlrdLyMyvnK+RPVW0nnCGaEm92L//ycG1nPQtLqdPLN0gsZyUnaMtHQUpzCzjt
 /Ps5Tlthl6jbrX10e7A==
X-Received: by 2002:adf:e641:: with SMTP id b1mr106561350wrn.34.1578380261428; 
 Mon, 06 Jan 2020 22:57:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGELeSczwP4wCls3XD8md79K5yPaMZHjGnUtn7m0/MAvj0834Zc220gGFNAvm1J6GwpNo0rA==
X-Received: by 2002:adf:e641:: with SMTP id b1mr106561333wrn.34.1578380261189; 
 Mon, 06 Jan 2020 22:57:41 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id r68sm23696442wmr.43.2020.01.06.22.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 22:57:40 -0800 (PST)
Subject: Re: [PATCH v1 57/59] linux-user/syscall.c: fix trailing whitespaces
 and style
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-58-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bb5a46dc-d19f-85a7-05b7-d6e4931affb2@redhat.com>
Date: Tue, 7 Jan 2020 07:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106182425.20312-58-danielhb413@gmail.com>
Content-Language: en-US
X-MC-Unique: A_MYyxABMLiAeby6WflhEA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2020 06:57:51 -0000

On 1/6/20 7:24 PM, Daniel Henrique Barboza wrote:
> There are trailing whitespaces in this file that, if removed
> by a text editor that refuses to let the traiing whitespace

typo "trailing"

> alone, which happens to be the editor I am using, will cause
> checkpatch.pl to warn about styling problems in the resulting
> patch. This happens because the trailing whitespace lines
> are using a deprecated style.

Maybe you can use 'git add -p' to only add the lines with relevant changes.

> To keep the intended change I wanted to do (remove unneeded
> labels in do_ioctl_blkpg() and do_sendrecvmsg_locked())
> trivial, this patch is another trivial change to fix the
> trailing whitespaces and the code style errors that
> checkpatch.pl warns about. Doing this change beforehand will
> keep the next patch focused just on the label removal changes.
> 
> CC: Riku Voipio <riku.voipio@iki.fi>
> CC: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   linux-user/syscall.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 171c0caef3..49c6151c2d 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1062,7 +1062,7 @@ static inline rlim_t target_to_host_rlim(abi_ulong target_rlim)
>   {
>       abi_ulong target_rlim_swap;
>       rlim_t result;
> -
> +
>       target_rlim_swap = tswapal(target_rlim);
>       if (target_rlim_swap == TARGET_RLIM_INFINITY)
>           return RLIM_INFINITY;
> @@ -1070,7 +1070,7 @@ static inline rlim_t target_to_host_rlim(abi_ulong target_rlim)
>       result = target_rlim_swap;
>       if (target_rlim_swap != (rlim_t)result)
>           return RLIM_INFINITY;
> -
> +
>       return result;
>   }
>   
> @@ -1078,13 +1078,13 @@ static inline abi_ulong host_to_target_rlim(rlim_t rlim)
>   {
>       abi_ulong target_rlim_swap;
>       abi_ulong result;
> -
> +
>       if (rlim == RLIM_INFINITY || rlim != (abi_long)rlim)
>           target_rlim_swap = TARGET_RLIM_INFINITY;
>       else
>           target_rlim_swap = rlim;
>       result = tswapal(target_rlim_swap);
> -
> +
>       return result;
>   }
>   
> @@ -1526,10 +1526,11 @@ static inline abi_long target_to_host_cmsg(struct msghdr *msgh,
>       abi_ulong target_cmsg_addr;
>       struct target_cmsghdr *target_cmsg, *target_cmsg_start;
>       socklen_t space = 0;
> -
> +
>       msg_controllen = tswapal(target_msgh->msg_controllen);
> -    if (msg_controllen < sizeof (struct target_cmsghdr))
> +    if (msg_controllen < sizeof(struct target_cmsghdr)) {
>           goto the_end;
> +    }
>       target_cmsg_addr = tswapal(target_msgh->msg_control);
>       target_cmsg = lock_user(VERIFY_READ, target_cmsg_addr, msg_controllen, 1);
>       target_cmsg_start = target_cmsg;
> @@ -1610,8 +1611,9 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
>       socklen_t space = 0;
>   
>       msg_controllen = tswapal(target_msgh->msg_controllen);
> -    if (msg_controllen < sizeof (struct target_cmsghdr))
> +    if (msg_controllen < sizeof(struct target_cmsghdr)) {
>           goto the_end;
> +    }
>       target_cmsg_addr = tswapal(target_msgh->msg_control);
>       target_cmsg = lock_user(VERIFY_WRITE, target_cmsg_addr, msg_controllen, 0);
>       target_cmsg_start = target_cmsg;
> @@ -5592,9 +5594,9 @@ abi_long do_set_thread_area(CPUX86State *env, abi_ulong ptr)
>       }
>       unlock_user_struct(target_ldt_info, ptr, 1);
>   
> -    if (ldt_info.entry_number < TARGET_GDT_ENTRY_TLS_MIN ||
> +    if (ldt_info.entry_number < TARGET_GDT_ENTRY_TLS_MIN ||
>           ldt_info.entry_number > TARGET_GDT_ENTRY_TLS_MAX)
> -           return -TARGET_EINVAL;
> +        return -TARGET_EINVAL;
>       seg_32bit = ldt_info.flags & 1;
>       contents = (ldt_info.flags >> 1) & 3;
>       read_exec_only = (ldt_info.flags >> 3) & 1;
> @@ -5670,7 +5672,7 @@ static abi_long do_get_thread_area(CPUX86State *env, abi_ulong ptr)
>       lp = (uint32_t *)(gdt_table + idx);
>       entry_1 = tswap32(lp[0]);
>       entry_2 = tswap32(lp[1]);
> -
> +
>       read_exec_only = ((entry_2 >> 9) & 1) ^ 1;
>       contents = (entry_2 >> 10) & 3;
>       seg_not_present = ((entry_2 >> 15) & 1) ^ 1;
> @@ -5686,8 +5688,8 @@ static abi_long do_get_thread_area(CPUX86State *env, abi_ulong ptr)
>           (read_exec_only << 3) | (limit_in_pages << 4) |
>           (seg_not_present << 5) | (useable << 6) | (lm << 7);
>       limit = (entry_1 & 0xffff) | (entry_2  & 0xf0000);
> -    base_addr = (entry_1 >> 16) |
> -        (entry_2 & 0xff000000) |
> +    base_addr = (entry_1 >> 16) |
> +        (entry_2 & 0xff000000) |
>           ((entry_2 & 0xff) << 16);
>       target_ldt_info->base_addr = tswapal(base_addr);
>       target_ldt_info->limit = tswap32(limit);
> @@ -10554,8 +10556,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           return get_errno(fchown(arg1, low2highuid(arg2), low2highgid(arg3)));
>   #if defined(TARGET_NR_fchownat)
>       case TARGET_NR_fchownat:
> -        if (!(p = lock_user_string(arg2)))
> +        p = lock_user_string(arg2);
> +        if (!p) {
>               return -TARGET_EFAULT;
> +        }
>           ret = get_errno(fchownat(arg1, p, low2highuid(arg3),
>                                    low2highgid(arg4), arg5));
>           unlock_user(p, arg2, 0);
> 


