Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jH4rW-0007rp-8I
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2020 08:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jH4rT-0007pp-4B
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 08:10:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jH4rR-0005Ie-Kc
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 08:10:19 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:58218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jH4rR-0005I4-GZ
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 08:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585138217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAFT12LcBV/9KYAz9C3tZQI412uZoIA0KBN9ngpMVbY=;
 b=B4H11u68aS3nErn0Eay6hUKQ0i/o6PjgLFGUVunEB8CAKbZxRtRGiQuUuLF32CGuVM9QFL
 6v09yaXO7kFnIeH5vJDIHiYTeGTkvcHsqU6ZKgNBfQF/tDDwEnhquFMWePXd30sxjMGCwx
 ttSbJnDAoavBdDAt6lSPaN/FY3mc6WQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-87MfUxvkMLmvdusl7DdVvg-1; Wed, 25 Mar 2020 08:10:15 -0400
X-MC-Unique: 87MfUxvkMLmvdusl7DdVvg-1
Received: by mail-ed1-f70.google.com with SMTP id b7so1970609edz.9
 for <qemu-trivial@nongnu.org>; Wed, 25 Mar 2020 05:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rH/mouCnbQNZBBtTZ5Nqgt7CSjQsIdjQv20f5KQCrrg=;
 b=W1akB9EVOwmwxBpc3ox1oP9DQLsbPgCnb1D8LV1bCKl9hRfJIC8q+WohM+U1KHSTXu
 06yDPJ8XuYvLKPWNUk0vrEXWnpnWAFxU8c6xwsDnODX+z1wfD+o2qavoN4W8LzOUBJNQ
 kxTr2FVpzqzH1S1B4pg5UYdsC2utnjRqrgnU6hevSkPBI81J8VdVmC+Ne9QXA7DS9nsj
 X/AbRplCj0httpkvDTo3h37uxCNl+94S47wWhG/ajQ5oii1rzgT7J00BgAlbD85oCtbB
 gf9S3Jr8ceYbbzaO4yuOBGHAJYdG5anr0MxywoNNMuTQVZqIt4SfGjnBsicgq5/WAikA
 jCBg==
X-Gm-Message-State: ANhLgQ03ZXVLxtveV6fkELmEkl5xjYVwX7IgBFF16GSmD+IVCUAUY+l6
 4yLq21s2RiRhq4RoX7IW25F/q1tMWQMzLZkTaup+EqHDA+kaNpQaGdev7OAVRgLH3zjuzEF0i2Z
 BQ9W73vvWE3QowcNVtQ==
X-Received: by 2002:a17:906:4c2:: with SMTP id
 g2mr2766712eja.295.1585138214044; 
 Wed, 25 Mar 2020 05:10:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsM7UHzaPCUBBjgVhtnWYsfKwP6lRATsMQiJK0NWVbkySOXrNZw+N9VrbEKOpZXioPUJFcF6Q==
X-Received: by 2002:a17:906:4c2:: with SMTP id
 g2mr2766684eja.295.1585138213707; 
 Wed, 25 Mar 2020 05:10:13 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id oq12sm624456ejb.85.2020.03.25.05.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 05:10:12 -0700 (PDT)
Subject: Re: [PATCH-for-5.0] qga-posix: Avoid crashing process when failing to
 allocate memory
To: Dietmar Maurer <dietmar@proxmox.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>,
 qemu-stable@nongnu.org, Sameeh Jubran <sjubran@redhat.com>,
 Basil Salman <basil@daynix.com>
References: <20200324194836.21539-1-philmd@redhat.com>
 <1242083041.1.1585117162620@webmail.proxmox.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6be54d1f-e5fc-5b34-ba4d-fa050029f26b@redhat.com>
Date: Wed, 25 Mar 2020 13:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1242083041.1.1585117162620@webmail.proxmox.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Wed, 25 Mar 2020 12:10:20 -0000

On 3/25/20 7:19 AM, Dietmar Maurer wrote:
> but error_setg() also calls malloc, so this does not help at all?

IIUC the problem, you can send a QMP command to ask to read let's say=20
3GB of a file, and QEMU crashes. But this doesn't mean there the .heap=20
is empty, there is probably few bytes still available, enough to respond=20
with an error message.

>=20
>> On March 24, 2020 8:48 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>>
>>  =20
>> Similarly to commit 807e2b6fce0 for Windows, kindly return a
>> QMP error message instead of crashing the whole process.
>>
>> Cc: qemu-stable@nongnu.org
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1594054
>> Reported-by: Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   qga/commands-posix.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 93474ff770..8f127788e6 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -493,7 +493,13 @@ struct GuestFileRead *qmp_guest_file_read(int64_t h=
andle, bool has_count,
>>           gfh->state =3D RW_STATE_NEW;
>>       }
>>  =20
>> -    buf =3D g_malloc0(count+1);
>> +    buf =3D g_try_malloc0(count + 1);
>> +    if (!buf) {
>> +        error_setg(errp,
>> +                   "failed to allocate sufficient memory "
>> +                   "to complete the requested service");
>> +        return NULL;
>> +    }
>>       read_count =3D fread(buf, 1, count, fh);
>>       if (ferror(fh)) {
>>           error_setg_errno(errp, errno, "failed to read file");
>> --=20
>> 2.21.1
>=20


