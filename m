Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWlvx-0001bR-1m
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 12:35:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWlvr-0001aL-Fd
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 12:35:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWlvo-0007A6-Lj
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 12:34:55 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:52273)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1gWlvo-000792-Ap
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 12:34:52 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MryGj-1hHbGJ0R5J-00nvpH for <qemu-trivial@nongnu.org>; Tue, 11 Dec 2018
	18:34:50 +0100
To: qemu-trivial@nongnu.org
References: <20181121153036.2941-1-famz@redhat.com>
	<bdb6e6b7-0da0-d2aa-893f-a14e16230e4d@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d4bd40db-4387-1c64-3ebd-40f4799a22c1@vivier.eu>
Date: Tue, 11 Dec 2018 18:34:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <bdb6e6b7-0da0-d2aa-893f-a14e16230e4d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a5kEI3r22hWsoyJsajZtPev/8ffW/EWKDYzfM2Q1jcM4jVxngXT
	EBFHinth+fyiAOHGQliFfDj0C8zB3BIE8ZqtUZ9vKj9LUNtVLZZ0Z8aNOhXdO1Qz0WRLyAU
	qPSWVTXIfXqD/pBcUjJqXCifMoNGtK8jXmB55FoQdB1VmHJav8NuceNRJ+/PMNlgQH/7kVe
	CTwJ3DW0ossw4/Q6fbYfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cp6S7dm4xt8=:zSh6Fs0niAA8KZ3fNqueMJ
	nEmngYGgXeYclOTKhtGHVKdH/0qmSLX74VnVLipB0sUmxEhbFiZX2SHv898qb4GiJd2eMVwCl
	S4wPcj2DBptG6jCfWD/EyZxZAOlzyMlbdYMnb4Eo2sBuVic0P7uevc56O8+KEQk2C4UXF8TlK
	au8cyH17hd8EgcQjGnPv6XAnDEaPvWCDLAjO4XXo3YgB3tl8Oj//RhxwbyIBOShWxKeVTIfES
	tWOa2qsYTqqED5AGVxl0XdGyoJRHICAfBK2BdNdaR0CVd4HVtdCYxWZLNp7N521REDriWDpR0
	2dsenCH9v5Q1cNjY/bdVMFqd3CmrQD728YW370W3cHrwTmrolw0Z3wGwxJR8CmN7lnfJXbs86
	ts+9xy2+ut+4jWNBStbzlDzx572+APCfVC88DbqSxUb3xkQP31u0bTrNy3rAYlTn23ADbnP4U
	2w4tycyEyz9Ls18UYoS8rH3wxIpBBq9R+1dPBu+a1eN7NuyHYuR7xxJP6z1CJoHipUbl+9fUq
	SjRxgnGTwA3/NJ5N+JAnggHBpMxFlAN0rThQdG3VEIw6dfeKjtn7pMZxzRECWhV9b4KIUHkeJ
	LKOC22rHu19r88mNq7c+l3HhZgJa69R8HyEzvmfiZr5ckx4GmBns7BhoktCb9PUrArAmacnBG
	bJvDAw+5CE0XOY9pAC40/M8oEEMfIdEaRz+HyffiO8i1sjq1atlHqzP9V7TUuXNXzp8YfLv0Y
	i1hNuf4lAa/SAFDfdWzLtH2FNHNwY4/Ypkv1qzfaRoiz9R+75v96V55HZ4I=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Update email
 address for Fam Zheng
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
X-List-Received-Date: Tue, 11 Dec 2018 17:35:00 -0000

Le 02/12/2018 à 00:17, Philippe Mathieu-Daudé a écrit :
> Cc'ing Trivial@ & Peter.
> 
> I seems this email is now over, thus it would be nice to have this patch
> merged in 4.1 early opening.
> (Does it apply as a fix before the 4.0 release?)
> 
> On 21/11/18 16:30, Fam Zheng wrote:
>> Since I am about to change company, update the email address in
>> MAINTAINERS to my personal one. Depending on responsibility changes I
>> may eventually fade out in some of the maintained areas, but that will
>> be figured out afterward, or maybe I'll use the work email later. For
>> now, just do a search and replace.
>>
>> Signed-off-by: Fam Zheng <fam@euphon.net>
>> Signed-off-by: Fam Zheng <famz@redhat.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

I've applied it to trivial-patches branch in case no one takes it

Thanks,
Laurent


