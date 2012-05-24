Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SXXBx-0003tx-1s
	for mharc-qemu-trivial@gnu.org; Thu, 24 May 2012 08:30:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SXXBu-0003tO-DZ
	for qemu-trivial@nongnu.org; Thu, 24 May 2012 08:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SXXBn-00013c-MB
	for qemu-trivial@nongnu.org; Thu, 24 May 2012 08:30:53 -0400
Received: from mail-ee0-f45.google.com ([74.125.83.45]:53836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SXXBn-000136-CK; Thu, 24 May 2012 08:30:47 -0400
Received: by eekd41 with SMTP id d41so3265954eek.4
	for <multiple recipients>; Thu, 24 May 2012 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DT3uDubiJ3ARxQh7Mp9fss6204UgBanTKeXgFnzfjW0=;
	b=Vu9s2Ou/A0MnbN01yYIaHno0MSo4lBZlT4O+/8s1NCLAKhpwwi/1gZL7Mbxa/ItAsZ
	KkfIwGksnD44/vJ3rDdMcvUhh0jZxTDu2iMpVryT9Tx6e24kJXy24OFA0ej5Y0uDUve9
	zNVicFZkYX8kp0LkGHn8pwWwig/Ab4L7XXOjWAMxn1M4ogH01fDPBcRtXrQUrCsJlbNX
	4xTnTAwN+yGeusoptB3RoDiBIixwC4ATNvuyCZn/ymUenrTeL05mARDVHH02ejLxYKm5
	kHQwQPlJIb/yR8JKiQ0xFcwZJ+hEreurqQo/Fk1AcaVxSo/GGt9V3GmRvviqf5a2+sWJ
	YXRQ==
Received: by 10.213.113.135 with SMTP id a7mr2196325ebq.9.1337862642435;
	Thu, 24 May 2012 05:30:42 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id z5sm541960eem.3.2012.05.24.05.30.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 05:30:41 -0700 (PDT)
Date: Thu, 24 May 2012 13:30:35 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20120524123035.GA5412@stefanha-thinkpad.localdomain>
References: <4FBD9FF1.9020908@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4FBD9FF1.9020908@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.83.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Clarify comments of
 tb_invalidate_phys_[page_]range
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 12:30:56 -0000

On Wed, May 23, 2012 at 11:41:53PM -0300, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> They could suggest that all TBs of the page containing the range would
> be invalidated.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  exec.c |   22 ++++++++++++----------
>  1 files changed, 12 insertions(+), 10 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

