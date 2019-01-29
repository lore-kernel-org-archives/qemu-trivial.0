Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goOOx-0008SZ-P4
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 03:05:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goOOv-0008SC-6k
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:05:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goOOu-0000ER-C8
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:05:45 -0500
Received: from mga09.intel.com ([134.134.136.24]:42535)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1goOOq-0008Q3-EV; Tue, 29 Jan 2019 03:05:41 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2019 00:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,536,1539673200"; d="scan'208";a="314439715"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.37])
	by fmsmga006.fm.intel.com with ESMTP; 29 Jan 2019 00:05:24 -0800
Date: Tue, 29 Jan 2019 16:04:55 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, imammedo@redhat.com, laurent@vivier.eu,
	mst@redhat.com
Message-ID: <20190129080455.GA10084@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
	<feb8687e-0d0c-a20a-9b37-c8284aaae9f5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <feb8687e-0d0c-a20a-9b37-c8284aaae9f5@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
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
X-List-Received-Date: Tue, 29 Jan 2019 08:05:46 -0000

On Tue, Jan 29, 2019 at 07:56:54AM +0100, Philippe Mathieu-Daudé wrote:
>Hi Wei,
>
>On 1/29/19 1:08 AM, Wei Yang wrote:
>> There are several functions/variable which are not used anymore.
>> 
>> This serials just remove those without functional change.
>> 
>> Wei Yang (3):
>>   hw/i386/pc.c: remove unused function pc_acpi_init()
>>   hw/acpi: remove unused function acpi_table_add_builtin()
>>   hw/acpi: remove unnecessary variable acpi_table_builtin
>> 
>>  hw/acpi/core.c         | 10 +---------
>>  hw/i386/pc.c           | 27 ---------------------------
>>  include/hw/acpi/acpi.h |  1 -
>>  include/hw/i386/pc.h   |  1 -
>>  4 files changed, 1 insertion(+), 38 deletions(-)
>> 
>
>Please do not post iterated series in reply to previous version, but as
>new thread:
>- patches are parsed by scripts
>- some email clients can tag a thread as "reviewed, skip" and replies to
>this thread will be masked.
>

Well, do I need to repost it in a new thread?

>Regards,
>
>Phil.

-- 
Wei Yang
Help you, Help me

