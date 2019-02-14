Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gu4VY-00084O-6w
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 19:04:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gu4VV-00083u-Vb
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 19:04:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gu4VT-0006Ti-7i
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 19:04:01 -0500
Received: from mga14.intel.com ([192.55.52.115]:37634)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gu4VR-0006Eb-T2; Wed, 13 Feb 2019 19:03:58 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2019 16:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,367,1544515200"; d="scan'208";a="274888959"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga004.jf.intel.com with ESMTP; 13 Feb 2019 16:03:41 -0800
Date: Thu, 14 Feb 2019 08:03:17 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, imammedo@redhat.com
Message-ID: <20190214000317.GA19899@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190212052224.GA4839@richard>
	<20190212003414-mutt-send-email-mst@kernel.org>
	<4d6f639b-fe11-7048-3975-ee1c1875b8d3@vivier.eu>
	<3d700eed-5637-b05a-63c2-9f73a465bcb5@redhat.com>
	<af33ffd7-a134-4d61-40ee-b128f5104153@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af33ffd7-a134-4d61-40ee-b128f5104153@vivier.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
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
X-List-Received-Date: Thu, 14 Feb 2019 00:04:02 -0000

On Wed, Feb 13, 2019 at 02:45:01PM +0100, Laurent Vivier wrote:
>On 13/02/2019 09:56, Philippe Mathieu-Daudé wrote:
>> Hi Laurent,
>> 
>> On 2/13/19 9:49 AM, Laurent Vivier wrote:
>>> On 12/02/2019 06:34, Michael S. Tsirkin wrote:
>>>> On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
>>>>> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>>>>>> There are several functions/variable which are not used anymore.
>>>>>>
>>>>>> This serials just remove those without functional change.
>>>>>>
>>>>>> v3: add ack and repost in a new thread
>>>>>> v2: change commit log from "is now used in no place" to "in not used anymore"
>>>>>
>>>>> Michael,
>>>>>
>>>>> Looks this serials is not merged yet.
>>>>>
>>>>> Is there any problem I need to fix?
>>>>
>>>> Yes pls repost with fixed reviewed-by tags.
>>>
>>> Or I can take the series through the trivial branch and update manually
>>> Philippe's lastname?
>> 
>> I appreciate the help with manual update, however Wei is not the only
>> one having this problem (other developpers has non-ASCII in their name,
>> and use such tags).
>> I'd rather prefer we find a proper configuration setup to help the
>> community.
>
>I'm wondering if it can be a problem with cut'n'paste rather than with
>git-sendemail.
>
>I think the following tags should cover Latin and Chinese characters:
>
>Content-Type: text/plain; charset=UTF-8
>Content-Transfer-Encoding: 8bit
>

Looks not work.

I have tried this and also with 

Content-Language: en-US


The character would be modified after git send-email.

>Thanks,
>Laurent

-- 
Wei Yang
Help you, Help me

