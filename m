Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZxIS-0005W6-Jb
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 09:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZxIJ-0005U3-Qq
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 09:28:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZxIH-0004A8-Nr
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 09:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604413696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyId2X/pL5QnqyqpHKMEag2lKQ0RsBKsw1kZgPmpKL0=;
 b=NitgGtq90+gF7wgm70WUNRVwg8mRX8qrjhMedqqLKpXAKIKymL4MrkaWvhdthbnZB20+aT
 sUypwvIIBug3CSnxtALwdLICwryKHuYQjt6YrwxD3HZUABQERRnJe9UjjWeLf5CV1Hwj6B
 eeTDH1E4MJw1KIgzYUHVstgt0/HhL6Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-iByra8IvPe-zr7ALgfpzPw-1; Tue, 03 Nov 2020 09:28:15 -0500
X-MC-Unique: iByra8IvPe-zr7ALgfpzPw-1
Received: by mail-wm1-f71.google.com with SMTP id c204so4667639wmd.5
 for <qemu-trivial@nongnu.org>; Tue, 03 Nov 2020 06:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UyId2X/pL5QnqyqpHKMEag2lKQ0RsBKsw1kZgPmpKL0=;
 b=HScULMWLR/BbJSV8SB4l0Xbjyp9IQM3nCejl4GAlt4STbEOiBmMeNU/htry7c3Boea
 iOSd0hM2EcLxJH6FnexskNADMd6RKkvDrbyT7v+iqQh9MtkKmKwgUTY5fICXCx1jl8TS
 tWqoRRd8kzX3OpMVImOZBsr6D18pzltS1VdxP6y0mwGQx8xU6q7eZ4/+hAyWYGmtYU/K
 kowqSe76qp4bpTcPcPzXdFUXpNtm+EK4CgmP547X08AifkNL5CwxkAQ3eqYMxd4+o8DA
 pkNtrI5zk+ZmNLFgtTsRlm6WlevXKA/GUkwkB6rSPYsmG+mxRe2oye5cEezhllT39V0k
 ZcGA==
X-Gm-Message-State: AOAM531QORCj3A4tECjAT8PuhZY2MD7YoVg6Io/0OgwJzeyh0pAu0krX
 +ZVCnP/oMscNec0n9ZXBKiWsI36IK8IFZgr093oxlxxmJXWgHzU5BtqUZvVmHoNaHjJhLkmlhag
 MWG+Dif8v1Y3X7Nghfw==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr26217465wrv.224.1604413694014; 
 Tue, 03 Nov 2020 06:28:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfsJxm6GFa7Reif3wdVI9pBhLp8oM7vPFkBxNIGQ01AQXtbPSDi3cXNbiYxDfe91BGdyCTJA==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr26217442wrv.224.1604413693783; 
 Tue, 03 Nov 2020 06:28:13 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 130sm3416121wmd.18.2020.11.03.06.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 06:28:13 -0800 (PST)
Subject: Re: [PATCH-for-5.2 0/4] misc: Trivial format string fixes
To: Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <64132d34-dbd9-03ee-6f11-a6908df025bf@linux.vnet.ibm.com>
 <ddd49883-7c97-966b-1f62-52f39f4952ad@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e2ae5627-a55d-909b-8591-f7c0400cd57c@redhat.com>
Date: Tue, 3 Nov 2020 15:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ddd49883-7c97-966b-1f62-52f39f4952ad@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 14:28:20 -0000

On 11/3/20 3:03 PM, Dov Murik wrote:
> 
> On 03/11/2020 15:58, Dov Murik wrote:
>> On 03/11/2020 13:25, Philippe Mathieu-Daudé wrote:
>>> IIUC qemu-trivial@ doesn't queue patches during freeze,
>>>
>>> so it might be easier if patches are queued by respective
>>>
>>> subsystem maintainers.
>>>
>>>
>>>
>>> Philippe Mathieu-Daudé (4):
>>>
>>>    hw/display/cirrus_vga: Remove debugging code commented out
>>>
>>>    hw/display/cirrus_vga: Fix hexadecimal format string specifier
>>>
>>>    hw/ppc/spapr_tpm_proxy: Fix hexadecimal format string specifier
>>>
>>>    migration/ram: Fix hexadecimal format string specifier
>>>
>>>
>>>
>>>   hw/display/cirrus_vga.c | 20 +-------------------
>>>
>>>   migration/ram.c         |  2 +-
>>>
>>>   hw/ppc/trace-events     |  2 +-
>>>
>>>   3 files changed, 3 insertions(+), 21 deletions(-)
>>>
>>>
>>>
>>
>>
>> There's at least one more easy fix:
>>
>> hw/misc/trace-events:106:mos6522_get_next_irq_time(uint16_t latch,
>> int64_t d, int64_t delta) "latch=%d counter=0x%"PRId64 "
>> delta_next=0x%"PRId64

Indeed.

>>
>> but I have no idea how to test this.
>>
>> -Dov
>>
> 
> ... and one more in hw/usb/u2f-passthru.c:348 :
> 
>         error_report("%s: Bad written size (req 0x%zu, val 0x%zd)",
>                      TYPE_U2F_PASSTHRU, sizeof(host_packet), written);

'written' is signed, so this format looks correct...

> 
> Again, I have no idea how to test/trigger these areas in the code.
> 
> -Dov
> 


