Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kf2yJ-00032F-8a
	for mharc-qemu-trivial@gnu.org; Tue, 17 Nov 2020 10:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf2yH-0002yl-AM
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 10:32:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf2yA-0004jl-0t
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 10:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605627153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skD+vE39++X7ruMC2CTEt06xSV+4zvbwGDq/R0H53so=;
 b=DWf+JvlHt6rW4C2UraAr+0lxnTGMJTG2pnNT+DR5E+TeYLc11sWcKW++FZXcdPbgcjZMhd
 Ss219K5QYckLzjMVL+9erlA5JKLqb7ohrQ2V9Qctjsb5okcdB2uqjpM4cnlziJ9aMVARSn
 qQI+LdTUvZ0ChA7ktxj3SN2hIRU0r80=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-hl7-tEr8NlOeWHoUq052kQ-1; Tue, 17 Nov 2020 10:32:29 -0500
X-MC-Unique: hl7-tEr8NlOeWHoUq052kQ-1
Received: by mail-wr1-f69.google.com with SMTP id x16so8452598wrn.9
 for <qemu-trivial@nongnu.org>; Tue, 17 Nov 2020 07:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=skD+vE39++X7ruMC2CTEt06xSV+4zvbwGDq/R0H53so=;
 b=KW4dAuQA1Q3bi9cLjH89RC75lXpb1aHQWjORfmYLQFfa6LSRk56kykRS+E8O3gz76Q
 Yq9XTozqQw1Euxfd65MdjGIJpugUB7IMg9nq/LZsO3XinkmHVNlnfEnZhRZGjoQLx1EH
 DmVCZWvnOcgw/igf30GMB/K47OkOIpx/Jn36hVok6r6FPm6/U/OivYyssp6NttCWjCF1
 7paSCYoOiiYI/X/b/HLAiyXON0V9mUoEcuWXDZOPKAzYDasJ6t9Y7pCUHk9ScohFTRk4
 akdLABIhRj7CbRYxXnb0dbKFZQTjh9i4cnMPhUh8N+arlv3XmdBMIGB88EvcToc55e4q
 SiOg==
X-Gm-Message-State: AOAM531N/8tJq3HKut+ctRlpm5sLlwOzU7/WLgPRuz74YYaOpt6PaQJO
 xPTOAlB57jZvpoUuYbK18xYD/C7n/f+uRDhmtdpYUzLMNJ2G0khMHClmr1gcUmLKInS2qDLX7/U
 /ZIgaK/u7C5o91+OaL6EEGYNzn8ZsCicpji5svPmb88JbfeKK4DZxhoGvZaO+J1K+vxA=
X-Received: by 2002:a05:6000:1d2:: with SMTP id
 t18mr110364wrx.14.1605627148385; 
 Tue, 17 Nov 2020 07:32:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZY5nhnPjhDh6okNpB6WRWxirpcugnHQw8YIDTOtOA0rZTarFC5fDTpVZY9t28xJXrl/Vc/Q==
X-Received: by 2002:a05:6000:1d2:: with SMTP id
 t18mr110331wrx.14.1605627148000; 
 Tue, 17 Nov 2020 07:32:28 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id x2sm22430720wru.44.2020.11.17.07.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 07:32:27 -0800 (PST)
Subject: Re: [PATCH] buildsys: Help git-diff adding .gitattributes config file
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20201014082209.3712625-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ee718c8-6f4e-fb90-5e52-7818d5db8bce@redhat.com>
Date: Tue, 17 Nov 2020 16:32:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201014082209.3712625-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 17 Nov 2020 15:32:41 -0000

ping?

On 10/14/20 10:22 AM, Philippe Mathieu-Daudé wrote:
> Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
> and 139c1837db7 ("meson: rename included C source files to .c.inc")
> 'git-diff --function-context' stopped displaying C function context
> correctly.
> We can help git-diff by providing attributes to the .[ch].inc path
> names. See:
> https://git-scm.com/docs/gitattributes#_generating_diff_text
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitattributes | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 .gitattributes
> 
> diff --git a/.gitattributes b/.gitattributes
> new file mode 100644
> index 00000000000..3d2fe2ecda8
> --- /dev/null
> +++ b/.gitattributes
> @@ -0,0 +1,2 @@
> +*.c.inc         diff=c
> +*.h.inc         diff=c
> 


