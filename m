Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8dyG-0006wL-WC
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jul 2022 04:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8dy4-0006ul-UH
 for qemu-trivial@nongnu.org; Tue, 05 Jul 2022 04:31:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8dxx-0003uQ-MU
 for qemu-trivial@nongnu.org; Tue, 05 Jul 2022 04:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657009888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1obvb41oebtqi3jwQOB0iSR/vviQDOM0O90F1W0jlMM=;
 b=fle59ljCf8ivtehmP5Xiku/e04WCCdSCKCC5/ooVhZ3GU8jngYvGNM9nH4EaKpual6EQe/
 oCCO5+Kq8dnSnjM3GcKZ02Xwld7f3ZdVhKcKcf05L4d95/3IFfsgW8xtIlh0TVSsxJLSDh
 Ch8+Iqg4mZJjgVUZZ/ibzdipDdjCVoc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-izYrvlrQOk-Bg373ukeZRQ-1; Tue, 05 Jul 2022 04:31:26 -0400
X-MC-Unique: izYrvlrQOk-Bg373ukeZRQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s1-20020a5d69c1000000b0021b9f3abfebso1723533wrw.2
 for <qemu-trivial@nongnu.org>; Tue, 05 Jul 2022 01:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1obvb41oebtqi3jwQOB0iSR/vviQDOM0O90F1W0jlMM=;
 b=zV7XFWg85DPEty10I+e2HXwl5ChiUyV8gk7QmjsgKwSESIOZWoxXHC8algb/pRTCuo
 S5QXZD0btDXWk/uLGyKZXl/YLT5FYoJ3ZnRyYCVQ23bPQh7unYbTsxzCBD7uLqQaTWtw
 MAKibgVUCv+5bvEs6H6ENS0vF5QyINdMiMtiTmKgmUsJBk1rle+dq0UMZ1zYuXzplRx0
 r96TvchuZ1KhURPyKElhq1OO8L8Eyn82yt11/K3ueem7FlM/oCJsk6IpjQPF3gJT5AjG
 ESw+ta5il6fA2FZzL4bNJxBAQdEiKuK3yPutUaikrhHkBgqUiT9defvdwfO4kXiuyyzi
 J/gg==
X-Gm-Message-State: AJIora8QJCiXrKDEGxseynr0Ar0qpbqm3Sn5ygyZ1nL0MnlaMeeGVuL5
 TSQqCHx+PLDNKqunHgDNZ7zT4L2l8NPAzkReIcN929sbS57xOBzEcKo0cHKjDdqocJF2f4iLY5f
 eS886hJlaaoaxN/koqA==
X-Received: by 2002:a05:600c:3510:b0:3a0:f957:116e with SMTP id
 h16-20020a05600c351000b003a0f957116emr34302866wmq.179.1657009885841; 
 Tue, 05 Jul 2022 01:31:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIlnkBVKgsx8BgUssniiCCl0sRRR2eqXHYePjXH4ShBGUwNeGRvkb5ysYXPDIhMVLvuzgjKA==
X-Received: by 2002:a05:600c:3510:b0:3a0:f957:116e with SMTP id
 h16-20020a05600c351000b003a0f957116emr34302838wmq.179.1657009885553; 
 Tue, 05 Jul 2022 01:31:25 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-21.web.vodafone.de.
 [109.43.176.21]) by smtp.gmail.com with ESMTPSA id
 e29-20020a5d595d000000b0021bc663ed67sm27225471wri.56.2022.07.05.01.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:31:25 -0700 (PDT)
Message-ID: <720d6853-1439-5e9e-9d78-21e62a94a4a8@redhat.com>
Date: Tue, 5 Jul 2022 10:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/rtc/ls7a_rtc: Drop unused inline functions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220705082836.1141160-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220705082836.1141160-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 05 Jul 2022 08:31:41 -0000

On 05/07/2022 10.28, Richard Henderson wrote:
> Remove toy_val_to_time_mon and toy_val_to_time_year as unused,
> and to avoid a build failure with clang.  Remove all of the
> other inline markers foo so that this does not creep back in.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/rtc/ls7a_rtc.c | 27 ++++++---------------------
>   1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
> index e8b75701e4..1f9e38a735 100644
> --- a/hw/rtc/ls7a_rtc.c
> +++ b/hw/rtc/ls7a_rtc.c
> @@ -86,46 +86,31 @@ struct LS7ARtcState {
>   };
>   
>   /* switch nanoseconds time to rtc ticks */
> -static inline uint64_t ls7a_rtc_ticks(void)
> +static uint64_t ls7a_rtc_ticks(void)
>   {
>       return qemu_clock_get_ns(rtc_clock) * LS7A_RTC_FREQ / NANOSECONDS_PER_SECOND;
>   }
>   
>   /* switch rtc ticks to nanoseconds */
> -static inline uint64_t ticks_to_ns(uint64_t ticks)
> +static uint64_t ticks_to_ns(uint64_t ticks)
>   {
>       return ticks * NANOSECONDS_PER_SECOND / LS7A_RTC_FREQ;
>   }
>   
> -static inline bool toy_enabled(LS7ARtcState *s)
> +static bool toy_enabled(LS7ARtcState *s)
>   {
>       return FIELD_EX32(s->cntrctl, RTC_CTRL, TOYEN) &&
>              FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
>   }
>   
> -static inline bool rtc_enabled(LS7ARtcState *s)
> +static bool rtc_enabled(LS7ARtcState *s)
>   {
>       return FIELD_EX32(s->cntrctl, RTC_CTRL, RTCEN) &&
>              FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
>   }
>   
> -/* parse toy value to struct tm */
> -static inline void toy_val_to_time_mon(uint64_t toy_val, struct tm *tm)
> -{
> -    tm->tm_sec = FIELD_EX32(toy_val, TOY, SEC);
> -    tm->tm_min = FIELD_EX32(toy_val, TOY, MIN);
> -    tm->tm_hour = FIELD_EX32(toy_val, TOY, HOUR);
> -    tm->tm_mday = FIELD_EX32(toy_val, TOY, DAY);
> -    tm->tm_mon = FIELD_EX32(toy_val, TOY, MON) - 1;
> -}
> -
> -static inline void toy_val_to_time_year(uint64_t toy_year, struct tm *tm)
> -{
> -    tm->tm_year = toy_year;
> -}
> -
>   /* parse struct tm to toy value */
> -static inline uint64_t toy_time_to_val_mon(struct tm *tm)
> +static uint64_t toy_time_to_val_mon(const struct tm *tm)
>   {
>       uint64_t val = 0;
>   
> @@ -137,7 +122,7 @@ static inline uint64_t toy_time_to_val_mon(struct tm *tm)
>       return val;
>   }
>   
> -static inline void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
> +static void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
>   {
>       qemu_get_timedate(tm, s->offset_toy);
>       tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);

I wonder why the other Clang-based CI jobs (running on Linux) did not 
complain about this...?

Reviewed-by: Thomas Huth <thuth@redhat.com>


