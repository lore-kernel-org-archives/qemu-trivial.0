Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cEY7F-0004LE-NL
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2016 04:02:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cEY7D-0004L6-Fp
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 04:02:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cEY78-00016d-11
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 04:02:15 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:58082)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1cEY77-000159-Mi; Wed, 07 Dec 2016 04:02:09 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue004 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MQat7-1c6WfK0gRx-00U6VZ; Wed, 07 Dec 2016 10:01:51 +0100
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>,
	Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
	qemu devel <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
	<a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
	<8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
	<063dfa33-2015-e566-c623-d59578c20fcd@redhat.com>
	<13aed710-c5d1-b1de-5922-52e3e53029f9@cn.fujitsu.com>
Cc: Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <956d6c43-0904-e094-1adb-bb7c584967d0@vivier.eu>
Date: Wed, 7 Dec 2016 10:01:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <13aed710-c5d1-b1de-5922-52e3e53029f9@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:7B6Gdt/ZGAQjwFUqTw7fKVBKaZ+/o5LNECBCU5YjHqJGPkSiT83
	zfTSGF+S1KbUoBSyRlxX6w6TNnw6JZHz6RriUXxpAXrzS/X9g4SAmX1gw6AyFIHCIi9hyW4
	r3zFMbiaWqiPUxT8q3HoczWzFJVuWIIJzJv/JZmE1eVJsPv9OetpLdz+kp+Yi1/fG1rOXXO
	pjYAGJqTsAfKFgXd5mphw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:N36J2woPYvM=:bkf5clS8+AAjcWdAqHkl3Q
	dyyDnXfnPZYks9KO4/OeiJu7KjNd7ZFUE5tLqcyDqILoJnQR6fZXOV0F3nxoD+aSrEIMU4tuB
	31q6CdjANA2MxFXhuiEqTY6YmLRrIIvsb0aUMyKoqL8KJ/ygmyZGtEROfAFC6z+DKUyzfzwC4
	DnFaEIIrSKbAJnM7Ku8IYb1dTKL5ySpnYpFuR/T28K7rgOWScfSxD12txUoLjkbSqsoZPLlx0
	t/fli6C9eezRP/VjaC1CxoCLqRV3m7sPVbyQKL9IgiYX7vvSS2hxq1LNbWZCnfp+dS/Ugr/Ic
	lV/M//xUG2wY/uRhHCxk9wmTLk3dqgO08/D9RGUxjpIDWG+sfsCq7JnHHXFGTr8t0mtME3OvB
	1rbeqQoz0qtmPLO1564TjOpMlrn8JTewSgl0mFLzN99A6SAYpOTSf80rjO09oKADIipsFXUTr
	rkWpEwXcfbMhHMVGFcGLFefrZAa6nFfu+CN+3KEAyC/Mux5nz4PbYH6R2wrlUSrJk2aDKLaWP
	gTYxUinQy2DBHfsHQcCsOnhkiQHQ4C+lHy9t/ZzysyVLm0G+wNAGUi9Cjp51My0iEJlHnHsNk
	j87i1nVIht4MUZXSMTOU7s1/8tpWNJEdVwJolmy2sxrjX7iTCY6le5iteJZmG0quNjYJIYu41
	3RIWaJvrc2FpQQv9mGlRVPMUcwjbQEGZ1XjP9Tn6t03/m5HpwyqvreDhWq9YqYlI1XRsQtNZ8
	0mXde++qZppkG5+4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.8] docs: Fix
 description of the sentence
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
X-List-Received-Date: Wed, 07 Dec 2016 09:02:16 -0000

Le 07/12/2016 à 09:58, Zhang Chen a écrit :
> 
> 
> On 12/02/2016 03:57 PM, Laurent Vivier wrote:
>>
>> On 02/12/2016 03:59, Zhang Chen wrote:
>>>
>>> On 12/01/2016 10:57 PM, Eric Blake wrote:
>>>> On 12/01/2016 12:55 AM, Zhang Chen wrote:
>>>>> Say it in another way to make it easier to understand.
>>>>>
>>>>> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
>>>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>>> I guess that's because I suggested the replacement text to use, even
>>>> though I didn't write the patch.
>>> Yes, In that case, should I change the signed-off-by to acked-by or
>>> remove it?
>> You can use "Suggested-by:"
>>
>> https://www.kernel.org/doc/Documentation/SubmittingPatches
>>
>> Laurent
>>
> 
> Should I fix it? or can you pick up this directly for 2.8?

I don't think it is needed.
Perhaps Stefan H can take it directly in his staging tree?

Thanks,
Laurent


