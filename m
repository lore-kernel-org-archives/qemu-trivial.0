Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNMXh-0004ul-Qx
	for mharc-qemu-trivial@gnu.org; Mon, 16 Dec 2024 20:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tNMXY-0004qi-Ub
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2024 20:38:25 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tNMXV-0001Ef-O0
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2024 20:38:23 -0500
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7f46d5d1ad5so3430484a12.3
 for <qemu-trivial@nongnu.org>; Mon, 16 Dec 2024 17:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734399500; x=1735004300; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=17sle2ol5/VlndT97jJOm0rWRhLgcec3mPbKepTzUJs=;
 b=pBcNGMZQkP3/ngyy2NUsckfTDVJY2Yffz++UHGZZNYDuDEvzD9mKS3Nlt8vGzEiC4c
 qcumOm9TGXa91BjqyrM+qkpzbfCEE3HdQ1+1XHdbWuKa3gPpXP0Ea1PpJXLhYUo4NdNj
 eC/ECNg+WyObaERFNejoJVZcr0z66Vu4BIpJN8leUmR4w7+CuM/WXuN+Vx/QhrAXEMAY
 AYIotojPgDsRpi8jhMHlQFva9tcg2xHv0vyUTeT154LDAMBzGSC1YRt2IOIx/A1WNgYG
 mQt76eJyetpRkoTsRRZnhMPHT3k7rqy5odU5AG5rQTyfUCTw9FKcsGyY4409sToZFloc
 doAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734399500; x=1735004300;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=17sle2ol5/VlndT97jJOm0rWRhLgcec3mPbKepTzUJs=;
 b=goiSMTQmUyXgLTZawMCafksJy7WP9NUBVVVnSgyOVFjYczzEyZ/7cEJ13tiguKRUXe
 MW7Xc3nF0ivav1vEqCvv3V5rLAsXOPHfE9DVqLHCfs4bDILjBtv14xr8gTc52WhJRssT
 J4sfSN5rxEiyWCHsPbzlHXXK/hWjOyJgcOpry459gchvIhbuRVWYHiM0+8t810dEgHPY
 LzScX5/sGfuXe8DQ46pLjQ8NyYb1jp4ZT8MSzx5h1EFE8635TeqLZgPYeWcYrWoQxu3H
 Ld63CcHCVq59Dlt93Ap7sFmN5w6l0FcHKG77adHPamyqNQeEvKLQ+kTA1hCBbiDDWyLW
 OrYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlRxf6yxgbiESYtPwy66vkuiyo3ttz6Z6q/yorO3NzuYCEZTY8QpVa1GsuL1tzwqqM2P+IbR8iiCw379s=@nongnu.org
X-Gm-Message-State: AOJu0YzyctfR6rtJ8hFhz8n3nbXMay3eyikCZvlt9Lfv4Ve757Ea7lDO
 byoMkjjsTO/xY9ERAPUJiA8TvxnI1rDZw7wCe3XKlXuTJka8hFMz/EQV/aHRfN4=
X-Gm-Gg: ASbGncuWz7IwkHhfmEUFNd8k4zBBVdzyq6bx3gV5EZ3IUhGLDp8eKYU9U362+wcPFzT
 9E/32Zw/kwzG9hg9KKMQZhPoubx2GmVNdE/hHaSATtK8MajVdvVqCZd+VkgRuf01/JGVgxbD+Z5
 9Z/YjUMOpwZXzvjQd4Aq2+nh2U/IoUJi1kr3oao1RStPYE7P221rDmAixWjzsH1f3KkMGo9dtkr
 dq78dNy9cjUYot5AQ170Muu+xv4VY2f8fDn5l9VNplchQzXGL518hRtKN3TTPdt8zNe0ouuUdNs
 PIIuYB+eZ3xn5AtR1abFoI3LirhL
X-Google-Smtp-Source: AGHT+IHvdKf4myfKBlpqcNHb8QCOJS+jHawrYo4DWUyAnek8lUZOfPgbe9ttHfDE3SWoYW2Bug3CLA==
X-Received: by 2002:a17:90b:3c8a:b0:2ea:a25d:3baa with SMTP id
 98e67ed59e1d1-2f28fb52241mr21369921a91.5.1734399500202; 
 Mon, 16 Dec 2024 17:38:20 -0800 (PST)
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net.
 [216.180.64.156]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1dbac63sm49238145ad.5.2024.12.16.17.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 17:38:19 -0800 (PST)
Message-ID: <3f6f2d79-753a-4dc4-8ff5-6eb6c801a9c7@linaro.org>
Date: Mon, 16 Dec 2024 17:38:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vvfat: fix ubsan issue in create_long_filename
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: qemu-block@nongnu.org, alex.bennee@linaro.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 peter.maydell@linaro.org
References: <20241204195111.2921141-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241204195111.2921141-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Dec 2024 01:38:27 -0000

On 12/4/24 11:51, Pierrick Bouvier wrote:
> Found with test sbsaref introduced in [1].
> 
> [1] https://patchew.org/QEMU/20241203213629.2482806-1-pierrick.bouvier@linaro.org/
> 
> ../block/vvfat.c:433:24: runtime error: index 14 out of bounds for type 'uint8_t [11]'
>      #0 0x56151a66b93a in create_long_filename ../block/vvfat.c:433
>      #1 0x56151a66f3d7 in create_short_and_long_name ../block/vvfat.c:725
>      #2 0x56151a670403 in read_directory ../block/vvfat.c:804
>      #3 0x56151a674432 in init_directories ../block/vvfat.c:964
>      #4 0x56151a67867b in vvfat_open ../block/vvfat.c:1258
>      #5 0x56151a3b8e19 in bdrv_open_driver ../block.c:1660
>      #6 0x56151a3bb666 in bdrv_open_common ../block.c:1985
>      #7 0x56151a3cadb9 in bdrv_open_inherit ../block.c:4153
>      #8 0x56151a3c8850 in bdrv_open_child_bs ../block.c:3731
>      #9 0x56151a3ca832 in bdrv_open_inherit ../block.c:4098
>      #10 0x56151a3cbe40 in bdrv_open ../block.c:4248
>      #11 0x56151a46344f in blk_new_open ../block/block-backend.c:457
>      #12 0x56151a388bd9 in blockdev_init ../blockdev.c:612
>      #13 0x56151a38ab2d in drive_new ../blockdev.c:1006
>      #14 0x5615190fca41 in drive_init_func ../system/vl.c:649
>      #15 0x56151aa796dd in qemu_opts_foreach ../util/qemu-option.c:1135
>      #16 0x5615190fd2b6 in configure_blockdev ../system/vl.c:708
>      #17 0x56151910a307 in qemu_create_early_backends ../system/vl.c:2004
>      #18 0x561519113fcf in qemu_init ../system/vl.c:3685
>      #19 0x56151a7e438e in main ../system/main.c:47
>      #20 0x7f72d1a46249 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
>      #21 0x7f72d1a46304 in __libc_start_main_impl ../csu/libc-start.c:360
>      #22 0x561517e98510 in _start (/home/user/.work/qemu/build/qemu-system-aarch64+0x3b9b510)
> 
> The offset used can easily go beyond entry->name size. It's probably a
> bug, but I don't have the time to dive into vfat specifics for now.
> 
> This change solves the ubsan issue, and is functionally equivalent, as
> anything written past the entry->name array would not be read anyway.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   block/vvfat.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/block/vvfat.c b/block/vvfat.c
> index 8ffe8b3b9bf..f2eafaa9234 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -426,6 +426,10 @@ static direntry_t *create_long_filename(BDRVVVFATState *s, const char *filename)
>           else if(offset<22) offset=14+offset-10;
>           else offset=28+offset-22;
>           entry=array_get(&(s->directory),s->directory.next-1-(i/26));
> +        /* ensure we don't write anything past entry->name */
> +        if (offset >= sizeof(entry->name)) {
> +            continue;
> +        }
>           if (i >= 2 * length + 2) {
>               entry->name[offset] = 0xff;
>           } else if (i % 2 == 0) {

cc qemu-trivial.

