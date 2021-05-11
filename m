Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgMvv-0005fg-Ad
	for mharc-qemu-trivial@gnu.org; Tue, 11 May 2021 03:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgMvt-0005V2-9T
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 03:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgMvq-0002z3-6f
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 03:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620718553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaUc9MabN98oyPiqjs5tZtqzQRlr4+x2sdK9Z5D4euU=;
 b=WeHLAb423qKvd0nlVtljZwVAHyJphOuZ0DT22wynNPv5OgVghELZJkJFScv4r2cra19/rb
 tZ3NTYIblKr18tV8MfX6RhS017X+v2r4SHOVY6HX20fqmkbuZ6MkwjG0zBdCmIJCFRF2FF
 fyt7qz30ICIiApuwzdLQascS7LJqCb8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-n06prGuLP7uyPAkl_dxQ0g-1; Tue, 11 May 2021 03:35:51 -0400
X-MC-Unique: n06prGuLP7uyPAkl_dxQ0g-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso8365699wrf.11
 for <qemu-trivial@nongnu.org>; Tue, 11 May 2021 00:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WaUc9MabN98oyPiqjs5tZtqzQRlr4+x2sdK9Z5D4euU=;
 b=pZf+IoM8/cqQFgy4mSW/2Cxa/e66o0rYxzTd7WSIhIiXM8mPvGUPRiRN0oYIwDMLfd
 TCKzH8O/JjusEAAqmS4ycXhdIVarx8XKlCGYpxwIuGsavPCp4wBskLlpesVV01cbKUye
 D2N0QPhiPEIC8OOzuoyK++Fovo6taO32lfhgBb+xHNe2x0IGMVzmzk16+r9Gl9pQnGkK
 WYniHucy+1Gv9OzGaf9WeEyjibft8bY4+oxwmC/LJrIRn16j60E2X6pNsY7UMP+DZ0th
 eFxq9h3/wuibbq3X7xjNOpmQsVfwTjjpEFXj1Y6mJeR2kWJ2NOV4WEx3bJOkejbEaGf3
 eWZA==
X-Gm-Message-State: AOAM533Cs1aLGyfixoNVk3swbsx1RygzqtkafDBctf1C00Li2vSfHwfX
 9WTb+MslxyXc6Urn1UCbNHwHwI0JpFUFium2z0QsNybLxIEVkGpewvncYFh04x7dK7i/zcZyTik
 I2GjI24nAzC6iB0rdTw==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr31917027wmj.48.1620718550314; 
 Tue, 11 May 2021 00:35:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb8cBIT7cKCm9UeZMXCmn9Fwx2CPIbCy39YioFipcRVSODHcrkLfSx0VWC+BgksxowHkwdDg==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr31917001wmj.48.1620718550101; 
 Tue, 11 May 2021 00:35:50 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y2sm2857657wmq.45.2021.05.11.00.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 00:35:49 -0700 (PDT)
Subject: Re: [PATCH 0/2] [RESEND] SEV firmware error list touchups
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
References: <20210430134830.254741-1-ckuehl@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4988c9d5-27e4-62ce-6f4b-96c3ca2de4d5@redhat.com>
Date: Tue, 11 May 2021 09:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430134830.254741-1-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 11 May 2021 07:35:57 -0000

Cc'ing qemu-trivial@

On 4/30/21 3:48 PM, Connor Kuehl wrote:
> Connor Kuehl (2):
>   sev: use explicit indices for mapping firmware error codes to strings
>   sev: add missing firmware error conditions
> 
>  target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 


