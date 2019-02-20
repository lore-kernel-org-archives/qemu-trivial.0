Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwIFy-0006Pz-H8
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 22:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gwIFw-0006K4-3n
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 22:09:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gwIFv-0005zW-Gz
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 22:09:08 -0500
Received: from mga04.intel.com ([192.55.52.120]:35268)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gwIFt-0005yU-R8; Tue, 19 Feb 2019 22:09:06 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2019 19:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; d="scan'208";a="135637596"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2019 19:09:02 -0800
Date: Wed, 20 Feb 2019 11:08:38 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Eric Blake <eblake@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, imammedo@redhat.com,
	philmd@redhat.com, peter.maydell@linaro.org
Message-ID: <20190220030838.GA25911@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20190220003113.20746-1-richardw.yang@linux.intel.com>
	<20190220003113.20746-2-richardw.yang@linux.intel.com>
	<6b850e7b-78ed-b68e-6a46-9bdbb2962507@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b850e7b-78ed-b68e-6a46-9bdbb2962507@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] CODING_STYLE: specify the indent
 rule for multiline code
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
X-List-Received-Date: Wed, 20 Feb 2019 03:09:08 -0000

On Tue, Feb 19, 2019 at 09:02:34PM -0600, Eric Blake wrote:
>On 2/19/19 6:31 PM, Wei Yang wrote:
>> We didn't specify the indent rule for multiline code here, which may
>> misleading users. And in current code, the code use different rules.
>
>s/misleading/mislead/
>
>> 
>> Add this rule in CODING_STYLE to make sure this is clear to every one.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> 
>> ---
>> v2:
>>    * rephrase changelog suggested by Eric Blake
>>      - remove one redundant line
>>      - fix some awkward grammar
>>      - add { ; at the end of example
>> ---
>>  CODING_STYLE | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>
>> +
>> +    do_something(arg1, arg2
>> +                 arg3);
>
>Missing a comma after arg2. With that fixed,
>Reviewed-by: Eric Blake <eblake@redhat.com>

You are right.

>
>-- 
>Eric Blake, Principal Software Engineer
>Red Hat, Inc.           +1-919-301-3226
>Virtualization:  qemu.org | libvirt.org

-- 
Wei Yang
Help you, Help me

