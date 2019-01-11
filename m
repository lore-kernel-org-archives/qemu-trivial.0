Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghr6b-0006gs-26
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2019 02:19:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghr6Z-0006gZ-K6
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 02:19:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghr6Z-0003Og-3y
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 02:19:47 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:56625)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghr6X-0003Mr-Hz; Fri, 11 Jan 2019 02:19:45 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MHX3R-1gUywp16bh-00DbmO; Fri, 11 Jan 2019 08:19:42 +0100
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Roman Kapl <roman.kapl@sysgo.com>, Jon Diekema <jon.diekema@gmail.com>,
	qemu-trivial@nongnu.org, Roman Kapl <rka@sysgo.com>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <CALvuzg43uSodseEHjNaRcPFBKKPTY2mcppUbYgiLL=QO9RxX_Q@mail.gmail.com>
	<e62bbdda-2ab9-b9a1-7843-0a3a40f56282@vivier.eu>
	<4cfad0f8-1b66-b6be-693e-ba439e81f171@sysgo.com>
	<f36c1752-98ad-7c44-4637-7186c7511f38@vivier.eu>
	<20190111003527.GO6682@umbus.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3ebb5fe7-5571-460f-9ee2-b667578816ff@vivier.eu>
Date: Fri, 11 Jan 2019 08:19:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190111003527.GO6682@umbus.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:jCe9vn2yDvbtT1eHXRfHH93rax0LFe50ZCYxcpW9vTbqGyHS08K
	rNI8hEUqKkX388ivTP2w8OHPwqMIeJseRT6R1Tyjz7uhe2mv+cE2o/w+O9EP6FgCdx4P6Mb
	guU9wPEiuSXINpxKaRE+wKsWlH4an2fZJyexNsMBTY5eFokNBLSlXFPvy4HKc54DGtDlbKY
	m/6S8RhJ/o6lFJI/W7TZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z5TD5ayUfs0=:sq0MPlstKYmYVQebN11srp
	eLKTpAV4ZQo0Hv2ksuwlYNMDEUKfjNWjpDeg5e4d631iAJQ7Hu4lKtiCgkZTNGkOcO1xjrvl2
	2l5kJIdV5JZJ9KumFViHPXHmoMLYgn9W/u3GJWQwrk292QmXCOUxPHIfBAVVFe85Hbb4bRHNI
	5H1K4hND4gOxqwjTZ294HUUzT/pA7nRQvQvccU8GjS5q/X8yJfut+qtNlabsuzBIXTqcH8kEh
	IherVb6M3Ur05AYjt/xtz3BhJ+31nVhYPrUXz/VqmUj+9EBoEiMeK5YFOVM+Bcb2IlukEXw0R
	Orhq46qab8CpZSc3+vfCLG9SU0KcYBxEI5fZJBJ9YrcEDxuXeBsDKGWFLXyr/QqI3PVqNGUCY
	iqnQSJPvZh0Svw19btMzC88V9+dnq/kEE/vwnqsak/MMGuvEnDgpjm4s1h64hw1YvMDfjIzGw
	Isugbi5o/H+mV5uMTHeuWMFQoeEkwOEoJ6XS2KT5rEs4RtlCJ5DIMcgsOGSsGQYr/jRW9CHN3
	lt/mXT2S7+HuUE6gu4Ase/c0Z/9NQJPmutk18eGJ+lrjWZxSgqg+BIBRqb5WtSo7eV8Vwkx8o
	0FBjWgLkI8ZXcBW+P35kx5tjwqKiQNFwbdztW7SzNAZ/utSAW0ysnx3/BmKmbNWWuSO4zO2aM
	lBzaNC53s2+oxR+oaKUhLJjeJsu7qgNrlZG2tZKm/fD8Z9z6ObJlQpfBN2wDprI6rPCkEu8xn
	sG9I3Voz1MRxMYDpFQNq0onXIgCuD5xNbLfGfQN7v8bpYGo8WBg0iNlz9jo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] ppc: e6500 registers SPR 604 twice
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
X-List-Received-Date: Fri, 11 Jan 2019 07:19:48 -0000

On 11/01/2019 01:35, David Gibson wrote:
> On Wed, Jan 09, 2019 at 11:17:00AM +0100, Laurent Vivier wrote:
>> David,
>>
>> will you take this through your ppc branch?
> 
> Somehow I missed this one, sorry.  Even when I look back through my
> mail archives I can't see the original message of this thread.  Can
> you resend please?

Yes, the original message has only be sent to qemu-trivial ML.

Thanks,
Laurent


