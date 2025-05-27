Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJtfr-0005tL-5V
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2025 08:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmarcin@redhat.com>)
 id 1uJpus-00036b-T2
 for qemu-trivial@nongnu.org; Tue, 27 May 2025 04:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmarcin@redhat.com>)
 id 1uJpuk-0000SW-Q9
 for qemu-trivial@nongnu.org; Tue, 27 May 2025 04:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748335440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=et/BwbUsXqvzAlagMQrqMH5Ict+SSCZLV52FTdB5VKg=;
 b=AkwLIdCzF8hl8bq/PI4puhSdCUkpxaVK2wtUz0xVpCIrZ8mv0DCTAU5yeKK6O2A9a41jt6
 c3nlHYAb2DiwKMbE/1FFqyw8Bz54ztvMXc32uKUkbgs7ZdTcKM5Io1Lmv4XpzWL9SVQIMv
 GxJ4nIENyohc/so7BN71FmHjqk89SYE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-aUxvbeS4NMCQNi9P7kD32w-1; Tue, 27 May 2025 04:43:56 -0400
X-MC-Unique: aUxvbeS4NMCQNi9P7kD32w-1
X-Mimecast-MFC-AGG-ID: aUxvbeS4NMCQNi9P7kD32w_1748335435
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-442ffaa7dbeso22845235e9.3
 for <qemu-trivial@nongnu.org>; Tue, 27 May 2025 01:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748335435; x=1748940235;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=et/BwbUsXqvzAlagMQrqMH5Ict+SSCZLV52FTdB5VKg=;
 b=uIp1NRZWqIFyPGIwTHkPcXGEmqcZSWNnF07vaDPlPFEVzxcaKLH93np8DMbU8SdoIx
 aPF9EK6Frr2W/T2Rgp7G5YnmyPPUU0gCOBqfcuZBXyXRUYS+hSb8bzcwL7XlZsjmfhiL
 bM6I0nve+py/g17+CA2bJpD7LyUapBWBikTpSgM+iM0/yPU873rdmqs3zTrkf11zUTip
 BNO2ikDxwqGpi9Lzat8uMQFCf94nim2ClEcbobrOZR1ppGBCROQ1V1MZF/hY0AqVcsy4
 +bBJYanc3Ydv7NHYY3jqR+zjMifPk65ZuQoQuy2ffqEsRCV4E4rNMZclqBdpRj67FC/u
 v8tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnqgTEsNsAlLv1iQzUdpG0+iQ1nJHSfkNiR7usvotDQRjmGk4NRkhCkAqHWe2MFSY5KjgFTEexrxbFfPQ=@nongnu.org
X-Gm-Message-State: AOJu0Yw5etvUlhU6g40CJZi8P/MEHQ1HFyIbmuR+AiwtFwXr61N2YKch
 bVgipfz3Ui3SMGfL/5J/N1U6LZ2ewsLeD8NZ4K2zE5GhmPLMBXbKXnC0wtZE3yqLA5qDQDIvt1X
 OpimTRR4lIgOolREcH9YMap7IVG6DONhOOFsUX2IV6DoFpgM3EG25yG52SBU=
X-Gm-Gg: ASbGncsUMvn/0US2I+ptnKzb4K8Fb0YqOJAadFrWdool8VIcmVeK1sFJe6bw5LfSWTU
 9a7I/wgtcqcLT/ac8Wpu1RTaIHpdjq1Le0fNR+jGlZzYP0uk8he8ZVO7+OqV43DTYr0RU5oNmsM
 MWs9bhuMNRwIvsZrtT86Kpo6syNAMDt46a9d3L5pVsz/eqnl5X5eEwRNwaVibGFqR3++PXR/UyA
 s6J2dvQ7Vv5FuHMwm540ZkPJ0yfsltfVbMwgbWDav5zVRpnoGfuzQKMEoUKCufIG7jlooBVvkXX
X-Received: by 2002:a05:600c:648a:b0:43e:a7c9:8d2b with SMTP id
 5b1f17b1804b1-44c92f21e1fmr89008625e9.24.1748335435069; 
 Tue, 27 May 2025 01:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4/xLgi7TVojFWWBHEUr97ghnhwtRSly8NKc/JgDyee7S/qO+UrpjbQLPWqhJ/k1VYUYBYJQ==
X-Received: by 2002:a05:600c:648a:b0:43e:a7c9:8d2b with SMTP id
 5b1f17b1804b1-44c92f21e1fmr89008415e9.24.1748335434691; 
 Tue, 27 May 2025 01:43:54 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f38142b8sm258180035e9.30.2025.05.27.01.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 01:43:54 -0700 (PDT)
Date: Tue, 27 May 2025 10:43:51 +0200
From: Juraj Marcin <jmarcin@redhat.com>
To: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, berrange@redhat.com, 
 pbonzini@redhat.com, vsementsov@yandex-team.ru, brian.cain@oss.qualcomm.com
Subject: Re: [PATCH] tests/unit/test-util-sockets: fix mem-leak on error object
Message-ID: <vrczuxngojoryf26h5k2gycypoeiwoqchd5sevxa4anmwq3dd3@aofc7j55qwcu>
References: <518d94c7db20060b2a086cf55ee9bffab992a907.1748280011.git.matheus.bernardino@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <518d94c7db20060b2a086cf55ee9bffab992a907.1748280011.git.matheus.bernardino@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -PmCytKBC8Ha3KiPITsBx7_HnblgaG26Rd7F8PFzum0_1748335435
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jmarcin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 May 2025 08:44:52 -0400
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
X-List-Received-Date: Tue, 27 May 2025 08:44:11 -0000

Hi Matheus

On 2025-05-26 10:20, Matheus Tavares Bernardino wrote:
> The test fails with --enable-asan as the error struct is never freed.
> In the case where the test expects a success but it fails, let's also
> report the error for debugging (it will be freed internally).

Oh, nice catch. Thanks!

Reviewed-by: Juraj Marcin <jmarcin@redhat.com>

> 
> Fixes 316e8ee8d6 ("util/qemu-sockets: Refactor inet_parse() to use QemuOpts")
> Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
> ---
>  tests/unit/test-util-sockets.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
> index 8492f4d68f..ee66d727c3 100644
> --- a/tests/unit/test-util-sockets.c
> +++ b/tests/unit/test-util-sockets.c
> @@ -341,8 +341,12 @@ static void inet_parse_test_helper(const char *str,
>      int rc = inet_parse(&addr, str, &error);
>  
>      if (success) {
> +        if (error) {
> +            error_report_err(error);
> +        }
>          g_assert_cmpint(rc, ==, 0);
>      } else {
> +        error_free(error);
>          g_assert_cmpint(rc, <, 0);
>      }
>      if (exp_addr != NULL) {
> -- 
> 2.37.2
> 


