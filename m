Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0LIX-0004ZL-P5
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jan 2021 04:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LIW-0004TZ-EI
 for qemu-trivial@nongnu.org; Fri, 15 Jan 2021 04:21:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LIT-0003u7-FW
 for qemu-trivial@nongnu.org; Fri, 15 Jan 2021 04:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610702492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iy8FmWFQOgn2y1p899VQeHe7zr/hq1O6xs/p/O1P7z8=;
 b=NRzZy2HwssfSFShlX/aK32u7OvFI8lBh8a2WMA6U57gh1jZANL0JNWd43TO/XNvtoLpbZB
 7BsTVqLK0LIPbtjlGW92lyOIjvxy55aZaxYj3u1QM8AvZZq8LegU9SHbtH6FlCoCklnhfJ
 AdS99BQVP3bMCTmXVutRalKNLodbdfM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-V-5DdLzpOLWRx_HwAvT5Cw-1; Fri, 15 Jan 2021 04:21:31 -0500
X-MC-Unique: V-5DdLzpOLWRx_HwAvT5Cw-1
Received: by mail-ed1-f69.google.com with SMTP id g25so3579717edu.4
 for <qemu-trivial@nongnu.org>; Fri, 15 Jan 2021 01:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iy8FmWFQOgn2y1p899VQeHe7zr/hq1O6xs/p/O1P7z8=;
 b=I4Q9Qe/3QMT/pvi8tvaGxPjB1CnypOtZGC1WRxG7uKdz3sYspMd23YOw3VmbYoG99Z
 GmerpIKjaspsscG3UFp7bbPUIL8xARlJAbLgYWubuuyE46LL1nqooIpEiqNKnfhsucjp
 svLpUtVwh5ysmPxU2F7f5LwI2gsVdphR0E8QvKLVoifO+hGZDCg7VUCh+0QN/yWVtUAe
 a+jDEY8ab8UXS2w8kNS6pP3/0Ee8CyFLed2j+2gyNNlZscOOe8nUawszKgSqP6xQB5pl
 tV2lARd8Prkw8/BsWooPp6GLlWO1HFhPUt1d85SnrBxmh6ZZW8UXecOMPt+P5tU6xc9K
 0dKQ==
X-Gm-Message-State: AOAM533glyorkCVMGZqQQSV5Xx3j86NSEg6ICp+RlUz1Eb8jO5M0tpgs
 mNaCJIOFAu9TNdmq5CodhGjUj1ONuq1rg8oKLhemPWaOaHV+zCuzfvjuI4Q9JclnbLr4VFF/dyT
 jpUHKr22+kdi8iyft2g==
X-Received: by 2002:a17:906:77c5:: with SMTP id
 m5mr7938698ejn.424.1610702489767; 
 Fri, 15 Jan 2021 01:21:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmXkt2XFc0FUFA6PXdrv5k5+N8YeXX43dcHNkUdQyM2dp/BzaG2Nnzd96G6WtRoS09Wm9VIw==
X-Received: by 2002:a17:906:77c5:: with SMTP id
 m5mr7938692ejn.424.1610702489642; 
 Fri, 15 Jan 2021 01:21:29 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e1sm3351229edk.51.2021.01.15.01.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 01:21:29 -0800 (PST)
Subject: Re: [PATCH v2 2/7] audio: Add spaces around operator/delete redundant
 spaces
To: Zhang Han <zhanghan64@huawei.com>, kraxel@redhat.com
Cc: hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, alex.chen@huawei.com
References: <20210115012431.79533-1-zhanghan64@huawei.com>
 <20210115012431.79533-3-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <22e89cf6-937c-617f-8616-14568caf8312@redhat.com>
Date: Fri, 15 Jan 2021 10:21:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115012431.79533-3-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Fri, 15 Jan 2021 09:21:36 -0000

On 1/15/21 2:24 AM, Zhang Han wrote:
> Fix problems about spaces:
> -operator needs spaces around it, add them.
> -somespaces are redundant, remove them.
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  audio/audio_template.h | 2 +-
>  audio/coreaudio.c      | 2 +-
>  audio/dsoundaudio.c    | 2 +-
>  audio/jackaudio.c      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


