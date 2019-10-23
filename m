Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNEBP-0000WE-KT
	for mharc-qemu-trivial@gnu.org; Wed, 23 Oct 2019 06:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNEBJ-0000TS-C3
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 06:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNEBH-0006V8-QN
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 06:47:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50580)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNEBH-0006Uc-II
 for qemu-trivial@nongnu.org; Wed, 23 Oct 2019 06:47:55 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E54E683F4C
 for <qemu-trivial@nongnu.org>; Wed, 23 Oct 2019 10:47:52 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id x23so398198wmj.7
 for <qemu-trivial@nongnu.org>; Wed, 23 Oct 2019 03:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tk4BUPP+rPwfc0L6tXLGTogKMBLg6zQUR9RBveb4iJ8=;
 b=dRdb2XjIpOTazbZ0XjrQslsuy0W/k1pHZyalU3FrxmXotg401d4SIIA2Gpq/K7gcCh
 EcKcoA3C7W/6oOfY4ab4C/uGh4pPqX4l2Ogd07Eq0TJkNMm5dq8gICeycXRZomO3Kg4S
 YWNn83uy/UNh/2OVuEjWz0n3xpSOJcWf55wPpFtnKzxwIR05oA5/aSMYfexvfWxbqFsl
 WEARDBh7/yhs9ZLtBenIPQi0X1H80upNHE73svE+0FGTocHWfo3eIbp8NI+8GMjVEFAr
 AAyWnSnUf4XqwHZyH/pWUhmt5cqzPcVfacwytxO2vmekeIaaJqTy+K1bYjY7jaylsJRJ
 /5IQ==
X-Gm-Message-State: APjAAAVr/sQMYxLtE8d1vCxz0hmrH5QEpkLK6GMdlrioyd3MiuJjJjD7
 CjWp2R/yDvexXuKJdHPh8zS7RdiiVvKCOkR1fEvcYREnFFDzpyIKZxP2YLqidklkekKgpur0w3M
 BIobqNOVe2yPMvFnMcw==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr8314520wrq.9.1571827671224;
 Wed, 23 Oct 2019 03:47:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxD6dGk+L/p3d8NRYOuR+o4250ZqkdOgvFS3adAgLY343wvFC8LBh32hZgnaA+cWd7dDwJXQ==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr8314488wrq.9.1571827670906;
 Wed, 23 Oct 2019 03:47:50 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id o19sm20317772wmh.27.2019.10.23.03.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 03:47:50 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] pci_bridge: fix a typo in comment
To: maozy <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20181108122102.9915-1-maozhongyi@cmss.chinamobile.com>
 <1898dc23-c512-88bd-cb73-5a2cffccd176@redhat.com>
 <7f3e7954-3574-9f44-7710-4a488c1d0fe2@cmss.chinamobile.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f68aacf9-2ac3-2a9d-8aab-6a86c52cbacb@redhat.com>
Date: Wed, 23 Oct 2019 12:47:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <7f3e7954-3574-9f44-7710-4a488c1d0fe2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 23 Oct 2019 10:47:59 -0000

On 10/23/19 5:32 AM, maozy wrote:
> ping...

I'm not sure qemu-trivial@ received this one because the email address=20
looked odd (now fixed).

>=20
> On 11/8/18 9:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Cc'ing qemu-trivial@
>>
>> On 8/11/18 13:21, Mao Zhongyi wrote:
>>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>
>>> ---
>>> =C2=A0 hw/pci/pci_bridge.c | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
>>> index ee9dff2d3a..da8daa3ff2 100644
>>> --- a/hw/pci/pci_bridge.c
>>> +++ b/hw/pci/pci_bridge.c
>>> @@ -310,7 +310,7 @@ void pci_bridge_reset(DeviceState *qdev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the default values for base/li=
mit registers aren't specified
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 * in the PCI-to-PCI-bridge spec. So we don'=
t thouch them here.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * in the PCI-to-PCI-bridge spec. So we don'=
t touch them here.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Each implementation can overri=
de it.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * typical implementation does
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * zero base/limit registers or
>>>
>>
>=20
>=20

