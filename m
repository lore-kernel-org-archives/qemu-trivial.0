Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guC6R-0004bB-3Z
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 03:10:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guC6O-0004ay-UH
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:10:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guC6N-00007v-VK
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:10:36 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:40041)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guC6I-0008KE-CL; Thu, 14 Feb 2019 03:10:33 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MJn8J-1geb9V2xYn-00K7p9; Thu, 14 Feb 2019 09:10:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, imammedo@redhat.com
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190212052224.GA4839@richard>
	<20190212003414-mutt-send-email-mst@kernel.org>
	<4d6f639b-fe11-7048-3975-ee1c1875b8d3@vivier.eu>
	<3d700eed-5637-b05a-63c2-9f73a465bcb5@redhat.com>
	<af33ffd7-a134-4d61-40ee-b128f5104153@vivier.eu>
	<20190214000317.GA19899@richard>
	<3dd545f2-5346-2b01-8725-5f35cbaa0ae5@vivier.eu>
Message-ID: <d69dd1c9-aa58-4b03-6b9c-1cde7bed83cb@vivier.eu>
Date: Thu, 14 Feb 2019 09:10:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <3dd545f2-5346-2b01-8725-5f35cbaa0ae5@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NYQr1jhOnPvBPxuej/ebPt8bit2kBSpX54+LfbtXKL2E03MDxjk
	bt3z0Xmx9j+ynxyZfbdilp8n6oppJWPIP2c9+IhPdwPUk56jWd5ZNuPrTFhvsOp4+GGXc8e
	ao+LUP6HcgSZ7Bz4lbJYI6D/dphwCssst3QKK/zrhVLkpiSs/jczE1GAPo+aKlY0GdbPCBz
	uivQE23JRL4ZtfPxUrwug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wJtwB4Lg2Bg=:95+LfRUZqTAM86YdMtc7we
	5monRALWS3vlPLgth9Moj+1M7cOsVd2kMmUj6F5Ne43wNOWKS1ySpT1vt6+y5yQwO2SaIHM6w
	8EKDnmacGdJ4+9iYRMRPoNZMTmc3rJsiyr7dQf9EBwRiJkAbliP+J621XJrPJji8hl0npmxAg
	pbUOm1CS7zBzmPOPwK3Z0TWyLzjvprPbQ/XP6yfh0muiFIs5SC82lWP3/0l4WCFwuHqN+h3aY
	UdQuQX/H5+v5IIwjH3cHxO4EGpQJDRjygjKFcaJcglaPgh1gx+WoxUcdMwzbE43o5Wgda63xP
	1Kr/1mhkQx+tz2f0+PWirsYZktjaotNBqepfGpiBZbrb6/gj5HTPfS1Jd4l/e0g6CSIi5jv5E
	B6YT329DMDW1I7Oo+oSD5ingOmSorICAfOiy3tsZD5bkT43DvH0dbKNaKwUVV4JUTzzfnuJza
	3m/5s+3sUX8q6nyJLzqL2/olGz10xXX6LiqqufSNkFXGvHmrjIugRoCaBoHCuPkXTebMJDw8y
	yOXUOUO79FkNjPPMWonTcXqzgv3F98/n3vInRvLPzeppyFzVg3jH8iP/SVDT8v4Up0mdVOEYC
	xrfBu7c9mZVDN/y51qPVwN9DF9apKhQ3hCnWl0ISwmGlg53l2GbJM5C3A7x9ATEOzyXKnHgOY
	TMxS0/9PMQ7lEuBmpBVcUAVCnSJNdDwH7NQNuirI7Sfk2kEF2Io7N8v3Q9oSuqBYZudoGGwPY
	452x126nYDJ8yo6m5zQO/3aIttl78j2i30pUSRtcQ+xtXj3xQsIQBMb5BgI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
X-List-Received-Date: Thu, 14 Feb 2019 08:10:37 -0000

On 14/02/2019 08:57, Laurent Vivier wrote:
> On 14/02/2019 01:03, Wei Yang wrote:
>> On Wed, Feb 13, 2019 at 02:45:01PM +0100, Laurent Vivier wrote:
>>> On 13/02/2019 09:56, Philippe Mathieu-Daudé wrote:
>>>> Hi Laurent,
>>>>
>>>> On 2/13/19 9:49 AM, Laurent Vivier wrote:
>>>>> On 12/02/2019 06:34, Michael S. Tsirkin wrote:
>>>>>> On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
>>>>>>> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>>>>>>>> There are several functions/variable which are not used anymore.
>>>>>>>>
>>>>>>>> This serials just remove those without functional change.
>>>>>>>>
>>>>>>>> v3: add ack and repost in a new thread
>>>>>>>> v2: change commit log from "is now used in no place" to "in not used anymore"
>>>>>>>
>>>>>>> Michael,
>>>>>>>
>>>>>>> Looks this serials is not merged yet.
>>>>>>>
>>>>>>> Is there any problem I need to fix?
>>>>>>
>>>>>> Yes pls repost with fixed reviewed-by tags.
>>>>>
>>>>> Or I can take the series through the trivial branch and update manually
>>>>> Philippe's lastname?
>>>>
>>>> I appreciate the help with manual update, however Wei is not the only
>>>> one having this problem (other developpers has non-ASCII in their name,
>>>> and use such tags).
>>>> I'd rather prefer we find a proper configuration setup to help the
>>>> community.
>>>
>>> I'm wondering if it can be a problem with cut'n'paste rather than with
>>> git-sendemail.
>>>
>>> I think the following tags should cover Latin and Chinese characters:
>>>
>>> Content-Type: text/plain; charset=UTF-8
>>> Content-Transfer-Encoding: 8bit
>>>
>>
>> Looks not work.
>>
>> I have tried this and also with 
>>
>> Content-Language: en-US
> 
> Could  you send me a gzipped version of the 0001-XXX.patch in attachment
> so I could see the real content before git-send-email?

OK, I've got it.

What I see is it is already corrupted, thus the problem is not with
git-send-email.

So either it is corrupted by git-format-patch (which is very unlikely,
we could see that if you push it to a public git repo) or it has been
corrupted when you have added it to the commit message.

Thanks,
Laurent



