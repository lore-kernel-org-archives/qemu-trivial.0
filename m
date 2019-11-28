Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iaEvU-0008N0-1r
	for mharc-qemu-trivial@gnu.org; Thu, 28 Nov 2019 03:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iaEvQ-0008HZ-LB
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 03:13:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iaEvO-0003jY-G1
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 03:13:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39591
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iaEvO-0003hr-9i
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 03:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574928797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qUqd44mi0bKs4otIpCe2ihfMhJEHKpNX5E/0VDYnRiE=;
 b=enY6TamRrWZyLQpXIkEQuQeuCUJ/qzktILSxNXSCATsEmys8rrynPSCVhQHmgRwoNslOus
 uAOAOyDn/1ZGB9IQo1jigt7RsQoDHkWz+NeunXP/J3QolDib7By6ZBCxHWPtVmVM/VpFeu
 QSP0TxBjYc8FNZ2GwU/IR4m1kYy1L/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-YFBb3yjvPj6VLUMN-oGvjA-1; Thu, 28 Nov 2019 03:13:12 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 151BB157299D;
 Thu, 28 Nov 2019 08:13:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-114.ams2.redhat.com [10.36.116.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 365835D9E1;
 Thu, 28 Nov 2019 08:13:06 +0000 (UTC)
Subject: Re: [PATCH] travis.yml: Run tcg tests with tci
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-trivial@nongnu.org
References: <20191127154857.3590-1-thuth@redhat.com>
 <87zhghf9lg.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <02c92ddf-e65a-2d2d-40fa-027aa4e4c558@redhat.com>
Date: Thu, 28 Nov 2019 09:13:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87zhghf9lg.fsf@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: YFBb3yjvPj6VLUMN-oGvjA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Thu, 28 Nov 2019 08:13:22 -0000

On 27/11/2019 19.38, Alex Benn=C3=A9e wrote:
>=20
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

Limiting is a good idea, but I think we should use the architectures=20
that are supported by tests/boot-serial-test.c instead.

>> -        - TEST_CMD=3D""
>> +        - TEST_CMD=3D"make run-tcg-tests-x86_64-softmmu V=3D1"
>=20
> How about "make check-qtest check-tcg"
> > Which will exercise the moderate boot code tests of various
> architectures as well as x86_64 (if we include the --disable-docker
> configure stanza)

I tried "check-tcg" before switching to "run-tcg-tests-x86_64-softmmu",=20
but "check-tcg" then resulted in a docker error:

  https://travis-ci.com/huth/qemu/jobs/260949876#L11974

... so looks like we indeed have to use --disable-docker in that case.

I'll have a try and send a v2 if that works out fine.

  Thomas


