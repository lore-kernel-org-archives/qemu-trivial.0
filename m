Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihdOa-0004RR-EC
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 12:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37161)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihdOX-0004RD-S9
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 12:45:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihdOU-0005cq-22
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 12:45:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41430
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihdOQ-0005N7-Rv
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 12:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576691139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYdCtARh1DlaJb5QhxAom7DShKuTQCeWthsEi/g0iqI=;
 b=bYVtfWRB54+/m85f7ZJp90Ku1z3lIKyRnOPTLOC01YodOYW0Qy74Ljxs8jqs5nCqKENXj0
 eLSZuiZzZusJsxnxo3tU+8wotG69lZM1+gNMZKJMFcVZxXW4BgeQ1xSli1GUpvszBmRWBv
 WACtz8el73dhU11j2WhgbqxG/KYlgMY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-BP0t9JlOM2GMqVWkmsmTjQ-1; Wed, 18 Dec 2019 12:45:38 -0500
Received: by mail-wr1-f69.google.com with SMTP id t3so455456wrm.23
 for <qemu-trivial@nongnu.org>; Wed, 18 Dec 2019 09:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SXc/wu8KlY6VL5Z2QJesRd/ee9QosLEou+3J83m0oio=;
 b=HFZFEVn8Vvp6mBHB/S+B2TjyF4U8Rz6BVQbog4oFu2Kkxsdf42XM8l4dvSH0oBhMt2
 mPCA54x3YY5iKT5vwL8Of0tf0JuG4WcO+0jJOYRV4yZ3C2TcALAprL7u0sXULC5Je/NO
 Uzi+0waGs0N9rjFMk7NS4GY/uF6tA8j0F4TuJ1Vu9HnT+SF8WUWed+BZQa2uhkGJmh/g
 K3M5IEXxQY27FILSZOiQf9Fdo+gGDLYjPzgXAfBk6WtbEfbrZZfwgHngd7F27lxmT08k
 b0gwd1jaw+Ln1Hz96944dYq+c67Urh37iOjd7Ati/1F0SkuAmIFtYl1vNYEiqO/Qfz8h
 TMMw==
X-Gm-Message-State: APjAAAWwwPkpdc66yRAogUGRePEkiIVMs29FzIb3J/dm/ogvoz3mU81+
 Xm94bI9JFfFZTLbMc/V9MXkhWykR5CKtb/6Pi62QrvLUT0mB3eg+Iy6EMaXdA6Qk5McHVTgBqBR
 GUD4sOlDwT9zXGl44kg==
X-Received: by 2002:a05:600c:108a:: with SMTP id
 e10mr4478087wmd.38.1576691137009; 
 Wed, 18 Dec 2019 09:45:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxZFf933ygNrX6goWNEZCNEh4Z1T7XrmfQKj+0lmiiO4CTTeMAuX7QMLTamuo6X91ot5C7LA==
X-Received: by 2002:a05:600c:108a:: with SMTP id
 e10mr4478054wmd.38.1576691136690; 
 Wed, 18 Dec 2019 09:45:36 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id z6sm3373743wrw.36.2019.12.18.09.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 09:45:36 -0800 (PST)
Subject: Re: [PATCH 6/6] qemu-io-cmds: Silent GCC9 format-overflow warning
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-7-philmd@redhat.com>
 <0bd64884-03fd-68e1-a790-c9ceb7710fd9@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac01ca89-ad58-a6f4-e33f-c1dcc4e0ad90@redhat.com>
Date: Wed, 18 Dec 2019 18:45:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <0bd64884-03fd-68e1-a790-c9ceb7710fd9@linaro.org>
Content-Language: en-US
X-MC-Unique: BP0t9JlOM2GMqVWkmsmTjQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Wed, 18 Dec 2019 17:45:59 -0000

On 12/18/19 5:15 AM, Richard Henderson wrote:
> On 12/17/19 7:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> GCC9 is confused when building with CFLAG -O3:
>>
>>    In function =E2=80=98help_oneline=E2=80=99,
>>        inlined from =E2=80=98help_all=E2=80=99 at qemu-io-cmds.c:2414:9,
>>        inlined from =E2=80=98help_f=E2=80=99 at qemu-io-cmds.c:2424:9:
>>    qemu-io-cmds.c:2389:9: error: =E2=80=98%s=E2=80=99 directive argument=
 is null [-Werror=3Dformat-overflow=3D]
>>     2389 |         printf("%s ", ct->name);
>>          |         ^~~~~~~~~~~~~~~~~~~~~~~
>>
>> Audit shows this can't happen. Give a hint to GCC adding an
>> assert() call.
>=20
> This deserves more investigation.  From my glance it appears you are righ=
t --
> and moreover impossible for gcc to have come to this conclusion.  Which b=
egs
> the question of how that is.

New entries are added to cmdtab[] in qemuio_add_command() which is=20
public (also called in qemu-io.c). So you can insert a cmdinfo_t with a=20
name being NULL. This is why I thought GCC was correct first, and I tried:

-- >8 --
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -42,6 +42,7 @@ void qemuio_add_command(const cmdinfo_t *ci)
       * Catch it now rather than letting it manifest as a crash if a
       * particular set of command line options are used.
       */
+    assert(ci->name);
      assert(ci->perm =3D=3D 0 ||
             (ci->flags & (CMD_FLAG_GLOBAL | CMD_NOFILE_OK)) =3D=3D 0);
      cmdtab =3D g_renew(cmdinfo_t, cmdtab, ++ncmds);
---

But this didn't fix the warning... So I moved the assert() in the other=20
location.

>=20
> Did you file a gcc bug report?

No because I'm not sure this is a bug, but if you confirm I'll file one :)

>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> Cc: Kevin Wolf <kwolf@redhat.com>
>> Cc: Max Reitz <mreitz@redhat.com>
>> Cc: qemu-block@nongnu.org
>> ---
>>   qemu-io-cmds.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
>> index 1b7e700020..9e956a5dd4 100644
>> --- a/qemu-io-cmds.c
>> +++ b/qemu-io-cmds.c
>> @@ -2411,6 +2411,7 @@ static void help_all(void)
>>       const cmdinfo_t *ct;
>>  =20
>>       for (ct =3D cmdtab; ct < &cmdtab[ncmds]; ct++) {
>> +        assert(ct->name);
>>           help_oneline(ct->name, ct);
>>       }
>>       printf("\nUse 'help commandname' for extended help.\n");
>>
>=20


