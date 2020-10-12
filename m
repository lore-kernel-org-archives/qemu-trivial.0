Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRynR-00043u-2X
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 10:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRynO-00040G-Lw
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 10:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRyn8-00064n-SP
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 10:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602512830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vo+2idY1iOLKCcCi+5C1utcyJaMx4cV6n4V4S3DSJYU=;
 b=gEyN4fhcoSgBiCFnWtNoPwi7KMe5cwhl3rOmpeIxPhTI9hh2ie19OZORG2vDyEICYyy/uj
 Bv0Q26bx/GZb1EpDrT/NcBstExZ2eAeJydgks+MD7FrV2CQ3PFRv5nWd4KcC4/y9e3In7R
 ko3arGOkhQKzb5wxtPugrloBlUpZq7E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-Zh_sAZOZNGuX2N_DTiD1YQ-1; Mon, 12 Oct 2020 10:27:07 -0400
X-MC-Unique: Zh_sAZOZNGuX2N_DTiD1YQ-1
Received: by mail-wm1-f72.google.com with SMTP id 65so283614wmz.1
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2020 07:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vo+2idY1iOLKCcCi+5C1utcyJaMx4cV6n4V4S3DSJYU=;
 b=R/5HVefA7Im03byaUc2ReMqeq6NMWfu/wbWDc8Uxcz1Ha9OyOReWfJnlSaJ4aLIn4t
 7p4P14u9Cwr/zD8YW0pBr9GKHJLvoTtUJv/eKNuCkAJyOOBLgUyu+K1lrXOT1MY12hhw
 as2gi+PEYiJ/Jsf9KwPonbGAbePiAIDDYHGo1jm4P/Mkj22NyriUB2rpX5mdiXYLgvEG
 x97uRrQL1XWOVMcjJj22Cxw7fqFcLin0b8P16oPoF45CqthFbCm+Xr+CAzYhPCMW5SVp
 3O+QeaxZYBcwcGSTaTguLD3LT9QjoPLOc2Lzl5s4R7BULgAxR2vlZvrelv9ybS6MgeD2
 LlvQ==
X-Gm-Message-State: AOAM532Z5zsieUt3Shs/BqzvE54K3/7Q7hph6pLXYe8+ORIxqC7Epgqp
 lkusAooYSlIrfeN3+j1Yy+pKP8fGWdZ43PoomrYWoyBVKoja6HQUZV16nu2cARvdCWfjy4lJqeV
 RybtIPHteUNyCaC6+dg==
X-Received: by 2002:adf:8b92:: with SMTP id o18mr30897984wra.54.1602512826528; 
 Mon, 12 Oct 2020 07:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN/JUPdkMsHaZBYIgaydnOJmnNwLH0QYzEln08Ptid/yaqlyzjllxaKTcU7OhsAYIHHDu0Gg==
X-Received: by 2002:adf:8b92:: with SMTP id o18mr30897939wra.54.1602512826234; 
 Mon, 12 Oct 2020 07:27:06 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id f6sm11354830wru.50.2020.10.12.07.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 07:27:05 -0700 (PDT)
Subject: Re: [PATCH 1/5] hw/pci-host/bonito: Make PCI_ADDR() macro more
 readable
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paul Durrant <paul@xen.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <20201012124506.3406909-2-philmd@redhat.com>
 <3894edd-a214-3edf-8cbe-3566842e8a4@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aadc1813-9289-85eb-18b9-70c4189fd879@redhat.com>
Date: Mon, 12 Oct 2020 16:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <3894edd-a214-3edf-8cbe-3566842e8a4@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
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
X-List-Received-Date: Mon, 12 Oct 2020 14:27:26 -0000

On 10/12/20 3:55 PM, BALATON Zoltan wrote:
> On Mon, 12 Oct 2020, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> The PCI_ADDR() macro use generic PCI fields shifted by 8-bit.
>> Rewrite it extracting the shift operation one layer.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/pci-host/bonito.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>> index a99eced0657..abb3ee86769 100644
>> --- a/hw/pci-host/bonito.c
>> +++ b/hw/pci-host/bonito.c
>> @@ -196,8 +196,8 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>> #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
>>
>> #define PCI_ADDR(busno , devno , funno , regno)  \
>> -    ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
>> -    (((funno) << 8) & 0x700) + (regno))
>> +    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
>> +    (((funno) & 0x7) << 8) + (regno))
> 
> Are you missing a << 8 somewhere before + (regno) or both of these are 
> equally unreadable and I've missed something? This seems to be 
> completely replaced by next patch so what's the point of this change?

I might have missed a parenthesis somewhere indeed =)

I'm happy to merge it in the next patch, I thought it would
be easier to review but it isn't.

Thanks for reviewing!

> 
> Regards,
> BALATON Zoltan
> 
>>
>> typedef struct BonitoState BonitoState;
>>
>>


