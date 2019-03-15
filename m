Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4bRf-000811-Kl
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 21:15:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h4bRd-0007uD-Jd
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 21:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h4bME-0003rw-5Z
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 21:09:58 -0400
Received: from mga09.intel.com ([134.134.136.24]:8752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h4bMC-0003qK-TM; Thu, 14 Mar 2019 21:09:57 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2019 18:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,480,1544515200"; d="scan'208";a="155186349"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2019 18:09:52 -0700
Date: Fri, 15 Mar 2019 09:09:29 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	imammedo@redhat.com, philmd@redhat.com, eblake@redhat.com,
	peter.maydell@linaro.org, sgarzare@redhat.com
Message-ID: <20190315010929.GA3696@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20190304071631.27567-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190304071631.27567-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-trivial] [PATCH v6 0/2] CODING_STYLE: trivial update
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
X-List-Received-Date: Fri, 15 Mar 2019 01:15:34 -0000

Is this patch set picked up by someone?

On Mon, Mar 04, 2019 at 03:16:29PM +0800, Wei Yang wrote:
>The first one is suggested by Igor Mammedov to provide rule for multiline
>code.
>
>The second is a trivial fix to make example code all indented with 4 spaces.
>
>v6:
>  * add ) for last example of function
>v5:
>  * mostly address function variants
>v4:
>  * one exception case for function
>v3:
>  * fix typo in both changelog and example
>v2:
>  * adjust Patch 1 as suggested by Eric
>
>Wei Yang (2):
>  CODING_STYLE: specify the indent rule for multiline code
>  CODING_STYLE: indent example code as all others
>
> CODING_STYLE | 47 +++++++++++++++++++++++++++++++++++++++++++----
> 1 file changed, 43 insertions(+), 4 deletions(-)
>
>-- 
>2.19.1

-- 
Wei Yang
Help you, Help me

