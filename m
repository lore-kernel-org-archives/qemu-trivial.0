Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22003C531CA
	for <qemu-trivial@archiver.kernel.org>; Thu, 23 Jul 2026 12:36:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wmsek-00077o-IZ; Thu, 23 Jul 2026 08:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wmsei-00071I-GA
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 08:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wmsef-0008DR-Vp
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 08:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784810160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BVau9WPUbYxRVA7cZE5d3C4eyjM7GlceSeM3jGravfw=;
 b=dEBzIVLgXGSADSIsoJkZIMS/dfyX+witKHBitaK+QyDDFH/KRDhiKjawBVEXaa5ioM4uV0
 1QWJf24zdLvLkMAqF0JNgsvyAY0qc0fACRFH4h5z3qr/30QQnBYxv0ggvBerzDrS4fQ5+1
 m9ebvL7pRNh8zc1cBKdgtEfb5QCeFjE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-k7iuVZAHNdmCJdGD1fWnGg-1; Thu, 23 Jul 2026 08:35:56 -0400
X-MC-Unique: k7iuVZAHNdmCJdGD1fWnGg-1
X-Mimecast-MFC-AGG-ID: k7iuVZAHNdmCJdGD1fWnGg_1784810156
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-47407691804so485053f8f.1
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2026 05:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784810155; x=1785414955;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BVau9WPUbYxRVA7cZE5d3C4eyjM7GlceSeM3jGravfw=;
 b=GrBBhZU3gxh5uD5K5UFMvyP8Pxlm+3RcLapXNxiwAPnj37z1Qp5mJAHf6mtvpmKPEL
 VbPIqMSYXr2MEDZzqoSqPrKHqFnZ+Lu0r6ofFcVrYHB1zBZKpWr6PjUhw0I0zExuV80L
 ITNCP2Bw2mX4DxmkOhwUCMw818ITOpBad8y8BeE2eCsiuTW5sNGFPZmB8MrG3/Rc0vVn
 lI5aGmwmUmpmCD34hPb8JzCFTNJew2L7Off4AcxYxfyMJCHILZ/mrUVnOOIhWTnOhpoF
 zY//QViISNQb/jwUu0byGEvZUo7OStZiiiS/tU1Mm+gWwhTDtVhq3BaqEScGoi4Bquz1
 NviQ==
X-Gm-Message-State: AOJu0YxD4qSpNIvAVQXb1ZRH9WZKCtpwMW2bOY1T91OWvQa1ufbJ0u6M
 2a5WGfMkEC8MQRG3Acuf0K/hZeFzOe2MCc6UVwLVjcJ+Bc8e/tphR1SjG6578iDGGCkzt7ZdjV8
 u+gNIVDl0RC+YE9OeDded2TMseQKPklMeA2ZLHF1PV4lK2OuevfdLBaxb44I=
X-Gm-Gg: AR+sD13HX0XFwjvb46W6sOk/95KQx4Ut4pIhUbeZFEQgZkNmbCVagKlCIx1VCQ6hut2
 xD/H6o8IHGF36gQ9ilr6669UjgRqhionLda9NG8zXuyS5YxTxoFdsiNKwTXqFZDV6P6risCbcXQ
 x5m2inKG9hVF+wMyMWhPrAD9O+3vQ8MsxDD+tGc+us5GqrgM59lCONlI3Z1/qiLqkPQ76oYjTNT
 5gbdQApn6B56wNrRGYkvGFNMsAKiIRR0FwuGV21ELtH3o7eoBwPF5zZhBdbrwS5GTOc86ApMqgp
 mxSWC3zoABbO2g0u7D3ZmmK7ngUhQ0n1nf1RO3CWMektpeJk/9xLO72bFUklqERC2CTKhQBnIw=
 =
X-Received: by 2002:a05:6000:2904:b0:46e:624e:3c2f with SMTP id
 ffacd0b85a97d-47f8dc8565cmr3547022f8f.47.1784810155533; 
 Thu, 23 Jul 2026 05:35:55 -0700 (PDT)
X-Received: by 2002:a05:6000:2904:b0:46e:624e:3c2f with SMTP id
 ffacd0b85a97d-47f8dc8565cmr3546990f8f.47.1784810155110; 
 Thu, 23 Jul 2026 05:35:55 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.188])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f8635c8d7sm14097799f8f.21.2026.07.23.05.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 05:35:53 -0700 (PDT)
Message-ID: <a4e46837-e55a-4f9f-8ad5-03f490e39cf8@redhat.com>
Date: Thu, 23 Jul 2026 14:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/vmware_vga: Don't allow guest to trigger long
 running loop in host
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20260723120020.330089-1-thuth@redhat.com>
 <d934b1b8-d639-420c-9974-f728fb752bbd@oss.qualcomm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <d934b1b8-d639-420c-9974-f728fb752bbd@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W6gBS3MzKCOltwkN4x_p3RDC7RSkz2d4MbgNzPRJZ9o_1784810156
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=thuth@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.951,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 23/07/2026 14.27, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 23/7/26 14:00, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> The code in the SVGA_CMD_DEFINE_ALPHA_CURSOR handler in vmsvga_fifo_run()
>> basically does:
>>
>>              x = vmsvga_fifo_read(s);
>>              y = vmsvga_fifo_read(s);
>>              args = x * y;
>>              goto badcmd;
>>              ...
>> badcmd:
>>              len -= args;
>>              if (len < 0) {
>>                  goto rewind;
>>              }
>>              while (args--) {
>>                  vmsvga_fifo_read(s);
>>              }
>>
>> Thus by supplying huge values for x and y that overflow the result of
>> the multiplication, the guest can trigger a long-running loop here
>> that burns the host's CPU cycles.
>>
>> Add some sanity checks so that this cannot happen anymore.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3782
>> Reported-by: Feifan Qian <bea1e@proton.me>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4026
>> Reported-by: Tristan Madani <tristan@talencesecurity.com>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4076
>> Reported-by: Sunday Jiang
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/display/vmware_vga.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
>> index f6f9edfd1d9..04cc438cc02 100644
>> --- a/hw/display/vmware_vga.c
>> +++ b/hw/display/vmware_vga.c
>> @@ -737,6 +737,9 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s)
>>               vmsvga_fifo_read(s);
>>               x = vmsvga_fifo_read(s);
>>               y = vmsvga_fifo_read(s);
>> +            if (x < 0 || x >= 32768 || y < 0 || y >= 32768) {
> 
> Maybe add a self-decribing definition instead of magic number?
> 
>    #define ALPHA_CURSOR_SAFE_LIMIT 32768 /* Arbitrary limit */
> 
> Otherwise LGTM.

There is already this in the code:

#define SVGA_MAX_WIDTH                  2368
#define SVGA_MAX_HEIGHT                 1770

Shall I use those? WDYT?

  Thomas

>> +                goto rewind;
>> +            }
>>               args = x * y;
>>               goto badcmd;
>>           case SVGA_CMD_RECT_ROP_FILL:
>> @@ -776,7 +779,7 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s)
>>               if (len < 0) {
>>                   goto rewind;
>>               }
>> -            while (args--) {
>> +            while (args-- > 0) {
>>                   vmsvga_fifo_read(s);
>>               }
>>               printf("%s: Unknown command 0x%02x in SVGA command FIFO\n",
> 


