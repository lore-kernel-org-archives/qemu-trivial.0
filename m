Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rnp0b-0005DI-7K
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jan 2012 05:14:17 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rnp0R-0004bG-4l
	for qemu-trivial@nongnu.org; Thu, 19 Jan 2012 05:14:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rnp0M-0003Tz-84
	for qemu-trivial@nongnu.org; Thu, 19 Jan 2012 05:14:07 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:44886)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Rnp0F-0003SM-C5; Thu, 19 Jan 2012 05:13:55 -0500
Received: by werc1 with SMTP id c1so4725651wer.4
	for <multiple recipients>; Thu, 19 Jan 2012 02:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=smw/zOxQcMX3JQ7t29Dcz5Bu3/QZ17ysKAVuRBbjxp0=;
	b=edHlQaQV+E8Idpckx/t2Bhf8tDXqusLnIPDs0OngkLB2EnVnAmIYl4s1TZxB9t/ZEc
	f1vIrX4yOos1q7H7Ce3/T2QRmvghZ3T/m75yTBvsTSJawzAr0tMw5/h8VxAvyhWnLv9L
	sBRL/g3cPsjObXJUpW1hcDB3zc+q6D0stZweA=
Received: by 10.216.136.94 with SMTP id v72mr11025158wei.43.1326968034525;
	Thu, 19 Jan 2012 02:13:54 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	g12sm64611353wiw.10.2012.01.19.02.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jan 2012 02:13:53 -0800 (PST)
Date: Thu, 19 Jan 2012 08:17:33 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20120119081733.GB23160@stefanha-thinkpad.localdomain>
References: <1326674823-13069-2-git-send-email-afaerber@suse.de>
	<1326793481-3967-1-git-send-email-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1326793481-3967-1-git-send-email-afaerber@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>, qemu-devel@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH v2] lm32: Fix mixup of uint32 and uint32_t
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
X-List-Received-Date: Thu, 19 Jan 2012 10:14:13 -0000

On Tue, Jan 17, 2012 at 10:44:40AM +0100, Andreas Färber wrote:
> Commit d23948b15a9920fb7f6374b55a6db1ecff81f3ee (lm32: add Milkymist
> VGAFB support) introduced a stray usage of the softfloat uint32 type.
> 
> Use uint32_t instead.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> Acked-by: Michael Walle <michael@walle.cc>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/milkymist-vgafb_template.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

