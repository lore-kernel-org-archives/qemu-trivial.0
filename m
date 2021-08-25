Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIu0t-0003F1-55
	for mharc-qemu-trivial@gnu.org; Wed, 25 Aug 2021 10:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIu0r-0003EY-9O
 for qemu-trivial@nongnu.org; Wed, 25 Aug 2021 10:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIu0p-0004dX-Hu
 for qemu-trivial@nongnu.org; Wed, 25 Aug 2021 10:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629902178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpIWdKvEv/5y1gxyhAAq/8mMwN9F1cpQqDt/RRYd+ok=;
 b=bO28jkWRUuqFX7qYyehh8pvpIRyZM5b41EbIcq0m1vivWohY0WWNsi/ZCT9T6hzcdfpEAl
 BwcanOmpRI6LeYzk4QTjamZ7mWBD3Hz2PWBSrTcXeGprGWgMBkqla8vEtVD+O06mYUGnW5
 X4PXwXYhQcMS/+G+75yAJopKGuDZj98=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-kce21uatNTCBIFV5kYddOA-1; Wed, 25 Aug 2021 10:36:17 -0400
X-MC-Unique: kce21uatNTCBIFV5kYddOA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m22-20020a7bca56000000b002e7508f3faeso2814078wml.2
 for <qemu-trivial@nongnu.org>; Wed, 25 Aug 2021 07:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EpIWdKvEv/5y1gxyhAAq/8mMwN9F1cpQqDt/RRYd+ok=;
 b=nRwawI4TcmMiV8VjndGj87veJGN/SerIIA30hDBJ6Ssa6V7S+cuiRFciXQTgacF0lJ
 5/mRe4RXqrLuyfBBjp/QyqlMVtp/hW1wfL1TgqN1nVplq/ah89DysSKMurk/dIbHMJmf
 QQ+RjcP9ApIWiHCGQrbo2M3Pr7fVMRH7cUKHHWHwJ3ZqERBsS8EKuvgB2WeKISgdtowI
 iTewP5G7U3Gi38wwwcBZT5rDctTJGjkEQdbVN6d/RZoHq0mghy7DHwMAJfSfJ7MMZQBK
 HT5oPARmQOvpv1FwrKA+KeAaokX+h7/IRImOgJYs2eCFq3rVzf3clV4IKKfNhDh+h7pJ
 lSRA==
X-Gm-Message-State: AOAM533epKeIcLTIxuBjekoYkmMuWy/5z4EdH/4kznL+1XE1h0KYlC/h
 tN62i4venDU2mBMTg7MHWdSZ7IDFQKC/LOwpUYdqUMQrFbE0dYmlmt9zCHZ6D2ncaluQBsmNvTY
 U5fqlvkG3H5tgNZ8l8oLpPKDz3fzo6UwrEdC3sd9EX+hSf6Ld4Kwd9/tZCY4VxQgOTdQ=
X-Received: by 2002:adf:82a8:: with SMTP id 37mr3917382wrc.123.1629902172350; 
 Wed, 25 Aug 2021 07:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1tIv6ZYNVy5MZ1Nu4o7o6He6sp1kMm9G1Rlq7nuTuqmWI7qXDR0WZ/CXMSwJOUYWC0ylkBg==
X-Received: by 2002:adf:82a8:: with SMTP id 37mr3917343wrc.123.1629902172019; 
 Wed, 25 Aug 2021 07:36:12 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z17sm116941wrh.4.2021.08.25.07.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 07:36:11 -0700 (PDT)
Subject: Re: [PATCH] scripts: Remove the "show-fixed-bugs.sh" file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20210825142143.142037-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0653e552-8939-f947-0fbb-1394ec61de30@redhat.com>
Date: Wed, 25 Aug 2021 16:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825142143.142037-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Aug 2021 14:36:21 -0000

On 8/25/21 4:21 PM, Thomas Huth wrote:
> Since we are not using Launchpad anymore, there is no more need for
> this script.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/show-fixed-bugs.sh | 91 --------------------------------------
>  1 file changed, 91 deletions(-)
>  delete mode 100755 scripts/show-fixed-bugs.sh

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


