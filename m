Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nF8y9-0003dO-95
	for mharc-qemu-trivial@gnu.org; Wed, 02 Feb 2022 01:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nF8xy-0003Zs-P0
 for qemu-trivial@nongnu.org; Wed, 02 Feb 2022 01:18:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nF8xv-00057h-Uk
 for qemu-trivial@nongnu.org; Wed, 02 Feb 2022 01:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643782681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKyo7CwIWzdYLX+uMza+CZPWglMnyjb+JQMLfSr84es=;
 b=fcNZB3t/ilYuqg2UssSatBBog/EjWK89JdFZe6Cl9jtNOGJoeSYMgCq396OIjPdsrmgrMM
 CnUX9rZygE7EiWwAg3cxI9spRdP1IkVwWk24kDPAPIP1Yhr4t254pW3ID7Jje/iGOvqta7
 C51l4Pwg3fmOIgD0rnYOKCNss9n8a68=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-5NE7YeePOgmMonDECRVWcA-1; Wed, 02 Feb 2022 01:18:00 -0500
X-MC-Unique: 5NE7YeePOgmMonDECRVWcA-1
Received: by mail-ed1-f69.google.com with SMTP id
 en7-20020a056402528700b00404aba0a6ffso9859136edb.5
 for <qemu-trivial@nongnu.org>; Tue, 01 Feb 2022 22:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kKyo7CwIWzdYLX+uMza+CZPWglMnyjb+JQMLfSr84es=;
 b=Nr3KBoEWzgICvdWtvu9XcDErL9U5nCS3S7/AgzKi2hYIZPyU2Ktg07WcKp6ElwbUqe
 6GZBhBiQGk79xAsggyFngMNUSXIK5oU3QkRO/2vWG7vgt/sWYflF0oEgS6zUPFXpS/CM
 N5O2wzvvktVAPWyoAzKonAKmqQzkvIhxdQMa1YwW7G6PBf7n6S6O9OXFyKqGBKVs9sKa
 dwbsGfs5LyshkXQvB/xB63wX4Yy9gqs7KUa/JyJeTL9X5GHBJf/xE/A8vw5ExALrO6Gt
 bLidjFf6aP14vqaX66bRx9epxt08ZKM3x0ney7oVwXqQJhN8l6hYeaRn1/wVxXU2mJ1l
 SQSw==
X-Gm-Message-State: AOAM530CqwD04gSEH9i+yphDr9YxfvPWS/cZa42gyD7GVVZCmDkEo5q5
 Ic041beH4nmDzKHv75keA2sNUbwWtQjGV48ps1wxo5PM8XcmK+J2BeCMhgwmpxbOOg5s6uUPG4Q
 L8CT/8DQKJ2EZ2j4srg==
X-Received: by 2002:a17:907:c82:: with SMTP id
 gi2mr23872982ejc.260.1643782679630; 
 Tue, 01 Feb 2022 22:17:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjWQ9jyTgwdjmWj4JDlem5W0wO6sL+4gvZHXJ2dpMdVowiFQVXgf5A/enMH7Z7Kppr7H3Q6A==
X-Received: by 2002:a17:907:c82:: with SMTP id
 gi2mr23872966ejc.260.1643782679320; 
 Tue, 01 Feb 2022 22:17:59 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id gj10sm10963366ejb.192.2022.02.01.22.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 22:17:58 -0800 (PST)
Message-ID: <8e0f2ab3-d7f4-f1a8-b463-a88eb7b3e0cc@redhat.com>
Date: Wed, 2 Feb 2022 07:17:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/hexagon: remove unused variable
To: Zongyuan Li <zongyuan.li@smartx.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Taylor Simpson <tsimpson@quicinc.com>
References: <20220124064339.56027-1-zongyuan.li@smartx.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220124064339.56027-1-zongyuan.li@smartx.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 02 Feb 2022 06:18:08 -0000

On 24/01/2022 07.43, Zongyuan Li wrote:
> When building with clang version 13.0.0 (eg. Fedora 13.0.0-3.fc35),
> two unused variables introduced by macro GATHER_FUNCTION and
> SCATTER_FUNCTION will cause building process failure due to
> [-Werror -Wunused-variable].
> 
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/831
> ---
>   target/hexagon/mmvec/macros.h | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/target/hexagon/mmvec/macros.h b/target/hexagon/mmvec/macros.h
> index 10f4630364..44781cfb4a 100644
> --- a/target/hexagon/mmvec/macros.h
> +++ b/target/hexagon/mmvec/macros.h
> @@ -164,11 +164,9 @@
>           target_ulong va = EA; \
>           target_ulong va_high = EA + LEN; \
>           uintptr_t ra = GETPC(); \
> -        int log_bank = 0; \
>           int log_byte = 0; \
>           for (i0 = 0; i0 < ELEMENT_SIZE; i0++) { \
>               log_byte = ((va + i0) <= va_high) && QVAL; \
> -            log_bank |= (log_byte << i0); \
>               uint8_t B; \
>               B = cpu_ldub_data_ra(env, EA + i0, ra); \
>               env->tmp_VRegs[0].ub[ELEMENT_SIZE * IDX + i0] = B; \
> @@ -243,11 +241,9 @@
>           int i0; \
>           target_ulong va = EA; \
>           target_ulong va_high = EA + LEN; \
> -        int log_bank = 0; \
>           int log_byte = 0; \
>           for (i0 = 0; i0 < ELEM_SIZE; i0++) { \
>               log_byte = ((va + i0) <= va_high) && QVAL; \
> -            log_bank |= (log_byte << i0); \
>               LOG_VTCM_BYTE(va + i0, log_byte, IN.ub[ELEM_SIZE * IDX + i0], \
>                             ELEM_SIZE * IDX + i0); \
>           } \

Reviewed-by: Thomas Huth <thuth@redhat.com>


