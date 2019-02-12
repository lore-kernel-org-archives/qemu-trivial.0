Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtQiQ-0004gv-8k
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 00:34:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gtQiL-0004NM-Qo
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 00:34:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gtQX8-0002Y4-BD
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 00:23:07 -0500
Received: from mga04.intel.com ([192.55.52.120]:47756)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gtQX5-0002Fp-47; Tue, 12 Feb 2019 00:22:59 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Feb 2019 21:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,361,1544515200"; d="scan'208";a="318238537"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 11 Feb 2019 21:22:48 -0800
Date: Tue, 12 Feb 2019 13:22:24 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
	laurent@vivier.eu, imammedo@redhat.com, philmd@redhat.com
Message-ID: <20190212052224.GA4839@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190130000653.16267-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
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
X-List-Received-Date: Tue, 12 Feb 2019 05:34:39 -0000

On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>There are several functions/variable which are not used anymore.
>
>This serials just remove those without functional change.
>
>v3: add ack and repost in a new thread
>v2: change commit log from "is now used in no place" to "in not used anymore"

Michael,

Looks this serials is not merged yet.

Is there any problem I need to fix?

>
>Wei Yang (3):
>  hw/i386/pc.c: remove unused function pc_acpi_init()
>  hw/acpi: remove unused function acpi_table_add_builtin()
>  hw/acpi: remove unnecessary variable acpi_table_builtin
>
> hw/acpi/core.c         | 10 +---------
> hw/i386/pc.c           | 27 ---------------------------
> include/hw/acpi/acpi.h |  1 -
> include/hw/i386/pc.h   |  1 -
> 4 files changed, 1 insertion(+), 38 deletions(-)
>
>-- 
>2.19.1

-- 
Wei Yang
Help you, Help me

