Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itcRF-0006Wf-Km
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jan 2020 14:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itcRA-0006UH-A3
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 14:10:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itcR5-0002Cb-Lb
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 14:10:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50123
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itcR5-0002C0-DG
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 14:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579547406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=247hrgJBP7uWliOLwVd84TiPECnr36+QswrFxWYZpuQ=;
 b=UKwEp+RjZvDsY35oLKewweahlEmu2PxucwqXQPQrbZ15i3NOcPjkVaXZ6AajzEgXkKGuV7
 XG6MVTlGhFg4WlfMYOTZx0akREdAmF+BsdztG0mY7atPEka5r04C0pFN94F1qFmPyNK4vk
 +d+QEn9HpanXarZXVlt8ZBbxN3x0XNk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-CSGBvr6mNvaQDjXRhqLbvA-1; Mon, 20 Jan 2020 14:10:05 -0500
Received: by mail-wr1-f69.google.com with SMTP id f17so199391wrt.19
 for <qemu-trivial@nongnu.org>; Mon, 20 Jan 2020 11:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LiEqYUpoJN7awPuju73mr0uSwGm3RoRSi4iqEulDso0=;
 b=mqsH8kShLhoLzEr7fm70b/s0KrKSukvu4BzKbwT6rfC1U/TLXW4wmEWtZw/Wmm/lBQ
 tQNtbueXhd7Gcadg97pTtY8ROyh/NhyJBUeBfqxkVYwWGqBkSgG9J0K9pMCdtq0UcXEG
 rK8sVh2ilSwyuZyHKGrUWzurW6y7BXzOdmWUZdGaqzGrfAgBE+BwoFU4ZcRmmHPFLchx
 h7I1wCXr6Afx9fjDkHWLAKUmmcis/tgOEdBbvgn8WLUHyuJG7IgyJO2IcGGfdtq4de7I
 dPVor8RymHoJRBCJzM2Q8HbiBTJamt1LHDbxAMcxZvGCrrSuqBx5GrwrMgHaT15+zGAP
 Xb3Q==
X-Gm-Message-State: APjAAAVpk3SKIz+lAiZuMaqhzKVOGm8m5Q9Y0L5xfHAnzh344wlperSb
 8Bs6CFaViDfv8ACxWAN0QPkOwHwpfFgFL4O+wSbZGWJNhia+P0JGiBfM3gt0Y0dwS0S7idobvzr
 0mdgDrLN3CWIz9YdFuA==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr329873wmd.80.1579547404047; 
 Mon, 20 Jan 2020 11:10:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzHoJoVYSYbvwRT7PpcWSM1UNIQOw3rFYuZXo9TakaMfO1SSn/fTdxFjI9dYiq2zQv8ZDrF7g==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr329863wmd.80.1579547403883; 
 Mon, 20 Jan 2020 11:10:03 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id l17sm46726818wro.77.2020.01.20.11.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 11:10:03 -0800 (PST)
Subject: Re: [PATCH v3 1/2] MAINTAINERS: Add missing m48t59 files to the PReP
 section
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org
References: <20200117165809.31067-1-philmd@redhat.com>
 <20200117165809.31067-2-philmd@redhat.com>
 <f5181fa3-e830-7d04-1f4e-0673d2202eec@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d566490e-512c-527c-4b7e-b6e20cf790f0@redhat.com>
Date: Mon, 20 Jan 2020 20:10:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f5181fa3-e830-7d04-1f4e-0673d2202eec@redhat.com>
Content-Language: en-US
X-MC-Unique: CSGBvr6mNvaQDjXRhqLbvA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Mon, 20 Jan 2020 19:10:16 -0000

On 1/20/20 6:53 AM, Thomas Huth wrote:
> On 17/01/2020 17.58, Philippe Mathieu-Daud=C3=A9 wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   MAINTAINERS | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4b425d030d..c162145bd0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1084,6 +1084,8 @@ F: hw/pci-host/prep.[hc]
>>   F: hw/isa/i82378.c
>>   F: hw/isa/pc87312.c
>>   F: hw/dma/i82374.c
>> +F: hw/rtc/m48t59.c
>> +F: hw/rtc/m48t59-internal.h
>>   F: hw/rtc/m48t59-isa.c
>>   F: include/hw/isa/pc87312.h
>>   F: include/hw/rtc/m48t59.h
>=20
> Why only PReP? The device seems also to be used by Sparc machines...?

Indeed, and also the PowerPC405 evaluation boards, so I'll simply drop=20
this patch.


