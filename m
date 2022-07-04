Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8MuE-0004VQ-Tp
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jul 2022 10:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8MuD-0004S9-BW
 for qemu-trivial@nongnu.org; Mon, 04 Jul 2022 10:18:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8MuA-0004Yh-Kf
 for qemu-trivial@nongnu.org; Mon, 04 Jul 2022 10:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656944305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cMB1jW7lCO4rh3rUyFrkBmXA+QvEBoOKxiOR3rFHZY=;
 b=ijonJgbBjcTzzThJlMARPK0PwVyPpBWcdWGwQ22Mxw5YteVCbeSn1heyV+wsPzDnDRz7v9
 KO1DQ7USIyce137/AJzS3SFfzjatVYQXbDEWfgipR/ZWCDpCtP0eU/P3fYfwVrL8frx8H3
 jhoFZ/TBxfihWeQoIpUelY/ABzhxaeI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-TVWpxROCMNig6hMf07X71Q-1; Mon, 04 Jul 2022 10:18:24 -0400
X-MC-Unique: TVWpxROCMNig6hMf07X71Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 m17-20020a05600c3b1100b003a04a2f4936so5410012wms.6
 for <qemu-trivial@nongnu.org>; Mon, 04 Jul 2022 07:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9cMB1jW7lCO4rh3rUyFrkBmXA+QvEBoOKxiOR3rFHZY=;
 b=VlhnnRCnFDcgfKY84Z0kk7WZyA6USVh4FijJi+BmNKceWCG+zQi+JKn1SbC3YIW80X
 WogZrqMAn4pZhjgxS5tutaXO2zaflI71UPcDkIthjJl0vHFD6oZ8UYAsMoclACIg6GjM
 ZDqng9ssSRohRfmRb7YfATqqVi1cALx7olnEHTW8MO2T+kFTzM9rdKjek2reOCz/gUJf
 IqycqPA9k0uowzHc9I+cdLI3kGtzrUsnQPu/H/+nsQ1tqtYAVMpuj7F1Q4yKOZ923UZf
 87bWjHdYfP8SAomxzR/iDyl8L3SsUQWYyzSMKJRbgCrSrbUyRcd6HgJM9q78KHr3W343
 DHVg==
X-Gm-Message-State: AJIora+BJ48eukhGRJH0zykd4ZoGCMnqqyvWyFZBF9htIz1/++Dj66HB
 OrWvpCdqrW3xHIBarVGIA3LCeqM9dAwJedKFKkH2KxrGE2Bh1o8pGeaJ1Zsm9n53mP4ElqDvy2Z
 LwznMVMrkRHvf6pymEw==
X-Received: by 2002:a05:600c:4e04:b0:3a1:8f34:5633 with SMTP id
 b4-20020a05600c4e0400b003a18f345633mr17462382wmq.169.1656944303205; 
 Mon, 04 Jul 2022 07:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vYAOV91FsLhD/zsvbeUumvjDZ5cUOWOWflnS/L1IcVm8wH0ZxUwzZPg2Eq1ApbqBZT9FmICA==
X-Received: by 2002:a05:600c:4e04:b0:3a1:8f34:5633 with SMTP id
 b4-20020a05600c4e0400b003a18f345633mr17462347wmq.169.1656944302804; 
 Mon, 04 Jul 2022 07:18:22 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 u3-20020adfdd43000000b0021d650e4df4sm5300534wrm.87.2022.07.04.07.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 07:18:22 -0700 (PDT)
Message-ID: <3cd71c14-12ea-f02c-5d02-21803d3c4b9f@redhat.com>
Date: Mon, 4 Jul 2022 16:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] stubs: update replay-tools to match replay.h types
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220704075832.31537-1-cfontana@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220704075832.31537-1-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 04 Jul 2022 14:18:29 -0000

On 04/07/2022 09.58, Claudio Fontana wrote:
> detected with GCC 13 [-Werror=enum-int-mismatch]
> 
> Solves Issue #1096.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> ---
>   stubs/replay-tools.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
> index 43296b3d4e..f2e72bb225 100644
> --- a/stubs/replay-tools.c
> +++ b/stubs/replay-tools.c
> @@ -7,13 +7,14 @@ bool replay_events_enabled(void)
>       return false;
>   }
>   
> -int64_t replay_save_clock(unsigned int kind, int64_t clock, int64_t raw_icount)
> +int64_t replay_save_clock(ReplayClockKind kind,
> +                          int64_t clock, int64_t raw_icount)
>   {
>       abort();
>       return 0;
>   }
>   
> -int64_t replay_read_clock(unsigned int kind, int64_t raw_icount)
> +int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount)
>   {
>       abort();
>       return 0;
> @@ -48,11 +49,11 @@ void replay_mutex_unlock(void)
>   {
>   }
>   
> -void replay_register_char_driver(Chardev *chr)
> +void replay_register_char_driver(struct Chardev *chr)
>   {
>   }
>   
> -void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
> +void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len)
>   {
>       abort();
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


