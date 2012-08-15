Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1ecK-0002bO-IM
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 10:30:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1ecI-0002av-42
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:30:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1ecH-0002nu-0q
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:30:38 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:54431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1ecG-0002ng-Qg
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:30:36 -0400
Received: by wibhm2 with SMTP id hm2so4277929wib.10
	for <qemu-trivial@nongnu.org>; Wed, 15 Aug 2012 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=DpmdqP8SPf+MpeEmYTXF3Afe4OjYX09jYQJBV6wR1JY=;
	b=L2Ow0olHB6bqsD9Y9S9HsSL5p5aP9IN0Vm32StDFFNdXFc2QU+ks8YtxBnBfEmwCFf
	7RAfVZpfcojp7MSurlcFJSsow+kpvLdZn76t+YHt/yTrXuBVg9Kt7SLJSAh2yzCWX7KR
	30QLQgm/iUP1jguUakCJ2j1KLBwj2vU/U+VNRvwBhHJ1YVqTk9Q8xsgRjwKNTnIJSLKS
	R9lNYuBlbd9Y56KiQOdxWzLBbISfZuI1/PZ96O5lWMx8vbdqLoPLFL/HU0d0z2U4y6Wj
	n/ZV+Vkb1ENhNVYAeENDj2sLNlzCCghsS6y8pixZ00AQxdFx67J+lck6nBBHn46TtW0u
	DZrg==
Received: by 10.180.78.5 with SMTP id x5mr37478865wiw.13.1345041035819;
	Wed, 15 Aug 2012 07:30:35 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id dc3sm28939756wib.7.2012.08.15.07.30.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 07:30:34 -0700 (PDT)
Date: Wed, 15 Aug 2012 15:30:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alberto Garcia <agarcia@igalia.com>
Message-ID: <20120815143031.GM10742@stefanha-thinkpad.localdomain>
References: <1344944488-27075-1-git-send-email-agarcia@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1344944488-27075-1-git-send-email-agarcia@igalia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] ivshmem,
 qdev-monitor: fix order of qerror parameters
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
X-List-Received-Date: Wed, 15 Aug 2012 14:30:39 -0000

On Tue, Aug 14, 2012 at 02:41:28PM +0300, Alberto Garcia wrote:
> Now that the QERR_ macros no longer contain a json dictionary,
> the order of some parameters needs to be fixed for them to appear
> correctly.
> ---
>  hw/ivshmem.c      |    3 ++-
>  hw/qdev-monitor.c |    2 +-
>  2 ficheiros modificados, 3 adições(+), 2 eliminados(-)

Looks good but missing Signed-off-by:.

You can just reply with your Signed-off-by: line and I'll merge it, no
need to resend the patch.

For information on Signed-off-by:, please see "12) Sign your work":
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/SubmittingPatches;h=689e2371095cc5dfea9927120009341f369159aa;hb=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#l297

Stefan

