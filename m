Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFds9-0007de-9Z
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 07:32:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFdry-0007Ny-DW
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 07:32:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFdjp-0007YD-2M
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 07:23:41 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:43965)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFdjk-0007W3-Ef; Thu, 25 Oct 2018 07:23:36 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MgeXk-1ffE3I2vaG-00h4W1; Thu, 25 Oct 2018 13:23:28 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MgeXk-1ffE3I2vaG-00h4W1; Thu, 25 Oct 2018 13:23:28 +0200
To: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>
References: <38b0df70-338e-c842-95bb-c1a5fbd54b7b@vivier.eu>
	<678d990b-e016-6ce0-ec8b-39891dc56a90@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cc025e74-395a-b278-ba9d-a49b513f012f@vivier.eu>
Date: Thu, 25 Oct 2018 12:23:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <678d990b-e016-6ce0-ec8b-39891dc56a90@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vgKspIKDsyPLEX39mSAcsH6CNUOdRIQk2hlbbFut+0QAmq46IGg
	X/myimODf3umWHjv0BuBQMKd7B9QBYoVA6eaiKELNuDTKRXLQiqee1G123qoFN2ZBKvIJ+h
	jKlx4koOLAVWzsb4Q5jxonbQeGb8gq1CXahboGV1cGrDWqqKqRs9i4on37K2Fi/3RCgQKAg
	5Xw6CitSZ9X2qbEaiT3hw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:LgoAsY8NNkE=:kVCOCYmYzIl0RBSRnD6adW
	hLGLZz01csr32PTC2Oh66WEEAa2TTygrJ9sUFA8YvMHoqpoXvMHtA0ZG4ylltgX2yUaljh2LZ
	DPc+2KXU3dVbKhjWLpJPjRe+5mL2gu+yZujkqYhtzPmxElQu9ZWaJ0JaLBUs32ACnmsccIwr2
	LPQV8F/QbSIT/g7b4EwN9Wqu/EKgpr+tYt+KkZfbima/NloCzcHeLGFe7WCSf7mnvVYZfnK/N
	0PfQxxpeR8aecG0Ql2wQTfK5KdkrWUDWObrvAdijm1bhalY5PmSiEnSi07NytFWr30ChNJi1U
	xlbY29yxQVkyowDRbUGnGA1GlaU1eOoLreolk9hatVJyhJ6bp0ydoUIOpSRJV5oyrnzfr3hcH
	HVuojIG9lQ8ckENumkrVH8tXUaeUiivE5J5CNS6kbNNqA9o+aIJj9n+SdgpuADiTB8I4mOgNt
	e3EPxV3Wy4j95dX3ndtBB7mVaP+pgxmXe0jLikIY44pC1iPRgXl4g4AaFwMgckSWAnD5tXfb8
	Yh0ZTe18WHbg339a9nkRJPhrVU5X92KYOK63JIxsDnq+K44k5vnZvvQShtHkhKEfmJhi8OnMI
	ilhr8wTYkoKnIDhU2+4Chl2nLfQpEbPIz6WYZvihmUeGaOItVI2/7ylA1UkqgvAvKsc4x5SLE
	VkxWkd0Nsj2BZKWtIMEdfPF+n23rXT4vRCh4L06RjEg+mnzWgPrd6RleRYJuGO9fizr2NzvcT
	mx/c0MUbzGhku7Z2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [Qemu-devel] Call for patches for the
 qemu-trivial pull request
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
X-List-Received-Date: Thu, 25 Oct 2018 11:32:14 -0000

On 25/10/2018 07:56, Thomas Huth wrote:
> On 2018-10-23 11:04, Laurent Vivier wrote:
>> Hi,
>>
>> I'm going to collect patches for the next pull request for the
>> qemu-trivial I'd like to do before the softfreeze.
>>
>> As we didn't have any pull request for more than 3 months and some of
>> the patches have been pushed through another maintainer branches, it's a
>> little bit difficult to collect correctly the patches to send.
>>
>> So, it would be helpful if any of you knowing that some patches have to
>> be added to the pull request send me their list.
> 
> For October, I'd suggest:
> 
>  configs/alpha: Remove unused CONFIG_PARALLEL_ISA
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-10/msg00081.html

Applied

> 
>  vga_int: remove unused function protype
>  https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg04798.html

Applied

> 
>  piix: use TYPE_FOO constants than string constats
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-10/msg00071.html

Applied

> 
>  memory.h: fix types in comments
>  (title should be changed with s/types/typos/)
>  https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg01570.html

Applied

> 
>  tests/tcg/README: fix location for lm32 tests
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-10/msg00007.html

Applied

> 
>  qemu-iotests: fix filename containing checks
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-10/msg00008.html

Applied

> 
>  qemu-iotests: make 218 executable
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-10/msg00009.html

Applied

> 
>  docs/devel/testing.rst: add missing newlines after code block
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-10/msg00011.html

Applied

> 
>  scripts/decodetree.py: remove unused imports
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-10/msg00012.html

Applied

> 
>  scripts/qemu.py: remove trailing quotes on docstring
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-10/msg00015.html

Applied

> 
> ... will try to have a look at the previous months later ...

Thank you Thomas to have done this difficult work.

The collected patches are available on my branch:

git://github.com/vivier/qemu.git trivial-patches

Thanks,
Laurent


