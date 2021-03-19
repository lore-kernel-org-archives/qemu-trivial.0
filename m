Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNCFH-0000mT-KS
	for mharc-qemu-trivial@gnu.org; Fri, 19 Mar 2021 06:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCFG-0000kL-4j
 for qemu-trivial@nongnu.org; Fri, 19 Mar 2021 06:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNCFE-0004AH-Ai
 for qemu-trivial@nongnu.org; Fri, 19 Mar 2021 06:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616149239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XZsqKC2A1isL0XieiFn6aQ5W5Ly1ACo/T3Nfs4k1+A=;
 b=awbFpaL1HB2CZS/5U1ifKGGBBS4mQ/weU8srH9w8BGSsN1nXmP47J2uLTOo4iiPRzZ/RIO
 YfXjfsxQIOO3r1yYilEF7Loy/53LooVS6yrE6EBiyeFFMS12+G9zIyoh/Xkdf/HuaXDYl9
 ZZ0ljY966hWN9O7NBBCPvW1F1j0Umoo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-Se27hArJMbqQbdr0G6zcbQ-1; Fri, 19 Mar 2021 06:20:37 -0400
X-MC-Unique: Se27hArJMbqQbdr0G6zcbQ-1
Received: by mail-wm1-f70.google.com with SMTP id v5so12712323wml.9
 for <qemu-trivial@nongnu.org>; Fri, 19 Mar 2021 03:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6XZsqKC2A1isL0XieiFn6aQ5W5Ly1ACo/T3Nfs4k1+A=;
 b=Wv8duuDMiKLUHEmSuYK6pdytor4n4XkHSuXiOSdLRcN+pZyrf2IYFWGXyBGpxzAqFy
 cKDcKDSJhb5CKR5SaxIUc3LiNKh7Go47UG5bbSpjfSQbBGzlp26n0338+H0v9ltyJWgl
 xzAsQbCzMMgIO2beIfJ2dDZtPFcWqeIBMQA28qBD0xGKcswGz4/4AtLFI6JuUiaGBqtn
 MIlDFTvD1/7b8PExFHfPCNYYvInH+t+ncO7mhRxhLRGszJ1B9bl39z4ZR2wvFK2OpXLr
 UNGCduXcXw/sJMofwOreNoeYn6BtmxT+noDKZfwy0pX3DvZxPvetpxs/kIVfZQOlhi1H
 MNfQ==
X-Gm-Message-State: AOAM532K43AH2JJEyZxHZ2gbFZn4SHrGiec/+wOkv1ReIJtHx4IhqxoL
 +qrvRTnhc5htiJ3WWlmhwRgFq613vyd3lnEDPcvZc2gDvEazoM8BvVD0ZLLs0x6fNY9Ez+Ik/4c
 AXKCX4qjdddAc9kj496R4ujJTJc26qHIgopEtaGdsKd5FyHeRyoxUSxbfMBT0ZXFIZ/8=
X-Received: by 2002:adf:84e6:: with SMTP id 93mr3553960wrg.376.1616149236318; 
 Fri, 19 Mar 2021 03:20:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymMyFv1nLPKKgJsyI2a41RhjqALiyWL4YtRprK548FB+S+ZSOQav0bvrK+0AUQPoPLVrPB3g==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr3553935wrg.376.1616149236172; 
 Fri, 19 Mar 2021 03:20:36 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 91sm7743231wrl.20.2021.03.19.03.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 03:20:35 -0700 (PDT)
Subject: Re: [PATCH v2] MAINTAINERS: Fix tests/migration maintainers
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
Cc: Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <842e7cbd-a444-04ac-35d5-168c6415441e@redhat.com>
Date: Fri, 19 Mar 2021 11:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Fri, 19 Mar 2021 10:20:42 -0000

On 3/19/21 9:07 AM, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> when executing the following scripts, it throw error message:
> $ ./scripts/get_maintainer.pl -f tests/migration/guestperf.py
> get_maintainer.pl: No maintainers found, printing recent contributors.
> get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
> 
> add the tests/migration to the "Migration" section of MAINTAINERS
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


