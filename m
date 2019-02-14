Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDdQ-0000ZA-CP
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDdO-0000Xc-Jg
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:48:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDdK-00043B-Id
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:48:44 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:46901)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDdG-0003fE-Kx; Thu, 14 Feb 2019 04:48:38 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MvsR7-1hBCkT0n03-00stLw; Thu, 14 Feb 2019 10:48:30 +0100
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, patches@linaro.org
References: <20190208132112.31493-1-peter.maydell@linaro.org>
	<5b9474b0-7ce7-3efb-253e-4be7f1918281@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e1577929-4e16-9971-0686-5b3dadfc6ef7@vivier.eu>
Date: Thu, 14 Feb 2019 10:48:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <5b9474b0-7ce7-3efb-253e-4be7f1918281@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9RGCOn+Wl+64/+MSef5WpX+vDZ5TpqB3AihGRF1JRSIsG6k8HGn
	yg0cvHMmvbhGDhAWpu10IUt7/drIO9a4x56LvmfqxTaoabhI7myoPG7cLO+jwptEz++ogtM
	SIBOVy60tpSfSdP2QcirK2JV9WX5cOe2DLGt8IfQ2M+dmW38HNoAILN+3yPGygx6P5Lr8Ct
	vC3cCWoMMUPhhisJMsxyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lQDRQLy6pE8=:/05ZOMgrU96uOibUlPHPvS
	1VScEOmqW0xveiDLNUpF5M8xk5IOAStbw3QgBVZ15SLut4U+YrHtvN1cgJFK6YgAoL8aTVaZs
	hgmi/8IeHTe7Q4bZUXjOqm9ndx5dM3JrEGdqXK97UAYxvAtBr6xOm+Kq3A9WUOj4rPf1csEC/
	7Y8Zxn0MLVCI1UBLBjSZGQdEfdp2A3ARM8NzJCTt4LplUhv53QF4Y/KweX03Gn0iXAh0RyIxN
	mitJOm2vu50g6TejESe6T4hbpVPWbgM3GBYSfcu+bBk5yz03hTsJuJ6CoCQvjRJY2C5m7/vYv
	G4DIbAL40VEWAg6o4A9jNQHKEOgRGw45ogTUrvwK1T1I2WxJLnDWabJ/T9RsGMYsBYZWtZG6W
	YgW9bGlBa/qZDznXfm3Sp1PHLDobQtS35JkIAfjqbBd5q6gzEz4DHmVbBZ26wpwCuY/hZ6Z+W
	WKVxV8mYFTlV1l/LpFstKuIYTOR0V39/uXFGx33rNUhucTEjvRTGy3vF9wT7PiQ5+JPDUZTW/
	bgO+Wyaqgd5s9tGK7Q5y3VTRSmAHGjQl8zuV2zEqemqe/MO0b+1gJq63781m1EfBHMPFQ1L1P
	lNbaYTxhUixOD+JaI6wUpWKME90byijNxW0jSo7xH56s09UH49Sfl2EH6B6abhAWYwO8DP2cz
	lXp6ftj3F337ioRYQ8pHrq03RuzcCq2c1qLKyv5TIVycOL7tu54gd5tCO/C6wyu6RciQLhxr1
	k/yArjBeq9gPIJC8t8SJpPK2Icaz3RvL5b30la/MqOTA1kQF6zdfAdVHmaE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Make
 -Waddress-of-packed-member warnings be errors
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 09:48:47 -0000

On 08/02/2019 14:33, Thomas Huth wrote:
> On 2019-02-08 14:21, Peter Maydell wrote:
>> We have now managed to eradicate all the places in the codebase
>> that triggered clang's -Waddress-of-packed-member warning. Remove
>> the compiler flag that exempted it from our usual -Werror policy.
>> This will prevent any new problematic code being added in future.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  configure | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index fbd0825488c..50ac5d90f2e 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1881,7 +1881,6 @@ gcc_flags="-Wno-missing-include-dirs -Wempty-body -Wnested-externs $gcc_flags"
>>  gcc_flags="-Wendif-labels -Wno-shift-negative-value $gcc_flags"
>>  gcc_flags="-Wno-initializer-overrides -Wexpansion-to-defined $gcc_flags"
>>  gcc_flags="-Wno-string-plus-int $gcc_flags"
>> -gcc_flags="-Wno-error=address-of-packed-member $gcc_flags"
>>  # Note that we do not add -Werror to gcc_flags here, because that would
>>  # enable it for all configure tests. If a configure test failed due
>>  # to -Werror this would just silently disable some features,
> 
> Great!
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

