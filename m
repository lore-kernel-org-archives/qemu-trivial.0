Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqVK6-00018I-Qj
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jun 2021 02:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVK4-00012d-RN
 for qemu-trivial@nongnu.org; Tue, 08 Jun 2021 02:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqVK3-0002Lm-5o
 for qemu-trivial@nongnu.org; Tue, 08 Jun 2021 02:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623134086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9t+//wXTlgop/Z03yZFjOGzC5k4x/poh5TNc11yD0h8=;
 b=If8wwriIpCjP+hbRKrkFwuM0q6I3j1PwpfUEkO0a5tSEjU35sOGx71DyG/FHOEeySWgTft
 e2ZTGBUEPc6PtgmoJd/4j7/5bVpyYtHBWy7kTCNANHiwCT2AFBJMciulPM9kIRb+/lcLHv
 FJ/RCaxip4awfXhd5q7p3WZW3ev3DSw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-7TfzTNqQMHyYzgxc-2SGgw-1; Tue, 08 Jun 2021 02:34:45 -0400
X-MC-Unique: 7TfzTNqQMHyYzgxc-2SGgw-1
Received: by mail-wr1-f71.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so8880602wre.9
 for <qemu-trivial@nongnu.org>; Mon, 07 Jun 2021 23:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9t+//wXTlgop/Z03yZFjOGzC5k4x/poh5TNc11yD0h8=;
 b=d5z27Pzzy9zAJXzBnhb8cuMZKaUgpVDKHosTHIe+hbzMjfE6yKbtUfP7ZSqCLwHmVO
 jxFMn32FXzdMdZAzQfnKGwEPFZWZiF9O5IY1upwUNdIx+Lw/rPeEbf3TE1KvwiPqQqnR
 QpswqEuuPCI7r9X0I4yN72La3I3i9c2GB8D/LiRKZVETMevo1/XyDROZTx6e8QXF+gKe
 h7oHkfmxLmZYqy/R/jRLDwwF9qdIN6JPPdDr+2/UgLGEgtn1kAJrrnyweEbN4rSgmDKn
 ux9LVCDEtWMSffItyQ/si3v/ySl91JsQBga538ZwfQrc8WUDL3pyFRmjoGnNpg8oonTs
 bHrw==
X-Gm-Message-State: AOAM5322bQEZlr7fpuSttNv2heQMWZJMrEwVMkMuy42Pt5gydAsxJOI8
 XvOL+5dC5H9vOyo/XwcJNFs+gis2maiQ+aTlpr5MdKUwdG3we+Yt1r5ZG56MhTPQCXnTMyznsUK
 J0g/9j5HYd+Zzuk3+HQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr2463300wmg.19.1623134084195; 
 Mon, 07 Jun 2021 23:34:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBSjWECOFuVscr5fW4hRXciQIRtW9NS5XHTioNbWNrcqSyT5TvUHjFC2sNqCupNcGqS0Zuew==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr2463290wmg.19.1623134084087; 
 Mon, 07 Jun 2021 23:34:44 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id y189sm17215966wmy.25.2021.06.07.23.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 23:34:43 -0700 (PDT)
Subject: Re: [PATCH] docs/interop/live-block-operations: Do not hard-code the
 QEMU binary name
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
References: <20210607172311.915385-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0094f2fa-5925-4706-dfa8-8771fae74cf4@redhat.com>
Date: Tue, 8 Jun 2021 08:34:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607172311.915385-1-thuth@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
X-List-Received-Date: Tue, 08 Jun 2021 06:34:49 -0000

On 6/7/21 7:23 PM, Thomas Huth wrote:
> In downstream, we want to use a different name for the QEMU binary,
> and some people might also use the docs for non-x86 binaries, that's
> why we already created the |qemu_system| placeholder in the past.
> Use it now in the live-block-operations doc, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/interop/live-block-operations.rst | 32 +++++++++++++++-----------
>  1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


