Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1loOQK-0006Ec-To
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jun 2021 06:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loOQK-0006Ca-1y
 for qemu-trivial@nongnu.org; Wed, 02 Jun 2021 06:48:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loOQF-0004dR-MQ
 for qemu-trivial@nongnu.org; Wed, 02 Jun 2021 06:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622630903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4d+N5hSTUJBk3b5rNPJNcq/N8hJwu9KhEYYd83L8j8=;
 b=Nl6S2PJdGDu/GLv62rUvYHfG5nOMdNBHl3/Iplu9qh9vKHpKRq2PEgaFHaqAVrDctzURDr
 8ZlonwN+VT6wHvZSnBAGG556Gyxf1bIBoaW7rLWAv2iEN9tsqzG3FW4vh1VaM8nKCYeb8c
 nZVB4+bv6hmihLZPt3FuB3zpkzAyN9g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-0wxonjzHO_GU5N5oq8u6zQ-1; Wed, 02 Jun 2021 06:48:22 -0400
X-MC-Unique: 0wxonjzHO_GU5N5oq8u6zQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c12-20020aa7d60c0000b029038fccdf4390so1162300edr.9
 for <qemu-trivial@nongnu.org>; Wed, 02 Jun 2021 03:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W4d+N5hSTUJBk3b5rNPJNcq/N8hJwu9KhEYYd83L8j8=;
 b=ZBGBuFz9It1gjQXjRv7wV3a7/Nyas2PeePZps2+lgnZJKNmSLKPEHx6hVunHHqwcEa
 n7Jbafb3HiGz5zshz4zhPXBnIN6eO7C5NwTGqZtX85daA//mxbQlpLzynFnRqLIVDT1t
 dyFL/2gYDHSipjg2pE7ZfFY65Zo2lL5crED0x5ps+vRveoPifKb1kV6HoKK3qQ8v1kf9
 DFa/zEBTIa1NjQx9Q6llUDWFmwRbvpcFakt7OAuRi6+Ixbws6vJRn7SFq/eTtx4MUWUJ
 0MjqoIshUc/3/YR2xAJ5C9PU/WPvNs7+p0aemjZw9Kdx0jNJueXBteb1Z9fmUeOZA5ZV
 Dyyw==
X-Gm-Message-State: AOAM531ELcl2bisbYDNYcp+fhZq7I9NLjkWPwnDU63dyO2e/puLc5Zen
 PIur2NeAcVJn3AwsO8rMUpxvIRrMlmkIH+mJpFd2bl8EzHkzhXVjirajlD/Cpti+BKvf6BPKANa
 DuXbtMsOPO0THC5g8TmjZb+G3tK4L2mkcnUuUe6P9LH34Vk1LgMQxZqJsh6dqmBtR6Wg=
X-Received: by 2002:aa7:d0d4:: with SMTP id u20mr31625668edo.228.1622630900317; 
 Wed, 02 Jun 2021 03:48:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn6y/v7hS3WgMuIEL6X1PGmb0SdB2TcpUqGR2iHAUm98v3JjKgACvdssyI0ei4O7Bpp4yb/g==
X-Received: by 2002:aa7:d0d4:: with SMTP id u20mr31625649edo.228.1622630900119; 
 Wed, 02 Jun 2021 03:48:20 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l11sm8396436ejd.103.2021.06.02.03.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 03:48:19 -0700 (PDT)
Subject: Re: [PATCH] target/i386/sev: Ensure sev_fw_errlist is sync with
 update-linux-headers
To: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210219180131.2061072-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <665ebe97-fbe2-2273-0a02-1a94351c1e1c@redhat.com>
Date: Wed, 2 Jun 2021 12:48:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210219180131.2061072-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 02 Jun 2021 10:48:32 -0000

This patch was supposed to go via Eduardo's tree but he
missed it, can it go via qemu-trivial instead?

On 2/19/21 7:01 PM, Philippe Mathieu-Daudé wrote:
> Ensure sev_fw_errlist[] is updated after running
> the update-linux-headers.sh script.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Based-on: <20210218151633.215374-1-ckuehl@redhat.com>
> ---
>  target/i386/sev.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 37690ae809c..92c69a23769 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -87,7 +87,7 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
>  static SevGuestState *sev_guest;
>  static Error *sev_mig_blocker;
>  
> -static const char *const sev_fw_errlist[] = {
> +static const char *const sev_fw_errlist[SEV_RET_MAX] = {
>      [SEV_RET_SUCCESS]                = "",
>      [SEV_RET_INVALID_PLATFORM_STATE] = "Platform state is invalid",
>      [SEV_RET_INVALID_GUEST_STATE]    = "Guest state is invalid",
> @@ -114,6 +114,8 @@ static const char *const sev_fw_errlist[] = {
>      [SEV_RET_RESOURCE_LIMIT]         = "Required firmware resource depleted",
>      [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
>  };
> +/* Ensure sev_fw_errlist[] is updated after running update-linux-headers.sh */
> +QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 != SEV_RET_MAX);
>  
>  #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
>  
> @@ -160,6 +162,7 @@ fw_error_to_str(int code)
>      if (code < 0 || code >= SEV_FW_MAX_ERROR) {
>          return "unknown error";
>      }
> +    assert(sev_fw_errlist[code]);
>  
>      return sev_fw_errlist[code];
>  }
> 


