Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJaui-0005l7-5I
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2024 11:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJauf-0005kO-8I
 for qemu-trivial@nongnu.org; Fri, 06 Dec 2024 11:10:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJauc-0001Uc-Qk
 for qemu-trivial@nongnu.org; Fri, 06 Dec 2024 11:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733501437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H/kPRRodLycyRKIyNLFAoXTASubjN8WcrZGrDVzsxvk=;
 b=a/spyjsJtO1xFfTGYJxy4Gw8G8PdcxVpiTEVYig5HazREDgDbcnWqvkZOiiIb9Mq261XSF
 DJ0fqYBZEMsSm13/f5KojME9ZhuwXeNXZ2YTUUmD0PYf27GogGrtpIDxTJgkrjhtYdInSL
 hMhIZzHxX/V9mck3jTVBBzDrob881jg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-tQiJvKcdMCWEeaoiMMgzOQ-1; Fri, 06 Dec 2024 11:10:34 -0500
X-MC-Unique: tQiJvKcdMCWEeaoiMMgzOQ-1
X-Mimecast-MFC-AGG-ID: tQiJvKcdMCWEeaoiMMgzOQ
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-434a29a93cdso18736995e9.1
 for <qemu-trivial@nongnu.org>; Fri, 06 Dec 2024 08:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733501433; x=1734106233;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H/kPRRodLycyRKIyNLFAoXTASubjN8WcrZGrDVzsxvk=;
 b=AbGOxsEmZg5UAg4tkPLRW/qDFcfyckuWuNmlRN8lzkFvP+WcaZcEtzGqBpR8mHZJbH
 u4k+Q1JdDulr62dbeFIfdsRIciFZuK8Ns6Sv0XPBZVqLXGLjPBDsXD2ajgJh1y2dV3Hh
 dZs6veMpCkZcELXtKXcGyTmd3y4nsYKujymZ/Jwe8IVVZ+nmzUvlS1jeyr9qlfdz/FMt
 tW118s58kYcgdMjq74IkPKJG3PaE2nfXFFudOZwAzSFlG9PqFG8749QIH8vngYnDr3ug
 7ROO+94i8TTfm/qXdgK4VQQYyb73+4IbtRP6pwBlCVKVTbYXGX8P63b87gvLIErbGrHJ
 O/ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3NoQt3mHJKtz69XsugJgrKghjfmRjo02mqwZgj3gsDUHty16jOtlCjpeKsqh58k7EY0biAhPwh9jvAyw=@nongnu.org
X-Gm-Message-State: AOJu0YwHX9MHruAT/wd7l4cKQI1OQHoR5AiJOsTLUFrueXI8druV8ghj
 pums/y0GtoJ42n++PyL7Yc+0R9B2joP9mFCfj2cECkpJW23T4rCpkhdWdcoIjo1IIZF8CFERwD4
 vXs2SW3lZkT3crrjxBoA08rj/UlT4NI7eycY55Ouhll5rONR6KGTHPHE=
X-Gm-Gg: ASbGncvgbJD3WXoHm5noidPrateuWe8qlFaDMe9G0SfWq5nA6eh+L3qjRnMqA/IqfMv
 soLsgDvjVWp6usSntw/cEDH0a8ykKK6c1E86AudNylK1v99PXeUmAqqdXYG3pyh3KqCKEHPHQ/o
 /+wAvRejoHVoE69aoxfwvg0PriPSOkuxZDrR8ML50CDU4BVb5Ni6/4o89Q3WerjV4CtaEfdwcfG
 ylvSkqvBaloRHSNZ06dn4VthVZOwKj0zxp7bX10VtMIEg+fC7SgUI7VEqnep17COqtPbVu0lMA6
 vX6j1g==
X-Received: by 2002:a05:600c:4f02:b0:431:5f1c:8359 with SMTP id
 5b1f17b1804b1-434ddeb7f8emr36118365e9.15.1733501432804; 
 Fri, 06 Dec 2024 08:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHA9wuMnHLD0VQvWucRTbQ3ehmOi+X9/youpSin22OI19JYFGUWPBj/61N12xt5CMz9fowCfA==
X-Received: by 2002:a05:600c:4f02:b0:431:5f1c:8359 with SMTP id
 5b1f17b1804b1-434ddeb7f8emr36117835e9.15.1733501432383; 
 Fri, 06 Dec 2024 08:10:32 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-244.web.vodafone.de.
 [109.42.48.244]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0dac17sm59473725e9.23.2024.12.06.08.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 08:10:32 -0800 (PST)
Message-ID: <3d48414f-903b-4b15-b85d-c2edc5ffb9b3@redhat.com>
Date: Fri, 6 Dec 2024 17:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/usb/hcd-xhci-nec: Remove unused XHCINecState::flags
 field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20241127122812.89487-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241127122812.89487-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QFmUf4N69Hr_fpdfOSnWl8wqdfnWOuYe7igAHzemgdY_1733501433
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 06 Dec 2024 16:10:41 -0000

On 27/11/2024 13.28, Philippe Mathieu-Daudé wrote:
> Commit b9599519a01 ("hw/usb/hcd-xhci: Remove XHCI_FLAG_SS_FIRST
> flag") remove the last use of XHCINecState::flags but neglected
> to remove it; do that now.
> 
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/usb/hcd-xhci-nec.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
> index 0c063b3697d..1a191fc7372 100644
> --- a/hw/usb/hcd-xhci-nec.c
> +++ b/hw/usb/hcd-xhci-nec.c
> @@ -30,10 +30,8 @@
>   OBJECT_DECLARE_SIMPLE_TYPE(XHCINecState, NEC_XHCI)
>   
>   struct XHCINecState {
> -    /*< private >*/
>       XHCIPciState parent_obj;
> -    /*< public >*/
> -    uint32_t flags;
> +
>       uint32_t intrs;
>       uint32_t slots;
>   };
> @@ -51,7 +49,6 @@ static void nec_xhci_instance_init(Object *obj)
>       XHCIPciState *pci = XHCI_PCI(obj);
>       XHCINecState *nec = NEC_XHCI(obj);
>   
> -    pci->xhci.flags    = nec->flags;
>       pci->xhci.numintrs = nec->intrs;
>       pci->xhci.numslots = nec->slots;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


