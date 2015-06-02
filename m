Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzf4P-0006iJ-IX
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 01:49:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzf4N-0006e9-5O
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:48:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzf4M-0004bD-BE
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:48:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51638)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yzf4H-0004Zs-VZ; Tue, 02 Jun 2015 01:48:54 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4DB3740423;
	Tue,  2 Jun 2015 08:48:53 +0300 (MSK)
Message-ID: <556D43C4.2070309@msgid.tls.msk.ru>
Date: Tue, 02 Jun 2015 08:48:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>
References: <1432897012-1423-1-git-send-email-alex.bennee@linaro.org>	<55684995.3070205@redhat.com>	<877frrii83.fsf@linaro.org>
	<556893DB.9030502@redhat.com>
In-Reply-To: <556893DB.9030502@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: don't apply -O2 if
	extra-cflags sets -O
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jun 2015 05:48:59 -0000

29.05.2015 19:29, Paolo Bonzini wrote:
> On 29/05/2015 16:14, Alex Benn=C3=A9e wrote:
>> You mean just do:
>>
>> diff --git a/configure b/configure
>> index b707429..f13831a 100755
>> --- a/configure
>> +++ b/configure
>> @@ -353,7 +353,7 @@ for opt do
>>    ;;
>>    --cpu=3D*) cpu=3D"$optarg"
>>    ;;
>> -  --extra-cflags=3D*) QEMU_CFLAGS=3D"$optarg $QEMU_CFLAGS"
>> +  --extra-cflags=3D*) QEMU_CFLAGS=3D"$QEMU_CFLAGS $optarg"
>>                      EXTRA_CFLAGS=3D"$optarg"
>>    ;;
>>    --extra-ldflags=3D*) LDFLAGS=3D"$optarg $LDFLAGS"
>>
>> I guess at the time I was trying to be clean and avoiding multiple -O
>> calls. But I guess that will have the same effect.
>=20
> Yes, that.  Most other QEMU_CFLAGS assignments add at the beginning, so
> I guess the remaining ones (including the --extra-cflags one) should to=
o.

So, what's the final version of this patch?

Thanks,

/mjt


