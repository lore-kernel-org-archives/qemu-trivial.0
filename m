Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1godd8-00016J-UV
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 19:21:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1godd5-00015e-MV
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 19:21:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1godd4-0003zk-Kt
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 19:21:23 -0500
Received: from mga01.intel.com ([192.55.52.88]:3447)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1godd4-0003yS-B9; Tue, 29 Jan 2019 19:21:22 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2019 15:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,538,1539673200"; d="scan'208";a="138997446"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.37])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2019 15:59:09 -0800
Date: Wed, 30 Jan 2019 07:58:40 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	imammedo@redhat.com, qemu-devel@nongnu.org
Message-ID: <20190129235840.GA15790@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
	<feb8687e-0d0c-a20a-9b37-c8284aaae9f5@redhat.com>
	<20190129080455.GA10084@richard>
	<91c53c72-8e9c-f68d-1dc8-f6320ed3dfc0@redhat.com>
	<f6f1703e-1c77-055e-1906-300df3c79479@vivier.eu>
	<20190129153254.r7y2vto4ltxsivpj@master>
	<20190129105828-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190129105828-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/3] Trivial cleanup in
 hw/acpi
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
X-List-Received-Date: Wed, 30 Jan 2019 00:21:25 -0000

On Tue, Jan 29, 2019 at 10:58:50AM -0500, Michael S. Tsirkin wrote:
>On Tue, Jan 29, 2019 at 03:32:54PM +0000, Wei Yang wrote:
>> On Tue, Jan 29, 2019 at 09:43:20AM +0100, Laurent Vivier wrote:
>> >On 29/01/2019 09:23, Philippe Mathieu-Daudé wrote:
>> >> On 1/29/19 9:04 AM, Wei Yang wrote:
>> >>> On Tue, Jan 29, 2019 at 07:56:54AM +0100, Philippe Mathieu-Daudé wrote:
>> >>>> Hi Wei,
>> >>>>
>> >>>> On 1/29/19 1:08 AM, Wei Yang wrote:
>> >>>>> There are several functions/variable which are not used anymore.
>> >>>>>
>> >>>>> This serials just remove those without functional change.
>> >>>>>
>> >>>>> Wei Yang (3):
>> >>>>>   hw/i386/pc.c: remove unused function pc_acpi_init()
>> >>>>>   hw/acpi: remove unused function acpi_table_add_builtin()
>> >>>>>   hw/acpi: remove unnecessary variable acpi_table_builtin
>> >>>>>
>> >>>>>  hw/acpi/core.c         | 10 +---------
>> >>>>>  hw/i386/pc.c           | 27 ---------------------------
>> >>>>>  include/hw/acpi/acpi.h |  1 -
>> >>>>>  include/hw/i386/pc.h   |  1 -
>> >>>>>  4 files changed, 1 insertion(+), 38 deletions(-)
>> >>>>>
>> >>>>
>> >>>> Please do not post iterated series in reply to previous version, but as
>> >>>> new thread:
>> >>>> - patches are parsed by scripts
>> >>>> - some email clients can tag a thread as "reviewed, skip" and replies to
>> >>>> this thread will be masked.
>> >>>>
>> >>>
>> >>> Well, do I need to repost it in a new thread?
>> >> 
>> >> It depends who will take this patchset and his mood :)
>> >> Let's wait and see.
>> >> 
>> >
>> >No need to repost if they go through the trivial branch.
>> 
>> Thanks :-)
>> 
>> >
>> >Thanks,
>> >Laurent
>
>Pls repost with all acks etc and I'll pick it up.
>

Got it.

>> -- 
>> Wei Yang
>> Help you, Help me

-- 
Wei Yang
Help you, Help me

