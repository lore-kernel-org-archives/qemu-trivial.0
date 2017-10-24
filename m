Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e768m-0001Se-09
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 16:49:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amarnath.valluri@intel.com>) id 1e73kV-0004wJ-6F
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 14:16:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amarnath.valluri@intel.com>) id 1e73kU-0003hN-8c
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 14:16:23 -0400
Received: from mga09.intel.com ([134.134.136.24]:4444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amarnath.valluri@intel.com>)
	id 1e73kP-0003eO-IU; Tue, 24 Oct 2017 14:16:17 -0400
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Oct 2017 11:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,428,1503385200"; d="scan'208";a="166549588"
Received: from dprobinx-mobl.ger.corp.intel.com (HELO avalluri-ubook)
	([10.252.3.17])
	by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2017 11:15:18 -0700
Message-ID: <1508869162.4025.1.camel@intel.com>
From: Amarnath Valluri <amarnath.valluri@intel.com>
Reply-To: amarnath.valluri@intel.com
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, "Richard W . M . Jones"
	<rjones@redhat.com>, =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
	<marcandre.lureau@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	Juan Quintela <quintela@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org, =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
	<marcandre.lureau@gmail.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>
Date: Tue, 24 Oct 2017 21:19:22 +0300
In-Reply-To: <20171024122045.30072-1-f4bug@amsat.org>
References: <20171024122045.30072-1-f4bug@amsat.org>
Organization: Intel
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
X-Mailman-Approved-At: Tue, 24 Oct 2017 16:49:35 -0400
Subject: Re: [Qemu-trivial] [PATCH v2 0/4] tpm: add stubs to fix compiling
 with --disable-tpm
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
X-List-Received-Date: Tue, 24 Oct 2017 18:16:24 -0000

On Tue, 2017-10-24 at 09:20 -0300, Philippe Mathieu-Daudé wrote:
> This fixes building with --disable-tpm as reported by Zoltan:
>   http://lists.nongnu.org/archive/html/qemu-devel/2017-10/msg05369.html
> 
> Cc'ing Peter in case this enters as a build fix instead of via trivial.
> 
> v2:
> - added Richard W.M. Jones Tested-by tag
> - remove #ifdef CONFIG_TPM in tpm.c (Stefan Berger)
> 
> Regards,
> 
> Phil.
> 
> PD: I missed Amarnath Valluri in my first series, you might want to add yourself
>     a R: tag in MAINTAINTERS.
>     
> Philippe Mathieu-Daudé (4):
>   tpm: add missing include
>   tpm: add stubs
>   tpm: remove unnecessary #ifdef CONFIG_TPM
>   vl: remove unnecessary #ifdef CONFIG_TPM
> 
>  Makefile.objs        |  2 +-
>  include/sysemu/tpm.h |  1 +
>  stubs/tpm.c          | 33 +++++++++++++++++++++++++++++++++
>  tpm.c                |  4 ----
>  vl.c                 |  2 --
>  MAINTAINERS          |  1 +
>  stubs/Makefile.objs  |  1 +
>  7 files changed, 37 insertions(+), 7 deletions(-)
>  create mode 100644 stubs/tpm.c
> 
+1, Nice cleanup in my opinion, now it looks much cleaner.

- Amarnath


