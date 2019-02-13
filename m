Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtqFb-000269-Ex
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 03:50:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gtqFX-00023s-DI
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 03:50:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gtqEH-000579-DM
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 03:49:18 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:34427)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gtqEG-00055H-Ue; Wed, 13 Feb 2019 03:49:17 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mdvyi-1hTSQL2AII-00b2Fv; Wed, 13 Feb 2019 09:49:03 +0100
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, imammedo@redhat.com,
	philmd@redhat.com
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190212052224.GA4839@richard>
	<20190212003414-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4d6f639b-fe11-7048-3975-ee1c1875b8d3@vivier.eu>
Date: Wed, 13 Feb 2019 09:49:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190212003414-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:4DuC1OHRF8zazBnApZUfLBLhAdunibcx29idmYqPFWYj7IbE6IE
	dWAJV+YXL+/5RqkA5n9YZOYwg4L6F3bd/QaSh96j0QA4if0iGd46gd+PFvgztjSK/RISh9p
	TSaDAE5Iw1S5+/ROv991QknGwbwytnzBaxmrQ1hVXlsN3QnNkRYRXHDzPJdGPK66wDuKly8
	ExNSX3eb1LzXtGBlP48kA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4694CxTrnUc=:9C9/WI8feHF4z1eGSppBKo
	LQd3hGmfJV9jf0sKl0ydwILsDbfBdFmU59P3J9OO5DlZtskudJhY6oqgbGsGOAPfN+uaB8/Ac
	1Cj3hocj7JUQjZSv1N31VTfI2szEoXdS5KShuIkvLavHZXD8Ld/ghhQllpooaRJMUHZL+Spbx
	PDI/cyr7OGFmX2hxJoo2hF//6TrKq0S4Fjls9XsZDMl01Jav1KitC7BwvZcXZ3je4oO3dxQNP
	v0SDcalT7bpAF+znxAJyY0lZKGiL4mttfK3nxwEomPkfwr0s8FNzhyqbJf2QiJ8dFo81+vhwS
	h3qSQcwu+gy4AHztk+6XrihxOg5XxMtcByudutE1cDEZQWse7+83DUSU2rG6zYwlNGEJFsQFD
	R4bPzuFtbjxtoFWCHAABeLEN0yBs9eebB8S+P+GKPW16qN++mfK3wSvqeRO26D3LR01mrM45l
	Zq7UiBMAQMy4RJilUxUvu7Pwe+P9/+UvFyVy+4cJmq9avtT5GQ9Spc5mPgRXLVknmD5Uj0Ly6
	Qq0HJSsK9LAxzqBwE/5qNpWtJkdMFAR9736k4sX6FIrRuq9O7VVYcPBBjlP4rLdtFC3qkTgWP
	0TdWkAxbAjjNVp2G7F16yPGmOBFzjEx0KlAYf4zsR41QX70m1JIOkR02yUtsZchHT5VUiO9XI
	92+1gjRBbyN65lqAUIOfwqODxIx1jDiubNKRlY0NkuFNZ/riQZKIQ6m9DTACB/wXHj774Xt96
	TaH+E6lXua3oUUIso8r4aUHMPelH3vImUfE7JIIBviOpBhZEnrtvN4TWTLg=
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
X-List-Received-Date: Wed, 13 Feb 2019 08:50:36 -0000

On 12/02/2019 06:34, Michael S. Tsirkin wrote:
> On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
>> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>>> There are several functions/variable which are not used anymore.
>>>
>>> This serials just remove those without functional change.
>>>
>>> v3: add ack and repost in a new thread
>>> v2: change commit log from "is now used in no place" to "in not used anymore"
>>
>> Michael,
>>
>> Looks this serials is not merged yet.
>>
>> Is there any problem I need to fix?
> 
> Yes pls repost with fixed reviewed-by tags.

Or I can take the series through the trivial branch and update manually
Philippe's lastname?

Laurent

