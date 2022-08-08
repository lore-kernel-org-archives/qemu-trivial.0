Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oKy1J-00062l-4U
	for mharc-qemu-trivial@gnu.org; Mon, 08 Aug 2022 04:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKy1G-0005zd-Vz
 for qemu-trivial@nongnu.org; Mon, 08 Aug 2022 04:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKy1F-0004q8-BK
 for qemu-trivial@nongnu.org; Mon, 08 Aug 2022 04:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659946908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xu7/rsLO7YUq+P2lrkzebLtqZAoBu1yM0k2w3nmzSTc=;
 b=C0Z8+zsJfmQcVLli+CL8nqaqdAKG9P7PASWr8ssB/FWMyDpdEu8RcIPuAWhIPiveNM/PC9
 tXnUyZhFgq3J93Tn7ue0VjveeQxVaVpZ1PI/Xyt0Ci7AiHUPUp9vzEy/CJcxAUpBGGQb72
 p6nfIqIz3z027qeT2revPIM0HAw3Wgc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-UZId6pt0PO2AiEeRYES9Lw-1; Mon, 08 Aug 2022 04:21:41 -0400
X-MC-Unique: UZId6pt0PO2AiEeRYES9Lw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c189-20020a1c35c6000000b003a4bfb16d86so4463930wma.3
 for <qemu-trivial@nongnu.org>; Mon, 08 Aug 2022 01:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Xu7/rsLO7YUq+P2lrkzebLtqZAoBu1yM0k2w3nmzSTc=;
 b=Nl4Lt21+iu0/KCVw4qCTod/wsQUPGhPYQ025+wshVq9tF2lIdrpKmoyCzVrVWd2NI/
 ytxptGl0AakHeQEUoBYQS2WwalH3uKxzTa1fyAmSgUqbTBIplw0loo3J6IqWFI2fLGmK
 nXfu4AhdORSe6YNCWvKGPMMcARVFriZ4YlFQfWbkBR1FJ9UJgf8eF+cDWCTROnysiY6N
 ZeNwen2gmkNWiJ71hs/W1PPph3g0GJvym8Uj1KMVXnYoiq+UM6Xr58iN48cv/QQ/dncT
 WV/SU8lxQ1/b6cHwzD2iSKxBSzF37e3fj4YA6BeMPRYDDDN25w5eKK46Yo9/8GkpY51c
 2qZg==
X-Gm-Message-State: ACgBeo08E+srfQRkzXAEDGVU3GJN2lgXD+uxvXG9//CMvuQK81Gt5aau
 BwIstOUNkOlyO1Ry2zP9O63Zx90SfUncqjJk0CYCPBPIYmBCEoywgDTzbUInToeKz9gFqNM4V7L
 RtVgzxu6CHp+x1sxobw==
X-Received: by 2002:a05:6000:1848:b0:223:5eb9:d1d5 with SMTP id
 c8-20020a056000184800b002235eb9d1d5mr620374wri.381.1659946899921; 
 Mon, 08 Aug 2022 01:21:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LaCN9RQKmZJuGbC8qx8Y4UXa77lx2nOeRtJQY3wr4w9qMjLt6a9/L3tVzAFge3ZTAlVQxew==
X-Received: by 2002:a05:6000:1848:b0:223:5eb9:d1d5 with SMTP id
 c8-20020a056000184800b002235eb9d1d5mr620361wri.381.1659946899700; 
 Mon, 08 Aug 2022 01:21:39 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-71.web.vodafone.de.
 [109.42.113.71]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c240b00b003a331c6bffdsm13277511wmp.47.2022.08.08.01.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 01:21:39 -0700 (PDT)
Message-ID: <3f913138-4746-c8ec-6b54-4bc2d0f49cdf@redhat.com>
Date: Mon, 8 Aug 2022 10:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xlnx_dp: drop unsupported AUXCommand in
 xlnx_dp_aux_set_command
To: Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220808080116.2184881-1-cyruscyliu@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220808080116.2184881-1-cyruscyliu@gmail.com>
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
X-List-Received-Date: Mon, 08 Aug 2022 08:21:51 -0000

On 08/08/2022 10.01, Qiang Liu wrote:
> In xlnx_dp_aux_set_command, when the command leads to the default
> branch, xlxn-dp will abort and then crash.
> 
> This patch removes this abort and drops this operation.
> 
> Fixes: 58ac482 ("introduce xlnx-dp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/411
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Tested-by: Qiang Liu <cyruscyliu@gmail.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>   hw/display/xlnx_dp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index a071c81..b0828d6 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -532,8 +532,8 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
>           qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
>           break;
>       default:
> -        error_report("%s: invalid command: %u", __func__, cmd);
> -        abort();
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid command: %u", __func__, cmd);
> +        return;
>       }
>   
>       s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;

Reviewed-by: Thomas Huth <thuth@redhat.com>


