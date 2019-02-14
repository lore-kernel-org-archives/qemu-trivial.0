Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guD3l-0008J5-0S
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:11:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guD3i-0008Hv-Or
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:11:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guD3h-00082G-SC
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:11:54 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:59017)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guD3h-00081U-JJ; Thu, 14 Feb 2019 04:11:53 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MKt3r-1gdWBK0Krd-00LEPN; Thu, 14 Feb 2019 10:11:39 +0100
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, imammedo@redhat.com
References: <20190212052224.GA4839@richard>
	<20190212003414-mutt-send-email-mst@kernel.org>
	<4d6f639b-fe11-7048-3975-ee1c1875b8d3@vivier.eu>
	<3d700eed-5637-b05a-63c2-9f73a465bcb5@redhat.com>
	<af33ffd7-a134-4d61-40ee-b128f5104153@vivier.eu>
	<20190214000317.GA19899@richard>
	<3dd545f2-5346-2b01-8725-5f35cbaa0ae5@vivier.eu>
	<d69dd1c9-aa58-4b03-6b9c-1cde7bed83cb@vivier.eu>
	<20190214081828.GA19789@richard>
	<33fc1da2-144b-22b5-bcb1-f85fab64b623@vivier.eu>
	<20190214085133.GA20720@richard>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <416c3eee-1981-9536-011a-e52fd4763da7@vivier.eu>
Date: Thu, 14 Feb 2019 10:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190214085133.GA20720@richard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qKPdN4SRS0SInQl6PY/bvaGxU0Tbf8aw4aZQGwmSfBsfOgeVb4E
	Vsc4rDJP4tQima+xcLqLmHlyzmi5bnNj8M6sKvgy3TPTDK3zxfLsKzapbA5+udh2hkLHGTa
	jvSZ67lxkH5Rb+UXkux0BGsWUnnMeNu30r86ezGcsxqevmmxU0fmMWOdf9qWiWpV5XK+g4k
	Mgcj97X0h29SxwvSm78fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hL8kZc6P92I=:BwFhZM0xUOpv/dZbeo0dUf
	DzPWvrLvzXR5KWwfCGGBkfgfaW0P2m2kOeutB7MN5mlkiGvcfPwILQ1kXFJRytEDuziuG3l8C
	PNNncAA0YaJQDNFpAGhtP6iQW4wsjtXi0NskYzwx7PIEXQXV2TU732Cxt6yGdWUKOCdF2aHxI
	x0XSCSGp9x+TeRqMvkQ4GkzNEe6XoCSP4pGc29NT4fH21lZxRvgDdsbOWxNvtOxaFJg9Yu6S/
	pQ4VN1F1Fi9QTwFHoba6c4B2zeU3ulvOKWr4DnhaOVY9qGdop2K0wNkHX2GJBiU+jCOwgKd5F
	oUOS0fGPSzOk65LoBg+4NHyv2YmE6PNLNUm9EC9Z6zhe/RzfZhHp42AzANxAbdYUhTWkmk95I
	rwmKo08amdxydh3miwoNj05sjsUTJpC4tVIhZ4f0yeqprA94fsxaEaGp29Kp66Q+oSNYBR5De
	XVfyojuIZocJB/fdWUEZcB2QDI1sSpWLpZ8TrCSqff70cDAUXxBJpxuKJhszposMKeUyJ3s1Q
	yCSZLqdIOGvPo82z5II+tqrAS9rEP5nu2yp3eB43VYkeU9e6qT4LzHE/zrNsFv8KlG3tLOix/
	QFr6/GZ4homCV4e0KMAH0orDlF+cXIe7cvV36BVzR8XWsxt90tFu3ueToxdyMBHBpniISjZbl
	izG34vsv3PnWBV3fiXJ0tTglDCFvrr+7JiYXR5Biq3wtHhtDYlTD/6OqaZrTfy19qAS2W+SQz
	OtnbpFN/VtsXjJ8F6A70sAHNbpL+O9Gvc47w/WfXDlvnMxbMzXaAeb/nwgU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
X-List-Received-Date: Thu, 14 Feb 2019 09:11:55 -0000

On 14/02/2019 09:51, Wei Yang wrote:
> On Thu, Feb 14, 2019 at 09:23:39AM +0100, Laurent Vivier wrote:
>> On 14/02/2019 09:18, Wei Yang wrote:
>>> On Thu, Feb 14, 2019 at 09:10:14AM +0100, Laurent Vivier wrote:
>>>> On 14/02/2019 08:57, Laurent Vivier wrote:
>>>>> On 14/02/2019 01:03, Wei Yang wrote:
>>>>>> On Wed, Feb 13, 2019 at 02:45:01PM +0100, Laurent Vivier wrote:
>>>>>>> On 13/02/2019 09:56, Philippe Mathieu-Daudé wrote:
>>>>>>>> Hi Laurent,
>>>>>>>>
>>>>>>>> On 2/13/19 9:49 AM, Laurent Vivier wrote:
>>>>>>>>> On 12/02/2019 06:34, Michael S. Tsirkin wrote:
>>>>>>>>>> On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
>>>>>>>>>>> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>>>>>>>>>>>> There are several functions/variable which are not used anymore.
>>>>>>>>>>>>
>>>>>>>>>>>> This serials just remove those without functional change.
>>>>>>>>>>>>
>>>>>>>>>>>> v3: add ack and repost in a new thread
>>>>>>>>>>>> v2: change commit log from "is now used in no place" to "in not used anymore"
>>>>>>>>>>>
>>>>>>>>>>> Michael,
>>>>>>>>>>>
>>>>>>>>>>> Looks this serials is not merged yet.
>>>>>>>>>>>
>>>>>>>>>>> Is there any problem I need to fix?
>>>>>>>>>>
>>>>>>>>>> Yes pls repost with fixed reviewed-by tags.
>>>>>>>>>
>>>>>>>>> Or I can take the series through the trivial branch and update manually
>>>>>>>>> Philippe's lastname?
>>>>>>>>
>>>>>>>> I appreciate the help with manual update, however Wei is not the only
>>>>>>>> one having this problem (other developpers has non-ASCII in their name,
>>>>>>>> and use such tags).
>>>>>>>> I'd rather prefer we find a proper configuration setup to help the
>>>>>>>> community.
>>>>>>>
>>>>>>> I'm wondering if it can be a problem with cut'n'paste rather than with
>>>>>>> git-sendemail.
>>>>>>>
>>>>>>> I think the following tags should cover Latin and Chinese characters:
>>>>>>>
>>>>>>> Content-Type: text/plain; charset=UTF-8
>>>>>>> Content-Transfer-Encoding: 8bit
>>>>>>>
>>>>>>
>>>>>> Looks not work.
>>>>>>
>>>>>> I have tried this and also with 
>>>>>>
>>>>>> Content-Language: en-US
>>>>>
>>>>> Could  you send me a gzipped version of the 0001-XXX.patch in attachment
>>>>> so I could see the real content before git-send-email?
>>>>
>>>> OK, I've got it.
>>>>
>>>> What I see is it is already corrupted, thus the problem is not with
>>>> git-send-email.
>>>>
>>>> So either it is corrupted by git-format-patch (which is very unlikely,
>>>> we could see that if you push it to a public git repo) or it has been
>>>> corrupted when you have added it to the commit message.
>>>>
>>>
>>> Hmm... maybe you are right.
>>>
>>> But I found confused how to fix this.
>>>
>>> When I use git commit --amend to fix it, the character looks good in my
>>> editor. I use vim as my git editor.
>>>
>>> But when I use git show, it display an unknown character.
>>>
>>> And if I use git format-patch, the patch file looks good in my vim editor. But
>>> corrupted if I use another editor.
>>>
>>> Do you have any idea on this?
>>
>> What is the result of command "locale" in your terminal?
>> How do you copy the characters to vim?
>>
> 
> Hi, Laurent
> 
> I tried to copied the character directly from Philippe's mail.
> 
> This time looks good from my mutt client. Hope it works for you.

Yes, it's fine.

I let Michael to take the series for the pull request.

Thanks,
Laurent

