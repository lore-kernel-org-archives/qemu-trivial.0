Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mFu8l-0006B4-GU
	for mharc-qemu-trivial@gnu.org; Tue, 17 Aug 2021 04:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFu8j-0006Al-NE
 for qemu-trivial@nongnu.org; Tue, 17 Aug 2021 04:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFu8f-0005q7-N3
 for qemu-trivial@nongnu.org; Tue, 17 Aug 2021 04:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629187680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnBnAzvJ/p4hX1uAzWCvMBS8Z7+pd2EHK0LpS6XAwow=;
 b=YnIEW2c5PHOccAo+nFThGmiAwI6rc+pEHm75Vcqk6M30RIwdVxhVzw3hgIAZUmkegvxkEW
 RZouc/CeWNUuGzUSz48f5SiePYlKBNyenEWKoAZ2TcoU+i6Ou6ah5OaL5sCn5+hmWQGiDD
 aFH+RFIYCgjFuyslNNY0biRNw9oxVco=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-2YkQ-9PkNfGDNZ79eN055g-1; Tue, 17 Aug 2021 04:07:58 -0400
X-MC-Unique: 2YkQ-9PkNfGDNZ79eN055g-1
Received: by mail-wr1-f71.google.com with SMTP id
 y12-20020adfee0c0000b0290154e82fef34so6310945wrn.6
 for <qemu-trivial@nongnu.org>; Tue, 17 Aug 2021 01:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RnBnAzvJ/p4hX1uAzWCvMBS8Z7+pd2EHK0LpS6XAwow=;
 b=pQJNWFjuLcayXhR2FZUIERtNSUNyoh/9YrmF2lpaCPl/SuV18NB7sOCNHYBdNBkb88
 z0MiICkNJirdmDVLJuHPKaAOmiP9LD36bvQXehOlvST2Gs+oONIq/u4KEBBhnnmLBTAa
 ccDqT6TaJUrwoE0RHpv5cjAvGpQJY7tolUumTThM/7Cu6ddLfXfglLDwcGmDvxyZQVjC
 DYcBYgFc/UPj8dM0/L7ccxboLUlnVL5XyDg0X87pRUYDodtAkAtdVDB8EwzOp+NOMtuv
 qNzToajSIocqB3UTia6vioJvijaCTRwSuCU4XjvW3j1J+BkHGBENAjj0REtPx7IAPkoL
 aXgw==
X-Gm-Message-State: AOAM531V5MtU2YQ77JsIeBwLtDWKPa0vK+LdkzTydyf9xqrrv1iSvqsW
 +noH8DJGB5WjmFm+rVXcNvEj+BCSUnsHL8zrpJFDBoSP+GdSyF2r0BNUSSzWs3JfFpOD+XxY2q5
 sj0Mtzc+aVCHn3/gDjQ==
X-Received: by 2002:adf:c006:: with SMTP id z6mr2461432wre.157.1629187677336; 
 Tue, 17 Aug 2021 01:07:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAG+xeEU8mLU0PuWS1VVnUpJYvR8rp2hWLYWLPHb6g7DGixWwadEu2XKzqVckJ3Jtbw7Hgaw==
X-Received: by 2002:adf:c006:: with SMTP id z6mr2461395wre.157.1629187677056; 
 Tue, 17 Aug 2021 01:07:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i8sm1407081wrv.70.2021.08.17.01.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 01:07:56 -0700 (PDT)
Subject: Re: [PATCH v3] vga: don't abort when adding a duplicate isa-vga device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, "Jose R. Ziviani" <jziviani@suse.de>,
 qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, kraxel@redhat.com
References: <20210816135504.9089-1-jziviani@suse.de>
 <f047a8d8-93f5-3f62-0834-c036931090d2@redhat.com>
 <cd2d673b-c9aa-1b9a-7025-9afb787f99b6@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bc835acf-7a75-3270-019b-d24b7fab3413@redhat.com>
Date: Tue, 17 Aug 2021 10:07:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cd2d673b-c9aa-1b9a-7025-9afb787f99b6@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 Aug 2021 08:08:05 -0000

On 8/17/21 9:36 AM, Mark Cave-Ayland wrote:
> On 17/08/2021 08:25, Thomas Huth wrote:
> 
>> On 16/08/2021 15.55, Jose R. Ziviani wrote:
>>> If users try to add an isa-vga device that was already registered,
>>> still in command line, qemu will crash:
>>>
>>> $ qemu-system-mips64el -M pica61 -device isa-vga
>>> RAMBlock "vga.vram" already registered, abort!
>>> Aborted (core dumped)
>>>
>>> That particular board registers the device automaticaly, so it's
>>> not obvious that a VGA device already exists. This patch changes
>>> this behavior by displaying a message and exiting without crashing.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>>> ---
>>> v2 to v3: Improved error message
>>> v1 to v2: Use error_setg instead of error_report
>>>
>>>   hw/display/vga-isa.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
>>> index 90851e730b..30d55b41c3 100644
>>> --- a/hw/display/vga-isa.c
>>> +++ b/hw/display/vga-isa.c
>>> @@ -33,6 +33,7 @@
>>>   #include "hw/loader.h"
>>>   #include "hw/qdev-properties.h"
>>>   #include "qom/object.h"
>>> +#include "qapi/error.h"
>>>   #define TYPE_ISA_VGA "isa-vga"
>>>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
>>> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev,
>>> Error **errp)
>>>       MemoryRegion *vga_io_memory;
>>>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>>> +    /*
>>> +     * make sure this device is not being added twice, if so
>>> +     * exit without crashing qemu
>>> +     */
>>> +    if (qemu_ram_block_by_name("vga.vram")) {
>>> +        error_setg(errp, "'isa-vga' device already registered");
>>> +        return;
>>> +    }
>>> +
>>>       s->global_vmstate = true;
>>>       vga_common_init(s, OBJECT(dev));
>>>       s->legacy_address_space = isa_address_space(isadev);
>>>
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Instead of checking for the presence of the vga.vram block, would it be
> better to use the standard object_resolve_path_type() method to check
> for the presence of the existing isa-vga device instead? See
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00717.html for
> how this was done for virgl.

I remembered there was a nicer way but couldn't find it.
If this patch were for 6.1, it was good enough. Now it
will be merged in 6.2, I prefer Mark's suggestion.
Jose, do you mind a v4?


