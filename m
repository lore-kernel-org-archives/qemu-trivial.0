Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZyTy-0001qH-9b
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 10:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZyTx-0001nx-36
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 10:44:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZyTv-0005Hu-4m
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 10:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604418262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9wU6jXtojgCGzepSQEAMEulAbfCvMjM+UoWLRSvWxA=;
 b=WbLrjaN3yOa0K3Q5onJjbfnGsdrVi6QsFlylK6sIuEiZ4PkR8UmlwVsUU5uIQJ+yWBK4su
 6NyBEFwiYiNTkXGcM4DMZVctVercArVowq362aTSyGyClJJNspEwOluCxE2qeRGgfjGdg5
 TsbXiw1i+9wEefXJg8oH7QDnnJ04JmY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-LjP3xGilP_izxx4YX1oRmg-1; Tue, 03 Nov 2020 10:44:18 -0500
X-MC-Unique: LjP3xGilP_izxx4YX1oRmg-1
Received: by mail-wr1-f71.google.com with SMTP id i1so7941286wrb.18
 for <qemu-trivial@nongnu.org>; Tue, 03 Nov 2020 07:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O9wU6jXtojgCGzepSQEAMEulAbfCvMjM+UoWLRSvWxA=;
 b=ctWDXOB67NsoSJb51cN0mNBwS5YoIXQis3AlLFoOHIgaEulQ/VPAddEmb3mz+36HOH
 izyL9MFDS5asgVI64Cp15M7Uk+GKDFEDHeJvcmI0E9LVExGLd3SkOAXqq2+CiRnCjGN0
 zpNxDR4c/YLl23UoSyGtS3CCDIVpKNZqJUEC9b+60t/gDrRkCFtE8+lSsTgP8nmOt3OU
 EFrcTxd+gJYBVyWt2SiWcYqc/2T1pEPhclyMZEMRc2jh7/bC8rfTWhTAEKTOn4PMLury
 pKJ7cS+uaxDm+erzZuUFjx6myYees7zdosJwzSufCcdW0KRcdp6jS08Fpf/b9otGs0kv
 gKgg==
X-Gm-Message-State: AOAM5328lJa4swbQIOsI8GgjsHPprdjmplsGlX+MuzCkZhUvDbr5ov7W
 uiBRv/izqIyiv8JoQf23pNbTQ+nK48JpCyuqO8WZDBNQKzqrXAoKxZ1w90zIc89LQ+5viYJWpvj
 7I6yVykptOJGh7n4c9A==
X-Received: by 2002:adf:f185:: with SMTP id h5mr11651839wro.10.1604418257345; 
 Tue, 03 Nov 2020 07:44:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQyQ6HbmW0+k+anQppU/qwc9xv3BdNaa8qi7qDZIBg/ucloGokYhjSJ23HFGYxIGuX5OecOg==
X-Received: by 2002:adf:f185:: with SMTP id h5mr11651819wro.10.1604418257158; 
 Tue, 03 Nov 2020 07:44:17 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a128sm2353484wmf.5.2020.11.03.07.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 07:44:16 -0800 (PST)
Subject: Re: [PATCH-for-5.2 0/4] misc: Trivial format string fixes
To: Greg Kurz <groug@kaod.org>
Cc: Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <64132d34-dbd9-03ee-6f11-a6908df025bf@linux.vnet.ibm.com>
 <ddd49883-7c97-966b-1f62-52f39f4952ad@linux.vnet.ibm.com>
 <e2ae5627-a55d-909b-8591-f7c0400cd57c@redhat.com>
 <20201103162019.299112a8@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <67d34e6c-3f4e-4e17-a850-c16a75305c84@redhat.com>
Date: Tue, 3 Nov 2020 16:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103162019.299112a8@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 15:44:25 -0000

On 11/3/20 4:20 PM, Greg Kurz wrote:
> On Tue, 3 Nov 2020 15:28:11 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 11/3/20 3:03 PM, Dov Murik wrote:
>>>
>>> On 03/11/2020 15:58, Dov Murik wrote:
>>>> On 03/11/2020 13:25, Philippe Mathieu-Daudé wrote:
>>>>> IIUC qemu-trivial@ doesn't queue patches during freeze,
>>>>>
>>>>> so it might be easier if patches are queued by respective
>>>>>
>>>>> subsystem maintainers.
>>>>>
>>>>>
>>>>>
>>>>> Philippe Mathieu-Daudé (4):
>>>>>
>>>>>    hw/display/cirrus_vga: Remove debugging code commented out
>>>>>
>>>>>    hw/display/cirrus_vga: Fix hexadecimal format string specifier
>>>>>
>>>>>    hw/ppc/spapr_tpm_proxy: Fix hexadecimal format string specifier
>>>>>
>>>>>    migration/ram: Fix hexadecimal format string specifier
>>>>>
>>>>>
>>>>>
>>>>>   hw/display/cirrus_vga.c | 20 +-------------------
>>>>>
>>>>>   migration/ram.c         |  2 +-
>>>>>
>>>>>   hw/ppc/trace-events     |  2 +-
>>>>>
>>>>>   3 files changed, 3 insertions(+), 21 deletions(-)
>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>> There's at least one more easy fix:
>>>>
>>>> hw/misc/trace-events:106:mos6522_get_next_irq_time(uint16_t latch,
>>>> int64_t d, int64_t delta) "latch=%d counter=0x%"PRId64 "
>>>> delta_next=0x%"PRId64
>>
>> Indeed.
>>
>>>>
>>>> but I have no idea how to test this.
>>>>
>>>> -Dov
>>>>
>>>
>>> ... and one more in hw/usb/u2f-passthru.c:348 :
>>>
>>>         error_report("%s: Bad written size (req 0x%zu, val 0x%zd)",
>>>                      TYPE_U2F_PASSTHRU, sizeof(host_packet), written);
>>
>> 'written' is signed, so this format looks correct...
>>
> 
> Irrespective of the sign, u and d shouldn't be used behind 0x 

Ah yes you are right =) Long day... So '0x%zx' in both cases.

> 
>>>
>>> Again, I have no idea how to test/trigger these areas in the code.
>>>
>>> -Dov
>>>
>>
>>
> 


