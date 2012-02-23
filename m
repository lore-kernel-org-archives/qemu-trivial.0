Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S0UjA-00034C-Nw
	for mharc-qemu-trivial@gnu.org; Thu, 23 Feb 2012 04:12:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S0Uj3-0002gt-2c
	for qemu-trivial@nongnu.org; Thu, 23 Feb 2012 04:12:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S0Uix-0007gR-9I
	for qemu-trivial@nongnu.org; Thu, 23 Feb 2012 04:12:32 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:57394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S0Uip-0007fK-VF; Thu, 23 Feb 2012 04:12:20 -0500
Received: by eekd17 with SMTP id d17so391593eek.4
	for <multiple recipients>; Thu, 23 Feb 2012 01:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NLOI65MzgM62whnbhUy6nH+mebxCtKdF8mfy/mIdX+U=;
	b=kKfVHiR3oiGeLBK2y+zg8m/N7iKOIuRzvgy36aOi/RGXU5O08EQ8/Bish9Ine0wXnD
	adrJQr6+mMcfDvK0BtOCvzz4PMfWoOoB0hHvmHLB2BNGFS/wrAlIn3VY1kSh/Uj0OMaA
	T7JxU9XYXpUMvKYtjqyP49deyGyeRTr8s4SHM=
Received: by 10.213.9.133 with SMTP id l5mr126755ebl.81.1329988339096;
	Thu, 23 Feb 2012 01:12:19 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id n17sm3221946eei.3.2012.02.23.01.12.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 01:12:18 -0800 (PST)
Date: Thu, 23 Feb 2012 08:06:06 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120223080606.GA5147@stefanha-thinkpad.localdomain>
References: <1329948791-24274-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1329948791-24274-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] vl.c: Increase width of machine name
 column in "-M ?" output
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
X-List-Received-Date: Thu, 23 Feb 2012 09:12:39 -0000

On Wed, Feb 22, 2012 at 10:13:11PM +0000, Peter Maydell wrote:
> Increase the width of the column used for the machine name in
> the "-M ?" output from 10 to 20 spaces. This fixes the formatting
> so it looks nice for architectures where a few of the machines
> have overly long names. (Our current longest machine name is
> "petalogix-s3adsp1800" with "realview-eb-mpcore" not far behind.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  vl.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Confirmed that libvirt does not depend on the spacing.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

