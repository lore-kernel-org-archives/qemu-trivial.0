Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJjAi-0001P7-0o
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 06:28:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJjAW-0001Nv-Ig
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 06:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJjAR-0004ag-Pf
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 06:28:24 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:64337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJjAR-0004aS-Fy
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 06:28:19 -0400
Received: by wgbfm10 with SMTP id fm10so4596623wgb.10
	for <qemu-trivial@nongnu.org>; Mon, 16 Apr 2012 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m46G8a2jSbSbV04lpEYdwtuFr2XPM1TA6qV1+5snwk8=;
	b=Lez1J2Wo6aGLAx0y7NQ4ZJJo+wL+LSLsZx9vbWBuQdtN8IJAToKfbsgo6TYRo/lvGX
	5NQcgf0Vu6jIsIxCMXrLkIAcj89LND0LV+QzpPlcnOl940X4nCUpbrSrU6Ht3041gbvB
	7qnN8RSmoEJFjHN2ajfWtoyAUATMmXBqPkw4YnoYxNnEcP2s2BcDt+ljc6csCvaHRAJT
	Nzx49yWI0owz7euIVogqQ1BLpLdvRn1D83eEls8AwNO5qXCVh4d4d6ntDUFL1D2os1AZ
	K6B3eJLe1gzpTDmURHpT0fvjjQ8SSI/gwo8tAmotZXUvQqyl472u3ym2s0BHW+zA94mI
	xFWg==
Received: by 10.180.92.228 with SMTP id cp4mr10890192wib.2.1334572097424;
	Mon, 16 Apr 2012 03:28:17 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	fz9sm18769645wib.3.2012.04.16.03.28.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 03:28:16 -0700 (PDT)
Date: Mon, 16 Apr 2012 11:28:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eduardo Elias Ferreira <edusf@linux.vnet.ibm.com>
Message-ID: <20120416102814.GA6182@stefanha-thinkpad.localdomain>
References: <1334246160-17278-1-git-send-email-edusf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334246160-17278-1-git-send-email-edusf@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] spice-qemu-char.c: Show what name is
 unsupported
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
X-List-Received-Date: Mon, 16 Apr 2012 10:28:26 -0000

On Thu, Apr 12, 2012 at 12:56:00PM -0300, Eduardo Elias Ferreira wrote:
> ---
>  spice-qemu-char.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

