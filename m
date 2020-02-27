Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7LCE-0000n0-Uc
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 10:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7LCC-0000mS-9r
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 10:35:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7LCB-0007lc-9m
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 10:35:28 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38076
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7LCB-0007kd-6I
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 10:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582817726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NF4E9rOgtCZE9IThrbg7pTderyZQUYYORdAU/Nf/mUc=;
 b=hMvaTmJ3z3a+h6whsRhWtRFQVJ14h9KkJTpm44YgQdt9WE3TquZ4v0xuRuy3pQMVZgCFf7
 6D+yReqXZn5k+S+1G8k21xAI0ASn+lX6p2f+gw5h4/rPkvx8/vZbMLkDtyOc6uuyWM0wMj
 CLBWlaxVOZpkZ/fLePdR53he47aFq2A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-dIc6CXntNhyT-HseI102oQ-1; Thu, 27 Feb 2020 10:35:25 -0500
X-MC-Unique: dIc6CXntNhyT-HseI102oQ-1
Received: by mail-wm1-f69.google.com with SMTP id p26so832650wmg.5
 for <qemu-trivial@nongnu.org>; Thu, 27 Feb 2020 07:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qhsvCr8jZD0F4RJ22ERrwxPlGA82K7TJGhS6HMn0sFc=;
 b=s/ItCc12ncnTAZqCNZNmC1u853ko3+R9tayITQPh8irT15J0wGb5lRJAm1Nbz/ur3P
 CjyFE7/sr5HDD/amT5RnsSg9t9AVfCTJPO4kjoFp/Fr3PhpTpgfeYybPqdReTal7yywE
 zr23e2MYjANiQWrFfDIgyufDB6/CxYIEzVZBO2kShIFJHC4muE7d5QUNTFe75C5DnPhS
 jeXlcQCOiSEb9v5iCN9DzvcDDfPP09Keqsmjow2JHCvRQ5FWaUEWLZ4GFH19NFHJJoAm
 D82TnjNvZ557mfQEqelkeK0M1JAoXBf1PvkwQO/nmrW4nzi0JXmA9X3cfhrnvsr1LYXC
 jAQA==
X-Gm-Message-State: APjAAAVTMKnibEd5qlV3d+PLz3JI2s9zFyz/2AVIdnuMXbwLzpStdu3o
 YK5iIL4nTg+pbvE7/mPJ6JGh1NxSt8Zn4SWxAkhIW2xuLMHaJ6PdL+IV8fDVoR7jYQr2yETp6/7
 +D+hglx3CZ5cJO2plNA==
X-Received: by 2002:adf:a114:: with SMTP id o20mr5393474wro.7.1582817723895;
 Thu, 27 Feb 2020 07:35:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxCE8WP7/70/qfZ23012B2ERp/howwJmG7d+gDFzsPJzAQGbErLa0IDH9rHyacG7b4+m1pVKw==
X-Received: by 2002:adf:a114:: with SMTP id o20mr5393456wro.7.1582817723695;
 Thu, 27 Feb 2020 07:35:23 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id a7sm7564161wmj.12.2020.02.27.07.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 07:35:23 -0800 (PST)
Subject: Re: [PATCH 2/2] util/oslib-win32: Improve error report by calling
 error_setg_win32()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20200227100250.20514-1-philmd@redhat.com>
 <20200227100250.20514-3-philmd@redhat.com>
 <87zhd4ozv7.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2d967cdd-3625-5b00-a154-65781f4f7d4b@redhat.com>
Date: Thu, 27 Feb 2020 16:35:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87zhd4ozv7.fsf@dusky.pond.sub.org>
Content-Language: en-US
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
X-List-Received-Date: Thu, 27 Feb 2020 15:35:29 -0000

On 2/27/20 3:42 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> Use error_setg_win32() which adds a hint similar to strerror(errno)).
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   util/oslib-win32.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
>> index e9b14ab178..d2fca1808d 100644
>> --- a/util/oslib-win32.c
>> +++ b/util/oslib-win32.c
>> @@ -46,7 +46,8 @@
>>   void *qemu_oom_check(void *ptr)
>>   {
>>       if (ptr =3D=3D NULL) {
>> -        fprintf(stderr, "Failed to allocate memory: %lu\n", GetLastErro=
r());
>> +        g_autofree gchar *emsg =3D g_win32_error_message(GetLastError()=
);
>=20
> Since we're on a path to abort(), I wouldn't bother with g_autofree.\

This is in case other developers copy that elsewhere.

>=20
>> +        fprintf(stderr, "Failed to allocate memory: %s\n", emsg);
>=20
> Any particular reason not to use error_report()?

Pre-existing call, but I can change.

>=20
>>           abort();
>>       }
>>       return ptr;
>=20


