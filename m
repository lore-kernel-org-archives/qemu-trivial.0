Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rdZw0-0005xR-S3
	for mharc-qemu-trivial@gnu.org; Fri, 23 Feb 2024 13:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdZkG-0003NI-PV
 for qemu-trivial@nongnu.org; Fri, 23 Feb 2024 12:54:00 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdZkE-0005z3-WA
 for qemu-trivial@nongnu.org; Fri, 23 Feb 2024 12:54:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-412984360faso1720545e9.1
 for <qemu-trivial@nongnu.org>; Fri, 23 Feb 2024 09:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708710837; x=1709315637; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wm/3VqJy4JV8D9Jtr6AJYVH6S+lLPzfbWwpJolkV9H8=;
 b=tdKGK5ltVgOm2k6g1hrIyRg+ys2PIJLY6qJKgh7EUwCueQpvExy92J/PlZTBhDF+6F
 OiBnUw8Dp1Bg6UKkHmcR2Hg4vitMh1sDp850zSHMMsBmjrzpnKyRBBktLu8N2JR7tPVh
 MEk5Jyar4gwTSrVPcVKrhISR7+GvyZWgRcXS2MF0uN8x+IwrwJS88ooEL6a9TyMbCOLX
 spgXpvg9ZNje0i3XqYM1dTWIZWX08kAHzNuBd+CDhGsNcil0BtfDng5R0sU5K/IEplq3
 21yHeptmlHKossriaB1Bv9BMJMhWZ0MsxsPOWd9dTmn1/9MNlYRj5jQB2rjncTFniVXX
 xrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708710837; x=1709315637;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wm/3VqJy4JV8D9Jtr6AJYVH6S+lLPzfbWwpJolkV9H8=;
 b=Fk2iznyMdjQmqWRl65zzqgMAvzJ21rujaG68CoYvM89G9y++1/Zkb3btk2gEo6a2XF
 cw8cuxF+mzoJ4YV4oLKYUW+IHnjL/XMfb2YD5cZtkW+4pWTYFde45lRS+ql4YIscqeSM
 HEJqMIjAd3oFTn9lC952thzhdXDYmH+0nWlfKnOraxe/rxxa6Ls9tvkaPVB9VA9etyVn
 /GMmP4hrxizKq139Ryo8BoMneLrwutZqx8oLcJ3qb9hDQ5n1KbNGWOoYSgG9zGfz/eYC
 gxVQgjBLIJXmUrt/fGnEEx5DJN+85SYxC04dR/BaVRQwpAeRvjqfLHg/4w8gx00UUl8E
 GxHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMCwnvv/AIvSNx3gKbb+/aGFdGndk0ojLyPkRRqSjeqWab6ciFpHKdHfauhcDyysCkrJHm5L8/6kDui+oyTlEUcH1y2MvWIQ==
X-Gm-Message-State: AOJu0YzlKUDzyzt+fRvu0ndXDhLMuyZMfI3a7mMTlg4JSRs2SVtKe+d+
 ANhiX4qJNoDy4/KeYIkhG4LWgjTiEiKb6twGmveXGjoOuHchk2MfxvVNGNFAhtA=
X-Google-Smtp-Source: AGHT+IFEPiw6NQxSQ5DKImaxfPHgQV9dQhtVZtcVO668cxiaS/gjuknMedcbFsy2vct9ZDhglflqLg==
X-Received: by 2002:a05:600c:45ca:b0:412:9051:9429 with SMTP id
 s10-20020a05600c45ca00b0041290519429mr345105wmo.26.1708710837298; 
 Fri, 23 Feb 2024 09:53:57 -0800 (PST)
Received: from [192.168.69.100] (xbn44-h02-176-184-35-109.dsl.sta.abo.bbox.fr.
 [176.184.35.109]) by smtp.gmail.com with ESMTPSA id
 fm23-20020a05600c0c1700b00412952d3cc6sm2858181wmb.7.2024.02.23.09.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 09:53:56 -0800 (PST)
Message-ID: <f5c5a0f7-c7c9-49d2-abe9-da94c6f05d19@linaro.org>
Date: Fri, 23 Feb 2024 18:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] hw/misc/xlnx-versal-trng: Check returned bool in
 trng_prop_fault_event_set()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Fan Ni <fan.ni@samsung.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
 <20240223085653.1255438-5-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240223085653.1255438-5-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 23 Feb 2024 17:54:01 -0000

On 23/2/24 09:56, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> As the comment in qapi/error, dereferencing @errp requires
> ERRP_GUARD():
> 
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> * - It must not be dereferenced, because it may be null.
> ...
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> *
> * Using it when it's not needed is safe, but please avoid cluttering
> * the source with useless code.
> 
> But in trng_prop_fault_event_set, @errp is dereferenced without
> ERRP_GUARD():
> 
> visit_type_uint32(v, name, events, errp);
> if (*errp) {
>      return;
> }
> 
> Currently, since trng_prop_fault_event_set() doesn't get the NULL @errp
> parameter as a "set" method of object property, it hasn't triggered the
> bug that dereferencing the NULL @errp.
> 
> And since visit_type_uint32() returns bool, check the returned bool
> directly instead of dereferencing @errp, then we needn't the add missing
> ERRP_GUARD().
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credit:
>   Markus: Referred his explanation about ERRP_GUARD().
> ---
> v2:
>   * Add the @errp dereference code in commit message to make review
>     easier. (Markus)
>   * Check the returned bool instead of dereferencing @errp. (Markus)
> ---
>   hw/misc/xlnx-versal-trng.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


