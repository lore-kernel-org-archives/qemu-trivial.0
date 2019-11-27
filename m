Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ia4iM-0004QY-Gv
	for mharc-qemu-trivial@gnu.org; Wed, 27 Nov 2019 16:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ia4iK-0004P1-2I
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 16:19:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ia4iJ-0002AR-3p
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 16:19:07 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36117
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ia4iI-00029u-VD
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 16:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574889546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0sdROm8vDBkkhXor0lVZMnz117098c5SxSyVxhVbXs=;
 b=ZnE6OF5+3jdQT8i3jRVyapkppQ/TwzPc7AQ253Z8qcCxb2RbrEpyXnoLU0WZusF2+7CCRj
 0uzk11nz7HVOxWwzGFBzsbUAuc3BiJMRgPKdLbSCkfC1yFfyXApB4v8BqTdxs/2C766yAG
 o/AJKkTZZo/GOPwLoix7Qju7UdzJWvs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-sZX-XoUUPxuHo7miHnPi8w-1; Wed, 27 Nov 2019 16:19:04 -0500
Received: by mail-wr1-f69.google.com with SMTP id d8so8814188wrq.12
 for <qemu-trivial@nongnu.org>; Wed, 27 Nov 2019 13:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9dDgbYK56G9JGdBXiG8g8rFq9PZSdh/Mj+NpfZWv1EM=;
 b=gQs19snLYfegGp7QD+winP9mCdmLhrMNHRWtOtOwKn/Ec40LfXJ92qblIYDI++A97f
 Xb0n/R/Lt2vqaeEVL8i/1uoxEzj4dfrfe/pSwcGecIWfIucs3a3WfB0GjzZ3LT2ZKIMW
 ftXjSxvuOUDdsO0dEv+bMIOD4jO09l64lVSjc8ocLJOaIsoEB23jJ7kjnlKNG/6Lt0fI
 20McMk6tJ8qwyiKdqQFzKFSq36KbCm34Hz6Zja7OaCF/SnMfyl38xQUHrjP89glfg4mv
 1v9xNnH92TzWK6F3k+LoGTj7Mcr3Bwn+MOYVP5zB4bUpfFlBUh4ogX115RS0WBN6CPx8
 KalA==
X-Gm-Message-State: APjAAAUXHHpvaJ+Pt4T0veWalIjlzTMJbLXqPtKF2MPo4AuKUdVNRsnG
 YQybDMDsxLncZcRZ8OQlQMGmTIWuq/6zCcFmcy6V2MVVzSy/NhSGatYyk+/TUoi7+7b+FQZM0sl
 hqVhewndjrTO3QhWXqw==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr6319176wmj.152.1574889542916; 
 Wed, 27 Nov 2019 13:19:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxunfDAx8SenjVKVfK5fTj9T1xWoPqHD4mmHBFRfeKBgqZvhaXI10aNmMlgFyqZ1RWrArCWkw==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr6319161wmj.152.1574889542707; 
 Wed, 27 Nov 2019 13:19:02 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id i25sm7768484wmd.25.2019.11.27.13.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 13:19:01 -0800 (PST)
Subject: Re: [PATCH] travis.yml: Run tcg tests with tci
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20191127154857.3590-1-thuth@redhat.com>
 <87zhghf9lg.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ee3b2cf5-a119-95a7-1aa6-1c42b00cfd7f@redhat.com>
Date: Wed, 27 Nov 2019 22:19:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87zhghf9lg.fsf@linaro.org>
Content-Language: en-US
X-MC-Unique: sZX-XoUUPxuHo7miHnPi8w-1
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
X-List-Received-Date: Wed, 27 Nov 2019 21:19:09 -0000

On 11/27/19 7:38 PM, Alex Benn=C3=A9e wrote:
> Thomas Huth <thuth@redhat.com> writes:
>=20
>> So far we only have compile coverage for tci. But since commit
>> 2f160e0f9797c7522bfd0d09218d0c9340a5137c ("tci: Add implementation
>> for INDEX_op_ld16u_i64") has been included, we can also run the
>> x86 TCG tests with tci, so let's enable them in Travis now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .travis.yml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/.travis.yml b/.travis.yml
>> index c09b6a0014..b0b634d484 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -218,7 +218,7 @@ matrix:
>>       # We manually include builds which we disable "make check" for
>=20
> this comment is out of date now (or rather has been for a while)
>=20
>>       - env:
>>           - CONFIG=3D"--enable-debug --enable-tcg-interpreter"
>=20
> Perhaps as linux-user doesn't add much to testing the TCG we could limit
> by MAIN_SOFTMMU_TARGETS here?

Good idea.

>> -        - TEST_CMD=3D""
>> +        - TEST_CMD=3D"make run-tcg-tests-x86_64-softmmu V=3D1"
>=20
> How about "make check-qtest check-tcg"
>=20
> Which will exercise the moderate boot code tests of various
> architectures as well as x86_64 (if we include the --disable-docker
> configure stanza)

Another good idea!

>>  =20
>>  =20
>>       # We don't need to exercise every backend with every front-end


