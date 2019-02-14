Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guCWK-0002lI-8l
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 03:37:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guCWC-0002VN-H4
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:37:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guCJH-0000gN-9M
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:23:57 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:58629)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guCJD-0000d6-I3; Thu, 14 Feb 2019 03:23:53 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MTANt-1gVDLG0TCJ-00Ua4y; Thu, 14 Feb 2019 09:23:41 +0100
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
	<d69dd1c9-aa58-4b03-6b9c-1cde7bed83cb@vivier.eu>
	<20190214081828.GA19789@richard>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <33fc1da2-144b-22b5-bcb1-f85fab64b623@vivier.eu>
Date: Thu, 14 Feb 2019 09:23:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190214081828.GA19789@richard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1D5j8w0qJMd0Mrzmg70FgzcooErzvdsn8UrmdhwYSFwOK1lsgnA
	ZZzw8O7EvbCAuRB9bvqUkmKnVehZdaA1IOpO327SjuUxozZ51UMMo+MokejKVtTo64C2X3F
	d2+23FbdjrO9oIIKN0QcGCyY+wC+P1SYr0Y08gbu2p2z+gxkqoMjPZK3IDRdlLt8mgKOZuN
	TldH0mYT1/yR5DZREuw0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xFEQgdyzzdo=:fR7xr0h+yEYVGyOfj8t9Iy
	51qqBjRvtY7rjofAdxFJc3SEZmXbvf/e+kwaWoKXzWIui46Y8iaz5y/u1JB/hMCmusMItAXVs
	ZvlojJo/Vm3qhgRlishxvwsWOHd6OBHHbjHdrqiKs0mTERhmHMEIBLvSJAgZOHDNUAjPgo8UT
	QIJoreNpQaQo2vRaPPKXnzylypQPpoulIHxMaALyInEIMpzAq08dQ4JWCJpEaYwsLhUnHYjue
	Z6hwZ+eBDLArWxoY0ERYBrSiXxfyX9zc6agf8xXjWsWYtWajkhD9K9Ot49W8+aq5zyuSyN8du
	ksKZCzA6lzVVlnSLnGmbBrU8j6z90ArPsrFcNfd1x0eGa1pYynXOQUf6S2+QYzbbt6od4zlST
	uyhBl7qr/v1fo31M8Gqbvdm0eh5VYKS/BxWst1uH0WyC60jJfIFbP5g8SiFdaskPYLTjMLljH
	8Ey0KOt2l5GW58x5sjpE+k+I7PJA/Pb9QlH+aRjUPR3+UsMI+95hP3mbj+DDB2OpothMoZ45s
	WNr7tYPvEqhx9h49JRcgqtHOPoQDgxcpOv4a5MSUokPCGS0w1LhU7LbhFLgmkv0kNj+cqr1ZC
	kMAEf6LJ5EdPNf4GqCxhIEL0r8tgwIkUxHX6f0CV87GyRNXiv1/pFFe9RsDW7zupdMsHDTh8+
	UsJ0u4gXzgK/vPQpuw4/W4Tres9y2jv1Ap0S1qpsLGGPLQnBruKAIONi2eeKrpZSgSKFEe/W3
	yCdGvGuj91a50uXowInU4zwlpI0HaQRXg5yz9W7iJ3vLIL2BEpD0d7Iu8hjuc8E5U+YRpxyOC
	6FJ9WINpHDOARsiqxC2qsyaSkc+/YZqbG53WtxnPuym8uKGYVVGkSrWSw7ILbmOd19SBnIsS+
	+nXu3f1hL8jFK76s7FMskeZluzvFzrp3W6sTADQoybzKb9VKsN0kckfgwXabyWxu1AjAnZeDb
	qOpLaEbrVoA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
X-List-Received-Date: Thu, 14 Feb 2019 08:37:22 -0000

On 14/02/2019 09:18, Wei Yang wrote:
> On Thu, Feb 14, 2019 at 09:10:14AM +0100, Laurent Vivier wrote:
>> On 14/02/2019 08:57, Laurent Vivier wrote:
>>> On 14/02/2019 01:03, Wei Yang wrote:
>>>> On Wed, Feb 13, 2019 at 02:45:01PM +0100, Laurent Vivier wrote:
>>>>> On 13/02/2019 09:56, Philippe Mathieu-Daudé wrote:
>>>>>> Hi Laurent,
>>>>>>
>>>>>> On 2/13/19 9:49 AM, Laurent Vivier wrote:
>>>>>>> On 12/02/2019 06:34, Michael S. Tsirkin wrote:
>>>>>>>> On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
>>>>>>>>> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>>>>>>>>>> There are several functions/variable which are not used anymore.
>>>>>>>>>>
>>>>>>>>>> This serials just remove those without functional change.
>>>>>>>>>>
>>>>>>>>>> v3: add ack and repost in a new thread
>>>>>>>>>> v2: change commit log from "is now used in no place" to "in not used anymore"
>>>>>>>>>
>>>>>>>>> Michael,
>>>>>>>>>
>>>>>>>>> Looks this serials is not merged yet.
>>>>>>>>>
>>>>>>>>> Is there any problem I need to fix?
>>>>>>>>
>>>>>>>> Yes pls repost with fixed reviewed-by tags.
>>>>>>>
>>>>>>> Or I can take the series through the trivial branch and update manually
>>>>>>> Philippe's lastname?
>>>>>>
>>>>>> I appreciate the help with manual update, however Wei is not the only
>>>>>> one having this problem (other developpers has non-ASCII in their name,
>>>>>> and use such tags).
>>>>>> I'd rather prefer we find a proper configuration setup to help the
>>>>>> community.
>>>>>
>>>>> I'm wondering if it can be a problem with cut'n'paste rather than with
>>>>> git-sendemail.
>>>>>
>>>>> I think the following tags should cover Latin and Chinese characters:
>>>>>
>>>>> Content-Type: text/plain; charset=UTF-8
>>>>> Content-Transfer-Encoding: 8bit
>>>>>
>>>>
>>>> Looks not work.
>>>>
>>>> I have tried this and also with 
>>>>
>>>> Content-Language: en-US
>>>
>>> Could  you send me a gzipped version of the 0001-XXX.patch in attachment
>>> so I could see the real content before git-send-email?
>>
>> OK, I've got it.
>>
>> What I see is it is already corrupted, thus the problem is not with
>> git-send-email.
>>
>> So either it is corrupted by git-format-patch (which is very unlikely,
>> we could see that if you push it to a public git repo) or it has been
>> corrupted when you have added it to the commit message.
>>
> 
> Hmm... maybe you are right.
> 
> But I found confused how to fix this.
> 
> When I use git commit --amend to fix it, the character looks good in my
> editor. I use vim as my git editor.
> 
> But when I use git show, it display an unknown character.
> 
> And if I use git format-patch, the patch file looks good in my vim editor. But
> corrupted if I use another editor.
> 
> Do you have any idea on this?

What is the result of command "locale" in your terminal?
How do you copy the characters to vim?

Thanks,
Laurent

