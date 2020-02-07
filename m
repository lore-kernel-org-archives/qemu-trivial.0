Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j01lF-0000mc-Ij
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 06:25:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j01lC-0000jv-Ew
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 06:25:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j01lB-0008Le-DN
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 06:25:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53323
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j01lB-0008LH-AH
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 06:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581074720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgKHnlRpojuC2/I20bt1mTeRaEBo4Zu3/FkZhKlA1ms=;
 b=LNYPzgtDtJb+RQ/49o+WDGgHtotCkRA7DcJpBo5tewhBAtu04mtrk5/lwGcIBJbAGoiQJ5
 YjVOi3DR40r6QYAfUS5WNEM0nGhuac/xJx9xiLRkJM5ArI06YIjO0fg2m8AlJx/whIC6Jc
 /UJdaa1+F4Zw/EoYyTUHuxm9o2QduOU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-GOqYoolUOJ2xaCnDVCzPgA-1; Fri, 07 Feb 2020 06:25:16 -0500
Received: by mail-wr1-f71.google.com with SMTP id u8so1103899wrp.10
 for <qemu-trivial@nongnu.org>; Fri, 07 Feb 2020 03:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kdkny600VcCOTeOaqonAkoG+I23E1H+EAJ4drPnGlnY=;
 b=GLHm+kB3+79CN3dvkU7aePXFBt6dQWb4n0h90UmCFHDzyufCFV7sAbICiBqG2EUXwT
 IEQckHl3ZgUEbxy2uYTI5W0PMX4qmjeWLSNiO2VzA2qpqHE+1X94ReO6u/4j+sO2iFLy
 c4iRUk3LBL8XXpqbxV7o5hwqXLMJATC27ATFdnjNO48u/WBGzCaKFhSmtYNB3vfWYv6l
 Vj8U9aM+XdwxcSOmJy4t2gRUknUSROqD/si8O0r60DRSbwlujJBT/wsvQTBRT6bi9PRN
 WEmDY7RPb/7rFnDqcjBwfvVWXJ9qqTH+efzIJ86hL4wMDnqev7edN5znEf7Air5OJyHh
 F1yg==
X-Gm-Message-State: APjAAAVABKymYEjhCIuAWh3uXvo5916SWjVWp0VrPoqd2J4DAVySHIsK
 H0FU+fDMzkYSfAvC7KZ80Pi5/mGMPJ/GILX5nix5IFH4Co7450jWrA5o+IFmC6SPpGDpzi6yS9/
 BSqDStCawjBDn8oqb9Q==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr3770068wmi.166.1581074715135; 
 Fri, 07 Feb 2020 03:25:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdxeVnhvBXgJuUnR5sCFJfSS3a+JBqnJ6c2o12TmPRh6oftKxF/olVR3RQD30dGmjuMmT+Fg==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr3770042wmi.166.1581074714872; 
 Fri, 07 Feb 2020 03:25:14 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id g15sm3103135wro.65.2020.02.07.03.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 03:25:14 -0800 (PST)
Subject: Re: [PATCH] vl: Abort if multiple machines are registered as default
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200207110259.12544-1-philmd@redhat.com>
 <24bddc77-801e-ae63-dd1d-e06e3ac1cc03@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <078fbde9-3c93-b00a-2d53-34e65c7f56d9@redhat.com>
Date: Fri, 7 Feb 2020 12:25:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <24bddc77-801e-ae63-dd1d-e06e3ac1cc03@vivier.eu>
Content-Language: en-US
X-MC-Unique: GOqYoolUOJ2xaCnDVCzPgA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 07 Feb 2020 11:25:23 -0000

On 2/7/20 12:08 PM, Laurent Vivier wrote:
> Le 07/02/2020 =C3=A0 12:02, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>> It would be confusing to have multiple default machines.
>> Abort if this ever occurs.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   vl.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/vl.c b/vl.c
>> index 7dcb0879c4..da828188eb 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -2354,6 +2354,8 @@ static MachineClass *machine_parse(const char *nam=
e, GSList *machines)
>>       GSList *el;
>>  =20
>>       if (is_help_option(name)) {
>> +        int default_count =3D 0;
>> +
>>           printf("Supported machines are:\n");
>>           machines =3D g_slist_sort(machines, machine_class_cmp);
>>           for (el =3D machines; el; el =3D el->next) {
>> @@ -2364,6 +2366,11 @@ static MachineClass *machine_parse(const char *na=
me, GSList *machines)
>>               printf("%-20s %s%s%s\n", mc->name, mc->desc,
>>                      mc->is_default ? " (default)" : "",
>>                      mc->deprecation_reason ? " (deprecated)" : "");
>> +            default_count +=3D !!mc->is_default;
>> +        }
>> +        if (default_count > 1) {
>> +            error_printf("Multiple default machines available\n");
>> +            abort();
>>           }
>>           exit(0);
>>       }
>>
>=20
> Does it really deserve an abort?
> Ideal solution would be to be able to check this at build or in the unit
> tests.

This is for developers, not for users. I'll use Marc-Andr=C3=A9 suggestion=
=20
and use an assertion.


