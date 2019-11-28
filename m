Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iaJwo-0006S3-MD
	for mharc-qemu-trivial@gnu.org; Thu, 28 Nov 2019 08:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58829)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iaJwm-0006Qz-Ha
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 08:35:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iaJvO-0004eU-Dd
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 08:33:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57991
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iaJvO-0004Ue-9d
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 08:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574948015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZWbpoC2J+eGEGYbbcesSj/oP4mhOZwwPs3I0BwYyS0=;
 b=XeN/DWruhN0KBVIcGnrllAE/fJnrIwbMn4hmCHwRDzdleooiVM+wmZjz22C4UVdfL/gZkn
 Sql9s8atz0XalpM0mOiLNnaVPFODNGR0wz+WYqIpwLjhsVM32VWa4nEjTo/6XILcY0Y740
 Yk1B0OrZHql4oc9vHV5ILzRRMLSK3eI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-jlK_kUItMoGptGqeIykyXQ-1; Thu, 28 Nov 2019 08:33:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B0A8184CAA0;
 Thu, 28 Nov 2019 13:33:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-114.ams2.redhat.com [10.36.116.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E83600C8;
 Thu, 28 Nov 2019 13:33:29 +0000 (UTC)
Subject: Re: [PATCH] travis.yml: Run tcg tests with tci
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-trivial@nongnu.org
References: <20191127154857.3590-1-thuth@redhat.com>
 <87zhghf9lg.fsf@linaro.org> <02c92ddf-e65a-2d2d-40fa-027aa4e4c558@redhat.com>
 <87r21sfgqz.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <94f2d39f-8525-8821-8af2-f5656f7b0025@redhat.com>
Date: Thu, 28 Nov 2019 14:33:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87r21sfgqz.fsf@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: jlK_kUItMoGptGqeIykyXQ-1
X-Mimecast-Spam-Score: 0
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
X-List-Received-Date: Thu, 28 Nov 2019 13:35:05 -0000

On 28/11/2019 11.16, Alex Benn=C3=A9e wrote:
>=20
> Thomas Huth <thuth@redhat.com> writes:
>=20
>> On 27/11/2019 19.38, Alex Benn=C3=A9e wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>
>>>> So far we only have compile coverage for tci. But since commit
>>>> 2f160e0f9797c7522bfd0d09218d0c9340a5137c ("tci: Add implementation
>>>> for INDEX_op_ld16u_i64") has been included, we can also run the
>>>> x86 TCG tests with tci, so let's enable them in Travis now.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    .travis.yml | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/.travis.yml b/.travis.yml
>>>> index c09b6a0014..b0b634d484 100644
>>>> --- a/.travis.yml
>>>> +++ b/.travis.yml
>>>> @@ -218,7 +218,7 @@ matrix:
>>>>        # We manually include builds which we disable "make check" for
>>> this comment is out of date now (or rather has been for a while)
>>>
>>>>        - env:
>>>>            - CONFIG=3D"--enable-debug --enable-tcg-interpreter"
>>> Perhaps as linux-user doesn't add much to testing the TCG we could
>>> limit
>>> by MAIN_SOFTMMU_TARGETS here?
>>
>> Limiting is a good idea, but I think we should use the architectures
>> that are supported by tests/boot-serial-test.c instead.
>=20
> Maybe a new env - TESTBOOT_SOFTMMU_TARGETS?

I tried something like that - but with all possible targets that are=20
supported by boot-serial-tests, I hit the 50 minutes timeout from=20
Travis. Looks like I've got to skip some, TCI is really slow. So I'll=20
rather specify the target subset in the matrix entry directly.

  Thomas


