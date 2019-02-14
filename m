Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guC0A-00022U-84
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 03:04:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guC08-0001jr-E8
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:04:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guBuH-0007BD-NG
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 02:58:06 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:52191)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guBuH-00078d-D0; Thu, 14 Feb 2019 02:58:05 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MBUuP-1gmmhh2TaJ-00Cvka; Thu, 14 Feb 2019 08:57:46 +0100
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
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3dd545f2-5346-2b01-8725-5f35cbaa0ae5@vivier.eu>
Date: Thu, 14 Feb 2019 08:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190214000317.GA19899@richard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W1W6z3u8dZF6cbNAauN+vI2bIzMrQAmFWG0ZNAhvjnLl0Fg8ual
	0mo/TQaYgylgxierAKH2pvxX3iHVkounLALx6T9AnrsUZbSj7aTHpBD4NQM/c7rLBvkqdQE
	XDsUY1zAlbcJjwW44SBGZuaYINL9ug8S5Z6Q6EqW29dW9ahuwm/bII5lEf/LKLcAiF3ovFW
	XSeW4epsnhtoU9lvfwmrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A+iSazH73iQ=:88NX9v1tqDoEEZZV36lQZ1
	ZNjszAk9IcBhAP3B9SkH40OCC8S99Ichk6M4rvfZApGkG4FXzin8qko1vcHp8VViA6E2coAEQ
	ofa8zSvZmuv/FZUX9k/GIJ8c2B3X2hshPkIzo0q9u+n7lUzpLU0HYAmNiQc4K1lRZZbp88fdi
	60XLigh5+Q0EuCYmjtfg5+8S+sN37YyRv7cY0ugFQinF9Di2WaDpRPl6iD4By4zBNGRieO8mx
	y8YYX/xe5GZJ0+9WidMXg0mwKwtZH0sH0xChnB9Y7mn6WKZKCASAsnjm2E0yqlxkjNob3wxLC
	ntp64ARLa/hLX6ezKyd2eXUUPkaqQdOL5/VUQoGv0EQ60ThBmeXL0kZm8xc0MClpr6A8bwVj6
	UwOnZsW1MI0Ug6563kj+wbPJf1gbyvU408ks6qKpMc7gn/WsNbGdEjTaF7pHkXsYsDzze3++i
	NDTreZxIBZjIEN/2ExS4htv0RmZdJagGjGfUiJl2ERZzqdWzVblRdr/PJj78BDvaA6cxAnmcN
	yBgeJZ9HTBVtdUSGkuzMai9/170dszBWWE9tkWK360s5wxJhBUaxnKWkSbm9JlGcXPXJCm/+K
	oD3YlKCO+t1sFFeuJxfnYueW/8VthlXhr7150GJKuw8u+mqz0yUTpnMgN9Xtr5JLY6I/VtJ5j
	c/sQdgX1k74CRh7WVHmM7bxwWXpTjnfaezEgb3ihHUmCvfe9f5PCeKEs6dfmOBB8YJvQKPFo4
	wO4WFosomg2f7VSPJaeyM4+PWD+aImHUU5m3aKFCmi0Xvy19moWgXKdj1Gw=
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
X-List-Received-Date: Thu, 14 Feb 2019 08:04:09 -0000

On 14/02/2019 01:03, Wei Yang wrote:
> On Wed, Feb 13, 2019 at 02:45:01PM +0100, Laurent Vivier wrote:
>> On 13/02/2019 09:56, Philippe Mathieu-Daudé wrote:
>>> Hi Laurent,
>>>
>>> On 2/13/19 9:49 AM, Laurent Vivier wrote:
>>>> On 12/02/2019 06:34, Michael S. Tsirkin wrote:
>>>>> On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
>>>>>> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>>>>>>> There are several functions/variable which are not used anymore.
>>>>>>>
>>>>>>> This serials just remove those without functional change.
>>>>>>>
>>>>>>> v3: add ack and repost in a new thread
>>>>>>> v2: change commit log from "is now used in no place" to "in not used anymore"
>>>>>>
>>>>>> Michael,
>>>>>>
>>>>>> Looks this serials is not merged yet.
>>>>>>
>>>>>> Is there any problem I need to fix?
>>>>>
>>>>> Yes pls repost with fixed reviewed-by tags.
>>>>
>>>> Or I can take the series through the trivial branch and update manually
>>>> Philippe's lastname?
>>>
>>> I appreciate the help with manual update, however Wei is not the only
>>> one having this problem (other developpers has non-ASCII in their name,
>>> and use such tags).
>>> I'd rather prefer we find a proper configuration setup to help the
>>> community.
>>
>> I'm wondering if it can be a problem with cut'n'paste rather than with
>> git-sendemail.
>>
>> I think the following tags should cover Latin and Chinese characters:
>>
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
> 
> Looks not work.
> 
> I have tried this and also with 
> 
> Content-Language: en-US

Could  you send me a gzipped version of the 0001-XXX.patch in attachment
so I could see the real content before git-send-email?

Thansk,
Laurent


