Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gturZ-00022Z-B1
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 08:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gturQ-0001xU-LS
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 08:46:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gturO-0007wj-9P
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 08:46:00 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:40751)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gturN-0007cb-Kz; Wed, 13 Feb 2019 08:45:58 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MOiPx-1gig1v0bmh-00Q85n; Wed, 13 Feb 2019 14:45:04 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, imammedo@redhat.com
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190212052224.GA4839@richard>
	<20190212003414-mutt-send-email-mst@kernel.org>
	<4d6f639b-fe11-7048-3975-ee1c1875b8d3@vivier.eu>
	<3d700eed-5637-b05a-63c2-9f73a465bcb5@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <af33ffd7-a134-4d61-40ee-b128f5104153@vivier.eu>
Date: Wed, 13 Feb 2019 14:45:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <3d700eed-5637-b05a-63c2-9f73a465bcb5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:32mkEAKq4KpL5qMxPXexgfdhTAqfski2igbuRpJWolvHae62B2a
	FBCuXzvY8MqozIXm4xRgXPwLquGp6W1oepIaYOkGK8GPZKgyysrmBWOjE6jDfmCKwVLf9Go
	yb4R9uuANdnyOCBudoXPl4AzR7LAv0rIaiz35t6x+GAA2bvaQxfczcUGLxYDD4nA+NLtJiS
	RC08HgHDfgbbKfEtrU4sg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pqbWlpJM9og=:5vX1zceVf3zDuyjV10eVCR
	du+oQTMc5/f5iSzXQxFVlsWmV0fjTIILujP+/rCVdYK6g5Cmro461HcyT5zBL1xj1WrMWZb6w
	xGSuMVa6tIYyzNecPkr5fIaleCGL/DWMlY/ZNU7yofosxDyf7oYub3HzZnoFszaECXV5mn+Jb
	P2hOMWdSd5xKIjuZnXAEhWON81LjbQ4lkavpq9r/gJ7O6nTbff8aiKM1n6Xz++nPUJmLUTdYI
	3ORDcVqCG+06FsGQGfFkASx7dCeZH25r1odf6DHc1FXTwycHxQ0xFfHtbz5GhKzdMS8ZQWC+u
	eAfd613zfH2T0klWJ977y9d6Pld4KKJVOAQnpA6o5KfBSbkDQcwmszGCGYYH2U2e9E0/hWBsh
	18J6zHnV+a7ygdHQwQJVZ+sa+CDm4qZXbSvBO/YR/pXk4iQBFKNSfc2PIYcv3jTIfCHmLXo+E
	L5CHpI5HcEhvNfwXXo93QUWHrcnSvtyzMc5evH2W4MohURRA84vnRmmnicDEJcb10Q6ufKO2c
	clSY8MdaFoZW4yhWHmeKmEetu2wfs3gqhoEf8WoEyKFtyRbGwA8+zYe3Y1R3eeJpIs72dlqw7
	AaIC6lBpYfLJlAI7iDKjWbqNbDm/nTfH9BUCfjRayLFmnk/WK6tfOif+BUOv2oeiWjlBOESRp
	nbqjhJWX2/XOULs2qfI6GxVvOWixD/wIwqebxQ6XLeo0YR7Ty4aaPO+ZAkStYbIra7A0Hk5a9
	bcAzROEvbbyioHFWsoYficDKVWelWrJS+xdAkuNs0pmRZ/DA6bqb5rwtSUw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [PATCH v3 0/3] Trivial cleanup in hw/acpi
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
X-List-Received-Date: Wed, 13 Feb 2019 13:46:08 -0000

On 13/02/2019 09:56, Philippe Mathieu-Daudé wrote:
> Hi Laurent,
> 
> On 2/13/19 9:49 AM, Laurent Vivier wrote:
>> On 12/02/2019 06:34, Michael S. Tsirkin wrote:
>>> On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
>>>> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>>>>> There are several functions/variable which are not used anymore.
>>>>>
>>>>> This serials just remove those without functional change.
>>>>>
>>>>> v3: add ack and repost in a new thread
>>>>> v2: change commit log from "is now used in no place" to "in not used anymore"
>>>>
>>>> Michael,
>>>>
>>>> Looks this serials is not merged yet.
>>>>
>>>> Is there any problem I need to fix?
>>>
>>> Yes pls repost with fixed reviewed-by tags.
>>
>> Or I can take the series through the trivial branch and update manually
>> Philippe's lastname?
> 
> I appreciate the help with manual update, however Wei is not the only
> one having this problem (other developpers has non-ASCII in their name,
> and use such tags).
> I'd rather prefer we find a proper configuration setup to help the
> community.

I'm wondering if it can be a problem with cut'n'paste rather than with
git-sendemail.

I think the following tags should cover Latin and Chinese characters:

Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks,
Laurent

