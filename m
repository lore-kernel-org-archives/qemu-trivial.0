Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lEyV9-0003wX-Fq
	for mharc-qemu-trivial@gnu.org; Wed, 24 Feb 2021 13:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEyV6-0003ut-Ra
 for qemu-trivial@nongnu.org; Wed, 24 Feb 2021 13:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEyV3-00037b-I5
 for qemu-trivial@nongnu.org; Wed, 24 Feb 2021 13:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614189779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NW1Hfey9S5rPsTYaOaxmDa4i/W2vMcAQBQx46eZKpy0=;
 b=MQnl+MMi5quQKt27n1cnUEFXitHtnZhk3+RXTmXqVGpMcjf91ULz22mzJ5XhqUreNs0iSI
 uQgxG3796cgDxQXOkwBGiMAzc+RXHNF8uZojhZ4YTEa3A3rQl5ZCZ7cabA9WRbAFq3y11h
 gyoWJpZeFrIBMNP+RMaOBd0cLffK7Wg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-LHI8x5rTNOKsP_SJ1S624A-1; Wed, 24 Feb 2021 13:02:49 -0500
X-MC-Unique: LHI8x5rTNOKsP_SJ1S624A-1
Received: by mail-wr1-f70.google.com with SMTP id b7so1396037wrv.7
 for <qemu-trivial@nongnu.org>; Wed, 24 Feb 2021 10:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NW1Hfey9S5rPsTYaOaxmDa4i/W2vMcAQBQx46eZKpy0=;
 b=Uv7Q5EmHEm5fvcbjnn06cTaZPYxGhzT7idQHK/Mr8LreyMLIIIIwbxwUvvy1T1R6F7
 yxktR8UWFEvNfw4uj22BtfB6RE8wnrlOFZ19gTjfh16yICIycMB8XHLZBjPdUS3vmMAb
 ic9UsaimTusOK1IzH2fGQkZccSS+L2HzDBJwEuHaJH5PFUr5PhnG12YMO4ch4pB7ynp3
 LDMdGMp1aTgImI/9HIMoyo6OqVSrXU9U5ZxRgMl9yRBpLcYrnis8/Tq5vS+b9BEiOhT0
 faaYmq9od3Sfc/rs8rSGIrrVnx814wpeZt0g8gnfsv+2C8s8Om3E+dXZGF18dHdQyYYZ
 pe9Q==
X-Gm-Message-State: AOAM531Kv2IdX18RxMZgo5E41CmCuGwPrHFq6YABhIcipZER65aqCeqy
 6wRM9coQVm2CJQ5izozt6Jd8+3ME+3qn77wWGfnifBMjKzrTeg5iJ/VT+mqsBNdhimAbE77SXMB
 1K4Tyvc1r3jeuIvBKCtnxRhJ0n0tO3QQc9mhHynoi+aPWx455l3on6WNbNrdqxjAnjyE=
X-Received: by 2002:a05:600c:4f86:: with SMTP id
 n6mr4838865wmq.22.1614189767563; 
 Wed, 24 Feb 2021 10:02:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzErC6k4ktpDRw/2PPdSvVxIz2TDEdTuJkqCrPNAM1i80yz2tzfJkzJd8iLDKixLqhDXgaqgw==
X-Received: by 2002:a05:600c:4f86:: with SMTP id
 n6mr4838802wmq.22.1614189766915; 
 Wed, 24 Feb 2021 10:02:46 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m9sm10017878wml.3.2021.02.24.10.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 10:02:46 -0800 (PST)
Subject: Re: [PATCH] meson: Only generate trace files for selected targets
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org
References: <20210224120923.3154325-1-philmd@redhat.com>
 <39cc99dd-54d5-9dd1-d66a-7947686dbada@redhat.com>
 <11b6e7ad-9ac9-45fe-ebcf-1db7e396d33a@redhat.com>
Message-ID: <0efebdee-6ff9-b242-54b2-3341a05bcaa6@redhat.com>
Date: Wed, 24 Feb 2021 19:02:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <11b6e7ad-9ac9-45fe-ebcf-1db7e396d33a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Wed, 24 Feb 2021 18:03:05 -0000

On 2/24/21 1:51 PM, Philippe Mathieu-Daudé wrote:
> On 2/24/21 1:26 PM, Paolo Bonzini wrote:
>> On 24/02/21 13:09, Philippe Mathieu-Daudé wrote:
>>> We don't need to generate trace files for targets we
>>> are not building. Restrict the the ones selected.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>   meson.build | 10 +---------
>>>   1 file changed, 1 insertion(+), 9 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 05a67c20d93..c9b0433667d 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -1826,15 +1826,6 @@
>>>     trace_events_subdirs += [
>>>       'accel/tcg',
>>>       'hw/core',
>>> -    'target/arm',
>>> -    'target/hppa',
>>> -    'target/i386',
>>> -    'target/i386/kvm',
>>> -    'target/mips',
>>> -    'target/ppc',
>>> -    'target/riscv',
>>> -    'target/s390x',
>>> -    'target/sparc',
>>>     ]
>>>   endif
>>>   @@ -2166,6 +2157,7 @@
>>>     t = target_arch[arch].apply(config_target, strict: false)
>>>     arch_srcs += t.sources()
>>>     arch_deps += t.dependencies()
>>> +  trace_events_subdirs += ['target' / arch]
>>>       target_common = common_ss.apply(config_target, strict: false)
>>>     objects = common_all.extract_objects(target_common.sources())
>>>
>>
>> Is this still okay if there is no trace-events file for a given arch?

No, it is *not* Okay :>

> 
> No problem in my usual build configs, but I kicked a CI build to check
> the all of them and be sure.


