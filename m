Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iugbB-0004LY-E4
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2020 12:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iugb7-0004EA-GI
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2020 12:48:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iugb6-00045E-CJ
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2020 12:48:53 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49000
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iugb6-000452-90
 for qemu-trivial@nongnu.org; Thu, 23 Jan 2020 12:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579801731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=he0bOUoKdJVspjP0ewqETfR4N7KbjzO4CCs4NglZMo4=;
 b=FMEv/eGAcD8UY0Scn8q88JMqc1IPjRHb6PfKuj7qDAE9BXKGyy2hcZg06SKzyWeXmRweBN
 RHUZg/4nrf6X8PoTdol/Y0n8cyG+ES5sGbJbcTddFUn1WGAhTpgFy5lifI5ILejyifmMGg
 PGYNFO8KzyVYoyoyYMfvn1ScUn2wmrM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-wj20jJeHO2iS-NnV8bfHqQ-1; Thu, 23 Jan 2020 12:48:19 -0500
Received: by mail-wm1-f71.google.com with SMTP id z2so1015688wmf.5
 for <qemu-trivial@nongnu.org>; Thu, 23 Jan 2020 09:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0TQedrmhIxYAdFh0sbcBzXS6ZGcfli+d/vKhQZ0CrCo=;
 b=GJDCA0BcNqlvUTX2+qPn6cUOcba9AKpG7R93jKc3CigzXfM3Wz8O6+SiirHNBFIamO
 1KqkiJc8O6AjUwhJOt8uJDlcnCNuJBl9Uq+zlE9shfRdaX8ustR4fx3cf8J9mgKKPVlx
 BMrPA8VW8q6fCnQzGnQub669L+7b1Uevy6hD4Pa2Q6dOqUAKINtN3RYlm+LupbM70LQZ
 D1NnVRYCzaXr5AbaVoFZpYZ8BGBYx3NVnrazzE0Yfwmv/VyiWnqJA7+lNJzKQ5I/Mizv
 f21oT+nL+K50sCdkE2UAvFtkc/+DkGyw4ZW+h/YLDEXVQQlbxhKucyNJxDLG7zIvb5dQ
 luqA==
X-Gm-Message-State: APjAAAVPO9cAllC5MjuYxwq69/aKz1s7Ew4V5f7Z2gU2wuLz4iUPAkYo
 WaUUij5r4koXFo+wg09SRf0zqpYMjIbDMMxH29fOZYt8D4yHpEQUmjwLBpPFjvHdBlPEHbJ95st
 JAjlDSXl+gYGYluZq8Q==
X-Received: by 2002:a05:600c:2218:: with SMTP id
 z24mr5263678wml.50.1579801697569; 
 Thu, 23 Jan 2020 09:48:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcyRuEXS2UQLUH8J831UoVWlXS1m1pPs9fgMZyRlizEpOnvCj+7bSCJRTvH2lDKz7Vk+2Igw==
X-Received: by 2002:a05:600c:2218:: with SMTP id
 z24mr5263665wml.50.1579801697411; 
 Thu, 23 Jan 2020 09:48:17 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id a184sm3543398wmf.29.2020.01.23.09.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 09:48:16 -0800 (PST)
Subject: Re: [PATCH] Makefile: List the sphinx documentation in 'make help'
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200122172137.7282-1-philmd@redhat.com>
 <CAFEAcA_4yGD4Tm5LpN3PXP6S_cbFGdVD8jAcnrm2pEyLNteW0w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <087f4fc3-2a83-fd15-aae8-f7a06dc8759d@redhat.com>
Date: Thu, 23 Jan 2020 18:48:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_4yGD4Tm5LpN3PXP6S_cbFGdVD8jAcnrm2pEyLNteW0w@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: wj20jJeHO2iS-NnV8bfHqQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 23 Jan 2020 17:48:55 -0000

On 1/23/20 12:53 PM, Peter Maydell wrote:
> On Wed, 22 Jan 2020 at 17:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> In commit 5f71eac06e1 we started to support the rST documentation.
>> List the build target we need to call to generate the rST files in
>> the 'make help' output.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   Makefile | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 6562b0dc97..b777f7fcdd 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1197,7 +1197,7 @@ endif
>>          @echo  '  vm-help         - Help about targets running tests in=
side VM'
>>          @echo  ''
>>          @echo  'Documentation targets:'
>> -       @echo  '  html info pdf txt'
>> +       @echo  '  html info pdf txt sphinxdocs'
>>          @echo  '                  - Build documentation in specified fo=
rmat'
>>   ifdef CONFIG_GCOV
>>          @echo  '  coverage-report - Create code coverage report'
>=20
> 'sphinxdocs' wasn't intended to be a user-facing target.
> If you do 'make html' this will build the HTML Sphinx
> documentation (as well as any legacy non-Sphinx HTML).

Ah OK! I guess I didn't read enough the documentation then :/


