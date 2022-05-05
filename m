Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nmUzi-0007S1-8K
	for mharc-qemu-trivial@gnu.org; Thu, 05 May 2022 02:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmUzg-0007Pg-Qh
 for qemu-trivial@nongnu.org; Thu, 05 May 2022 02:29:44 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:38688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmUze-0006b7-1g
 for qemu-trivial@nongnu.org; Thu, 05 May 2022 02:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651732181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwueIcE8rn+UZ1R9CRxlkFtaza7X+UUsUVSRIty7iEg=;
 b=GL8qWz7+Ex/Alb8Y60cpwCWlRynL5V1Dwif34kqTOvqLqeWv+vbmhfVqFnR6SurwR2LaCv
 0UPuK/BXKMJLBmX/xC0VO8hIbvR9aqRxMzxf1gIGWakGe7V4+XwlCgVoZ/28nHk3eFRtdU
 A66kqBZ4ag2QXpoZqdsUdyjMRsWp8p8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-oXDyaTtFOoajK1psx8hUDw-1; Thu, 05 May 2022 02:29:31 -0400
X-MC-Unique: oXDyaTtFOoajK1psx8hUDw-1
Received: by mail-ed1-f70.google.com with SMTP id
 s24-20020a05640217d800b00425e19e7deaso1798912edy.3
 for <qemu-trivial@nongnu.org>; Wed, 04 May 2022 23:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NwueIcE8rn+UZ1R9CRxlkFtaza7X+UUsUVSRIty7iEg=;
 b=zOKrCHRLFYV4xl96kNnexb8ocFZ/U58uid06w72WXlW3IB9xIiQDxg61PCBSzpu867
 E1Y1PBlyKuYpxStdhRs/mYj5zpMTkWrkCo2ddxueiPaeRdoBK3wr+TU+6fvvFxYlSSlk
 Bpo6sD99QIy6SUT9qKuOVAN02btUvsW4TAmXzkfiMf3TxFUQ05O5/9ddfBpyO1S0H9+C
 IWm2w5H59zfybqEKxsJB7DC0kIE0neCYZQWmNsLD8c7rSgbcKhFXsCquMTtj4+hfwybG
 i6UVUDcMieRkhMnKSbwiJcWRKgb9Odvk7B64zRiBOe7qIn+9z8vSuvVSdeo4KoVhM3+w
 ntnw==
X-Gm-Message-State: AOAM53045OMbVh+guz9LXRlD26zEFPihh8RcwfJUWLdIzj3riTzlIXEC
 3m/Jm9lYYcCBkE6TXt/oejLcWZ3rq0jDyxjWCfDUw/4VOY5GtD6p4U+msLdCdOd+Nqq1PTu+jzQ
 JDQardzi+226wylhKmg==
X-Received: by 2002:a17:907:338b:b0:6f4:6e1:ed66 with SMTP id
 zj11-20020a170907338b00b006f406e1ed66mr23986343ejb.341.1651732170695; 
 Wed, 04 May 2022 23:29:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi5yHYppZN2TvI/tgcaB/YyPN7uXzuRSr+5DpDV+IAFa1ONP3cKipbW/XxJGpDHdzMRgIawg==
X-Received: by 2002:a17:907:338b:b0:6f4:6e1:ed66 with SMTP id
 zj11-20020a170907338b00b006f406e1ed66mr23986322ejb.341.1651732170397; 
 Wed, 04 May 2022 23:29:30 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-178-123.web.vodafone.de.
 [109.43.178.123]) by smtp.gmail.com with ESMTPSA id
 qx16-20020a170907b59000b006f3a8b81ff7sm391096ejc.3.2022.05.04.23.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 23:29:29 -0700 (PDT)
Message-ID: <177e1d2f-1f67-4921-a49c-413ac1488487@redhat.com>
Date: Thu, 5 May 2022 08:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] Upgrade mingw base packages
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-trivial@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220503200524.1868-1-luoyonggang@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220503200524.1868-1-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
X-List-Received-Date: Thu, 05 May 2022 06:29:45 -0000

On 03/05/2022 22.05, Yonggang Luo wrote:
> v1. upgrade both cirrus and gitlab-ci to the newest mingw base release
> 
> Yonggang Luo (2):
>    cirrus/win32: upgrade mingw base packages
>    gitlab-ci: Upgrade mingw base package.
> 
>   .cirrus.yml              | 2 +-
>   .gitlab-ci.d/windows.yml | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 

Tested-by: Thomas Huth <thuth@redhat.com>

I can take this through my next misc/testing pull request if nobody else 
wants to take it first.


