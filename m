Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkBpU-0005LS-6o
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 12:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gkBpS-0005KQ-F5
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 12:51:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gkBpO-0004oI-Ur
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 12:51:44 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:59093)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gkBpM-0004GS-RR; Thu, 17 Jan 2019 12:51:42 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MKsWr-1gW6xC0c73-00LHzS; Thu, 17 Jan 2019 18:51:31 +0100
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Jon Diekema <jon.diekema@gmail.com>, Roman Kapl <rka@sysgo.com>,
	qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
	Roman Kapl <roman.kapl@sysgo.com>, "qemu-ppc@nongnu.org"
	<qemu-ppc@nongnu.org>
References: <CALvuzg43uSodseEHjNaRcPFBKKPTY2mcppUbYgiLL=QO9RxX_Q@mail.gmail.com>
	<e62bbdda-2ab9-b9a1-7843-0a3a40f56282@vivier.eu>
	<4cfad0f8-1b66-b6be-693e-ba439e81f171@sysgo.com>
	<f36c1752-98ad-7c44-4637-7186c7511f38@vivier.eu>
	<20190111003527.GO6682@umbus.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1bbc0576-8371-3cd3-bce9-1374e852fc78@vivier.eu>
Date: Thu, 17 Jan 2019 18:51:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190111003527.GO6682@umbus.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:u2FvfvBDQd6j20+iJFVo5Hw8rNUiSODsxUgpcXJL7XQL/S/KOBJ
	MWQ7/12Mg5tmvRbc/6IQMHaPVib7k5mjocvA+Xv1vHbaU1GV0eyoBVDrkIiF7tRz1X1h0pt
	rOpB5kb7PyRGZvgoSTDgCbqOcKSrd/KNabRoN3Z8GXXsgReN2moGHyqgPXufkVHSHxPtU/r
	sIOxNMKKvzZTrD9NtIRBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LHjXfQWOSCk=:R1MvsBai7kr6rXo/WRw3fs
	lZbTiWc9K+jFSLeDI6KwElBFygGq616xqGsmaFaKSyIiFD8QZ4UbPyD94942PhMkcrX3QJGHf
	Cbv0mxvA95Yv4U+srBjiYTDxjlTNaaWiD78agywOLped3LFjPm6To+JI9yJYt+W9mcRQf07E/
	Jt+qf3Ebp0q/jKQnG1YYYqo75UISEVftl7rU32HqULnnnZAl/soO3PI0WDMf9jBoHL/7dkY7K
	7R+775L9qJlOQSo0i1EpQmJ7pgKUy++1WF2vUPUp9/82zto4ncwTiXXIsJN9UT1Mq6EOGkd6m
	snrBIPG3lAS27nKAsv4vdic8pt906HEh5kmnw6jO/7WRmQvesd29mOGo2FeMzs7/75EpqvgXP
	vS/M11D2+k8D1w3Drb/FBUNUaSOzL65ynVNsyARTxofgyh+n/Ex9qDFfowq4LJZe2zDxrlvra
	c0aO5HUjNEp96QbQw2HCxTvi/oKwi7iGiB8pj2ZJq/OMt3f69odgHYat4J8eLhI4QYzOyt766
	PXAo9dYKWgQ9+N76FPJz//Hpofvj0LGFcXOFSdT4nDlj8+7TMf3q3bRaOby8tq8d92Rq3zodo
	PCp3vKXmeVocjqYQtMLoHWYmdcJoydQZj/X228uyIO5sp2716cs3e3zn2wUYM5oL4wfqRUlMX
	kZszzWaZH/I+zT+08APdX/tA75hmeuYqi74fQCVMulF9HMDyXF/vDen7FHNw0hRQhKXjLGsjG
	u0joqELZbUcYZls4S0ePTFRmadEUQqmJcMh4E/mqMuz9BuYFFdfwU4P44i8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
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
X-List-Received-Date: Thu, 17 Jan 2019 17:51:47 -0000

On 11/01/2019 01:35, David Gibson wrote:
> On Wed, Jan 09, 2019 at 11:17:00AM +0100, Laurent Vivier wrote:
>> David,
>>
>> will you take this through your ppc branch?
> 
> Somehow I missed this one, sorry.  Even when I look back through my
> mail archives I can't see the original message of this thread.  Can
> you resend please?

As it is in the qemu-trivial ML, I've applied this patch to the 
trivial-patches branch.

Thanks,
Laurent

