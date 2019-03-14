Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4RvZ-0002V6-9w
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 11:05:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvN-0002Ny-PJ
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvK-0004iT-0Z
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:37 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46767)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h4RvJ-0003Uj-Bg; Thu, 14 Mar 2019 11:05:33 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MmQUL-1geQcJ3JpJ-00iUr4; Thu, 14 Mar 2019 16:03:42 +0100
To: Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>
References: <20190314104622.101715-1-sgarzare@redhat.com>
	<30b41a92-66da-2fe4-b550-1c1db2ab5189@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <15a580d9-c15e-bb88-ffeb-5a8e3b30814a@vivier.eu>
Date: Thu, 14 Mar 2019 16:03:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <30b41a92-66da-2fe4-b550-1c1db2ab5189@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:tjE4VJE+Rd6H+zxsyFlg7kWCxD9vyziOpeUcahzDH/gCu0NjyRY
	2jJzOdX01ZcQ8AhZAA796FHWV4VoDDiALBw1RX2XxCCPOFT4VILFFzhdTS3WPFSRXS4y5Xr
	jo2uCCQIV3thIufbcuBHCTz5kl26ty9xOx5GTw0POwKSCMoa1bm6aOXtSP/CGN1E4L5IcHZ
	ir1BPDFGTr7SbitanWNnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ykRDdcVHsHs=:qR2Sbv67gQYUELbiyKMNy3
	8PVGWttj0h003GWH7ne6Tqc0NsOdNfIt7YrqVYoC5DUr6g/nKkrIVcG47hIb5H8znPMHXhmr+
	zQao795Fa0dqaVTKzKWJO0cQjwg4YpUHR6aC8QomwJgiTcmF83yZ7A/AmQqgAndL6JXOtop+C
	2eaGMLYGsyZD+OUP73Y1qy+WQoh23yA34vDyBi3o238XCX/ZxjNZfd592hua9WIF2Brk93z0W
	iB+Nabt1LuKHi73jy20vbetZU7nPsl99t+6NoQ0ZcYc6FcTBQiqq3XGTuklhKv0EO/SnNSAsr
	k106RA94w7MXGo/ZgJDjYNfTcum5mcm2RteW3yzG+QbMEKjgI7UI7/ekXw04aK8y5i/JeMwWB
	vz13LfX3dsl7nYNF4nFhl38SUlYcklpHooogU9arXQZ1doM3JBMEfRNbSyTAtNwU65FEkvNxp
	YnK70OBAfMwPtty637W2pFNiD/N6RErm7b+m7S2WOj3D5rl3Oe7MA61fegswBN8viQndnbJA1
	P4pbqtT9hz2CJc0SfkK8rMdmfrBn5GGb/uQmulZ63mQj+AZC5M8+A6du54Ma7wP2MzLKRYlHf
	sdS8XUthGQ/UT6wWCrHWOVV5+DTWnmnjsfa8bxUxjNDKIuoq8av1Zl3+g62KFlY8bDR7gWtlU
	ZSnYkVowEZOVe2NNLrWeixZ0NeU9kkkIzB8k4n4/YGLD6Tlp5IxXgguyVtqeXxkaWPGy1j0wW
	jyXMO4jhGA6rjBWbDNunL09LHrULcfT1pIDOkUiuQ7lhBBmDzS7C+39Hcig=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-4.0 0/2] Update
 .gitignore and tests/.gitignore for in-tree builds
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
X-List-Received-Date: Thu, 14 Mar 2019 15:05:48 -0000

On 14/03/2019 13:27, Eric Blake wrote:
> On 3/14/19 5:46 AM, Stefano Garzarella wrote:
>> This series could be useless when we will no longer support in-tree builds,
>> but for 4.0 I think it's useful to ignore these files.
> 
> series:
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
>>
>> Stefano Garzarella (2):
>>    .gitignore: ignore docs/built created for in-tree builds
>>    tests/.gitignore: ignore test-qapi-emit-events.[ch] for in-tree builds
>>
>>   .gitignore       | 1 +
>>   tests/.gitignore | 1 +
>>   2 files changed, 2 insertions(+)
>>
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

