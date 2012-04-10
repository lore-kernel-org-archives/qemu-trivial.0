Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SHaY6-00069E-K6
	for mharc-qemu-trivial@gnu.org; Tue, 10 Apr 2012 08:51:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SHaY1-000696-64
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 08:51:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SHaXu-0005wy-SW
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 08:51:48 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:56624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SHaXu-0005wk-Iz; Tue, 10 Apr 2012 08:51:42 -0400
Received: by wibhr17 with SMTP id hr17so2999316wib.10
	for <multiple recipients>; Tue, 10 Apr 2012 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q+GsohIwMJd4WjSWna99fzG3WKhIbMTId1IPweR6sVo=;
	b=vGuPrjJcIUehdyeIUDjPRF6O1tLGB/EyroWDbsQS7DohQjccR1FfuFv21OxhSS11CL
	epHIkD1BYLQ1Iqedo67i28gVc3yfdWAqrPyDgh5eFLAagRmRR3IzBAP4UWZ6a7XJYUNy
	suu8SyO+zodgQRoSq+10CU6yb6EjSJW/DSNnFawggH6MKYJNBeMAB29lgTzoL6vP14eu
	shl8Zj+anKSr3TKiEHYHSHtXNC7umhSVQt8qVI8T0BTlS/BPdADbtllyQ9pPRsxrO9gk
	gExkk24cV+JZyJqdChDUittYXQF1oaKpW4Bf7akOGq6rFXoOKlC/9AMwrFzSJK2NAbkF
	l+BA==
Received: by 10.216.139.229 with SMTP id c79mr7465314wej.16.1334062299273;
	Tue, 10 Apr 2012 05:51:39 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	fn2sm60873536wib.0.2012.04.10.05.51.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 05:51:38 -0700 (PDT)
Date: Tue, 10 Apr 2012 13:51:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20120410125136.GA9094@stefanha-thinkpad.localdomain>
References: <1333515728-9769-1-git-send-email-david@gibson.dropbear.id.au>
	<1333515728-9769-3-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333515728-9769-3-git-send-email-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, benh@kernel.crashing.org, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, scottwood@freescale.com, afaerber@web.de
Subject: Re: [Qemu-trivial] [PATCH 2/4] pseries: Remove unused fields from
 VIOsPAPRBus structure
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
X-List-Received-Date: Tue, 10 Apr 2012 12:51:53 -0000

On Wed, Apr 04, 2012 at 03:02:06PM +1000, David Gibson wrote:
> The VIOsPAPRBus structure, used on the pseries machine contains some old
> fields which are no longer used anywhere.  This patch removes them.
> 
> Cc: qemu-trivial@nongnu.org
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/spapr_vio.h |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)

Leaving for Andreas to apply the whole series to the ppc tree.

Stefan

