Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvQDX-0000Xw-K1
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 04:23:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQDO-0008PP-Em
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQDI-0007pa-So
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:54 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RvQD4-0007i1-T5; Thu, 09 Feb 2012 04:22:35 -0500
Received: by mail-wi0-f173.google.com with SMTP id hi20so1152830wib.4
	for <multiple recipients>; Thu, 09 Feb 2012 01:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ti9kgt9mufko+t7fMJHERE+L9Uu7zw3XY6pIa37gc3Y=;
	b=xmOOMi419GohdszZwBBxFcdEwLH5k0lPUwp6Zvk3nmtkLHJYHK4lcutPRH/LPuUONZ
	5/iWno8UMhME9ejJ8VZ4q2zR6KTRhykAat400f5iO/F9F4RH0VT//BvvDvR9tXQQw1Gn
	9C4HPqC3RF87u+CXtz+Qq1om0Fgh/5mM5aCHk=
Received: by 10.180.92.71 with SMTP id ck7mr1898685wib.3.1328779354434;
	Thu, 09 Feb 2012 01:22:34 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id y6sm5436188wix.10.2012.02.09.01.22.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 01:22:33 -0800 (PST)
Date: Thu, 9 Feb 2012 08:45:10 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120209084510.GD30956@stefanha-thinkpad.localdomain>
References: <1328648247-30117-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1328648247-30117-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: Fix typo in variable
	name
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
X-List-Received-Date: Thu, 09 Feb 2012 09:23:00 -0000

On Tue, Feb 07, 2012 at 08:57:27PM +0000, Peter Maydell wrote:
> Fix a typo in a local variable name.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  vl.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

