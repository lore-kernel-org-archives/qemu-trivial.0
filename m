Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcmP9-0007gn-8h
	for mharc-qemu-trivial@gnu.org; Thu, 16 Mar 2023 08:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcmP7-0007fA-BK
 for qemu-trivial@nongnu.org; Thu, 16 Mar 2023 08:08:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pcmP5-0003Gp-NH
 for qemu-trivial@nongnu.org; Thu, 16 Mar 2023 08:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678968498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1MyRpqu/xXm6Eb84sakJXzvy8GcchjfmR1Y4ZbgH668=;
 b=Yxloj5Ko3Ye6q3NtWjyTZBAU+btR1vv9CVUQwwnqPrDFDSc/IeOTfmBJ06Afr15K3aO8Uq
 CufOv/1rlW/YsuiQySfNGD/XRyjWQf3srcym8kF2uJ+M5JiMAqV/HBNJAh4UFUmw76kMp5
 uoCyiMQSgUmQ/IsGE/kamh4YZ4wXR50=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-Tq1HzuTlOtegbgiSzSwpJQ-1; Thu, 16 Mar 2023 08:08:17 -0400
X-MC-Unique: Tq1HzuTlOtegbgiSzSwpJQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so2737708eda.6
 for <qemu-trivial@nongnu.org>; Thu, 16 Mar 2023 05:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678968496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1MyRpqu/xXm6Eb84sakJXzvy8GcchjfmR1Y4ZbgH668=;
 b=o/JhR+cA+pEuKToEpD2TkD2YnezU678oiX43BzAfAyjxyxfgthOwxqmBmweP7n6AWU
 NTZ5lvKCPGYCejpDLZWa76Y6QnuuTBZJahpldRzL5nEm0UmQcm4guQsMWbhWC3WQKVYJ
 lpTHrpFMxA52gA75lwVc+shQVJJVKWnr2MczQVFk+1YXq+5kcNBy9GXQXegVGGdmb/VG
 GUWgyQgq1SAcfXmwXxgqv+O3qstuJ9fBrQAU8KFL5TJlvWQVsBX9nthhzEf4kK4qsZkM
 Gn2HT9tdOmxzvufFA3XcyUBp3oIjftRkjjtg1teiX2Cjqz0eWieXejviZ9rTMAF0JFI+
 3/4A==
X-Gm-Message-State: AO0yUKWVpWXYi9Qog/ViRKuUdsv1BO4CdYKUmta/l0kYSuGSr1/kUpwe
 nIWAXRk0ujmveWwDjgC8Y80imj243Rtw17NREe3r3bMq+TrORp4NPbepYVZBguAYpwVOxMR3baw
 3hW1YNnerA/V6cSTTzg==
X-Received: by 2002:a17:906:6b98:b0:8f6:ad32:cd51 with SMTP id
 l24-20020a1709066b9800b008f6ad32cd51mr10667109ejr.62.1678968496488; 
 Thu, 16 Mar 2023 05:08:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set8rivAyBncG81DkhUr356SITBvf3CcUgrvRpo5jn4ly107zTtwB0Gb4putQEoGDMjrHy9jlEw==
X-Received: by 2002:a17:906:6b98:b0:8f6:ad32:cd51 with SMTP id
 l24-20020a1709066b9800b008f6ad32cd51mr10667076ejr.62.1678968496198; 
 Thu, 16 Mar 2023 05:08:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-151.web.vodafone.de.
 [109.43.176.151]) by smtp.gmail.com with ESMTPSA id
 oy12-20020a170907104c00b00931024e96c5sm217748ejb.99.2023.03.16.05.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 05:08:15 -0700 (PDT)
Message-ID: <d755da2b-edd9-8337-1975-548c961fbe88@redhat.com>
Date: Thu, 16 Mar 2023 13:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] docs/sphinx/kerneldoc.py: Honour --enable-werror
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230314114431.1096972-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230314114431.1096972-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Mar 2023 12:08:21 -0000

On 14/03/2023 12.44, Peter Maydell wrote:
> Currently, the kerneldoc Sphinx plugin doesn't honour the
> --enable-werror configure option, so its warnings are never fatal.
> This is because although we do pass sphinx-build the -W switch, the
> warnings from kerneldoc are produced by the scripts/kernel-doc script
> directly and don't go through Sphinx's "emit a warning" function.
> 
> When --enable-werror is in effect, pass sphinx-build an extra
> argument -Dkerneldoc_werror=1.  The kerneldoc plugin can then use
> this to determine whether it should be passing the kernel-doc script
> -Werror.
> 
> We do this because there is no documented mechanism for
> a Sphinx plugin to determine whether sphinx-build was
> passed -W or not; if one is provided then we can switch to
> that at a later date:
> https://github.com/sphinx-doc/sphinx/issues/11239
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: we need to land the fix for the current outstanding
> warning before this one can go in...
> https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.bennee@linaro.org/
> ---
>   docs/meson.build         | 2 +-
>   docs/sphinx/kerneldoc.py | 5 +++++
>   2 files changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


