Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZlpR-0006s4-7X
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 21:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZlpO-0006p3-Tv
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 21:13:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZlpM-0004HL-Se
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 21:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604369619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uhxatJpu1OagIjqsClnDPiw5oxNIW109bQJVj/nybo=;
 b=TwJEdmLe0xIxvVA8E1NApRHi/k3LjN7wVPaTb/D5V/vxYStem1K7GBiVtrEM47kDKYCGcJ
 lgGokZ8LFBBgemSL+R5fyVZ2u9e3uZDrcsSis3NQXNUUFFWCptzSUy1U6wIu5huNdxiVzc
 xtaDOrTn32YQ4Aqa7+zFHx5TdG9v9P4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-ucMm1dPQOU2jzHO1EGtRSQ-1; Mon, 02 Nov 2020 21:13:38 -0500
X-MC-Unique: ucMm1dPQOU2jzHO1EGtRSQ-1
Received: by mail-wr1-f69.google.com with SMTP id 11so6110866wrc.3
 for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2020 18:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2uhxatJpu1OagIjqsClnDPiw5oxNIW109bQJVj/nybo=;
 b=rWFR8Ne0thYGrzp8g7mGM/nzL8mfpGpIAV5imrtqq7KsAhGh9yqOWE/mc8HGlo0DKr
 EEFO8ziz/pkJ3deawYSCChu/Nw6u5o3JXrCm2P8u+E/Pr046GvwRLz5RCCfZ2yOpbkio
 8OGzfcEZlI+K5PWYT1SDTaeISml7o9w/der8mBeXR6l5NqDzWvnZPoIpIkgXVVqDI913
 6mJ2kD5QgsdNH6acECetXcffbGoDkbJw/Og1pYeIlvhUHtvTkgnsObxF7a6n5YsG7NLq
 s/ES2THrDyNemKVR/r8YXroXWpn2y4+Ohe6mwlceI/vk5CsTqsdBmdXYFtiGNmJh+MeD
 xvJQ==
X-Gm-Message-State: AOAM532nDGQNfxnmRVQTuLIQd1wZm7WiY68X6L49CSDlDHnkx7OiSmWm
 69Yxmcx/EOV1lYtmSGD62B7WdpCRQ+QmSntHJm0+B1TPflcLHQ3C0/WsbXiySlaRgROf9Ji8pOf
 +skpBPENQvZtszts4sQ==
X-Received: by 2002:a1c:9916:: with SMTP id b22mr992149wme.105.1604369617314; 
 Mon, 02 Nov 2020 18:13:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxtVGs5GWJcuEwd5W2DlyX/BauNPqfTL7BAuB/5luYXHIblrbohUFLZrfwcsngLQAm9CONRg==
X-Received: by 2002:a1c:9916:: with SMTP id b22mr992129wme.105.1604369617141; 
 Mon, 02 Nov 2020 18:13:37 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t23sm1274051wmn.13.2020.11.02.18.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 18:13:36 -0800 (PST)
Subject: Re: [PATCH 3/6] util/qemu-timer: fix uninitialized variable warning
 in timer_mod_anticipate_ns()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, zhang.zhanghailiang@huawei.com,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>
References: <20201103015228.2250547-1-kuhn.chenqun@huawei.com>
 <20201103015228.2250547-4-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <37670ee4-d758-0da7-5e2d-b3429e856360@redhat.com>
Date: Tue, 3 Nov 2020 03:13:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103015228.2250547-4-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 02:13:44 -0000

On 11/3/20 2:52 AM, Chen Qun wrote:
> After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
>  that the statements in the macro must be executed. As a result, some variables
>  assignment statements in the macro may be considered as unexecuted by the compiler.
> 
> The compiler showed warning:
> util/qemu-timer.c: In function ‘timer_mod_anticipate_ns’:
> util/qemu-timer.c:474:8: warning: ‘rearm’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>   474 |     if (rearm) {
>       |        ^
> 
> Change the default value assignment place to prevented the warning.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-timer.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


