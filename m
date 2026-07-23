Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05CFC531F7
	for <qemu-trivial@archiver.kernel.org>; Thu, 23 Jul 2026 16:13:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wmw2Q-0007i6-Af; Thu, 23 Jul 2026 12:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wmw2O-0007fA-1m
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 12:12:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wmw2M-00084X-2F
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 12:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784823160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pWhu3qOg8oOBvZ9z+l+p9QVAdExRDXlYKijg9fGFw/U=;
 b=ROxH+2uc12ZKgq3NkTxWboV2YTzYC4DeedjR5EacXPCzbb2q2oMzFgnNxnKQjOjfZ/m+vJ
 nmAWI+4CGpbkEAO+zwJQx2gykAZ1zw4SQJbiMib4eh6d/SUMpVKNNhVy98LN0qseWS+jyz
 4h+eXRGdFKmROFwwQHziGMznGz2DesY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-AEMGWDxXMzymw_-WBTZrjg-1; Thu, 23 Jul 2026 12:12:39 -0400
X-MC-Unique: AEMGWDxXMzymw_-WBTZrjg-1
X-Mimecast-MFC-AGG-ID: AEMGWDxXMzymw_-WBTZrjg_1784823158
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-473ac08a6a4so730375f8f.0
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2026 09:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784823158; x=1785427958;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pWhu3qOg8oOBvZ9z+l+p9QVAdExRDXlYKijg9fGFw/U=;
 b=GCQpdyer3/KchA7heK7Q21+evbi3VdabIH5mZ37YR591k9tbaxVsBDpsuv0YBEVrCI
 jw7fP4yM2kqWTZVoNrA2YJeympT5vhF6BDK6Own5z49zPdW53lKWqZqnnIuvp2XxijJf
 69CqxRTjlbP+CU27Kxttv1MVNNV441zNkBdqtmScufZHStOqQvxTsHYMdIRiWj4Fn2Ti
 UK4vlCkqKn/l3ffi+QX1uyNatLcOew3nCVGE39+CtS5I+FB0769CWjHuV0S1bVqLuBEt
 aVvy6/kxFrJSGlBUftT8geEUNTtSYC4S5/v7nMxLicUJJTEDHcxXdNMLNyWsBroe9Fzk
 8yPw==
X-Gm-Message-State: AOJu0Yy4Ogt5V3DxtvQHqC6GFj5rjcLaYlTySHxQfYdw9r3lPEYjpeg/
 rhGs/ryuru24tDlxejNYt3fhITPM+Y95lYDEvP0ap448m+j9c317BbUB8OaWp8RDc+ur55uMfWo
 h8z/clFiBNppXYyrIaCp/WDiGJmz4dO3QXfWpTECPP1ZRKnY4FYRi7JfnFoiNDCbJKQw=
X-Gm-Gg: AR+sD109HHNmBPMnLR4ZGuEtbHO8pj1QV7EuXBU+jkk6mJXnNt942p1ounqofgKxZbJ
 ZTewHhs+8RXLGsOCsA65iIZztNn8cDI9hqB0maIrGYKDaZierpoWs3TwI9QETXhLzS3tqULsmhI
 LqHc+pGwNYaqjbVKlncVdTCEWI/IpFyil8I0xXLpPpeChPfSvmhcQZ0w6oVWFuLEHu/Nm10SDdu
 S+4x0pSmj6Wj0vL09p7N/hc2gUMkqkd5UFgWed7O0bKEi+7+9GiZdAK+9XKBjzRz6aR4vIwGBkE
 O00FMpSlkF4V7fxYFC+8dwhdq9onVayzhVNWMo9w6NTTZx7VdRb/ac/EMmpj2DWau2nSa/eH9w=
 =
X-Received: by 2002:a05:6000:2999:10b0:47f:934a:3029 with SMTP id
 ffacd0b85a97d-47f934a314dmr1634278f8f.60.1784823157808; 
 Thu, 23 Jul 2026 09:12:37 -0700 (PDT)
X-Received: by 2002:a05:6000:2999:10b0:47f:934a:3029 with SMTP id
 ffacd0b85a97d-47f934a314dmr1634247f8f.60.1784823157323; 
 Thu, 23 Jul 2026 09:12:37 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.188])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a64dsm18043165f8f.1.2026.07.23.09.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 09:12:36 -0700 (PDT)
Message-ID: <60e0eac0-ddd6-4194-8bac-60e0fb93bcce@redhat.com>
Date: Thu, 23 Jul 2026 18:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/display/vmware_vga: Don't allow guest to trigger
 long running loop in host
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20260723124432.353969-1-thuth@redhat.com>
 <23cd2e91-a7ce-4943-b0d5-0f3597e675c0@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <23cd2e91-a7ce-4943-b0d5-0f3597e675c0@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4s13QEhbsEWIc7KAlikgYULUdUR7nAMVq4SS6M61WYs_1784823158
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.951,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 23/07/2026 17.05, Michael Tokarev wrote:
> On 7/23/26 15:44, Thomas Huth wrote:
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
>>   v2: Use SVGA_MAX_WIDTH and SVGA_MAX_HEIGHT instead of an arbitrary value
>>
>>   hw/display/vmware_vga.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
>> index f6f9edfd1d9..567806f0e47 100644
>> --- a/hw/display/vmware_vga.c
>> +++ b/hw/display/vmware_vga.c
>> @@ -737,6 +737,10 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s)
>>               vmsvga_fifo_read(s);
>>               x = vmsvga_fifo_read(s);
>>               y = vmsvga_fifo_read(s);
>> +            if (x < 0 || x >= SVGA_MAX_WIDTH ||
>> +                y < 0 || y >= SVGA_MAX_HEIGHT) {
> 
> Applied to the trivial-patches tree, dropping <0 conditions here.

Please don't drop the "< 0" ! x and y are signed variables, so we should 
better check this here.

  Thanks,
   Thomas


