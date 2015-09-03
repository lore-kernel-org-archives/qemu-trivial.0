Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZXVYD-00067i-9c
	for mharc-qemu-trivial@gnu.org; Thu, 03 Sep 2015 10:31:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZXVY6-0005v2-CA
	for qemu-trivial@nongnu.org; Thu, 03 Sep 2015 10:31:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZXVY5-0005zZ-K7
	for qemu-trivial@nongnu.org; Thu, 03 Sep 2015 10:31:34 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:37138)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ZXVY0-0005x4-GJ; Thu, 03 Sep 2015 10:31:28 -0400
Received: by wicfx3 with SMTP id fx3so54500976wic.0;
	Thu, 03 Sep 2015 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=82miYCdL3JDhpXyYr/azaTrbp2sgjU9F3kP9PlLhcjY=;
	b=t2hY4WA7xvlwB740cH6lEcjqbo4HM8GMsPvmAgGExhB3vXlyxmxOWFCVWdaAfKghgL
	3BbKawYLYozu75bS3iw/fvDA+8StaRjhkN+bbiMTD4DaFQ1+D1WzO8D0uMWljzs36xAy
	s/zftUIXm1OPvgBuq7yUo8GzCoNHLeXFie+ojKWoCUpaIkeGADah2PjcnQdqIVNU5OZQ
	Nomz/+pMP/acEPOkh8SqqtrRiSMgLQ8utnnDEeTbXnOjAMefH/CLhKXpzkvjwQwhIZB7
	mWhbNQjiw+thoshxVHv1V5A7tH0bZi9f2VFTSEYzDZdvI8Mu+SypgP6MpUaBCiyZvIgL
	/1ZQ==
X-Received: by 10.194.78.101 with SMTP id a5mr48613644wjx.35.1441290687457;
	Thu, 03 Sep 2015 07:31:27 -0700 (PDT)
Received: from localhost (host86-153-218-221.range86-153.btcentralplus.com.
	[86.153.218.221]) by smtp.gmail.com with ESMTPSA id
	eu10sm1638114wib.5.2015.09.03.07.31.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 07:31:26 -0700 (PDT)
Date: Thu, 3 Sep 2015 15:31:23 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20150903143123.GA17710@stefanha-thinkpad.redhat.com>
References: <1435611386-29316-1-git-send-email-jsnow@redhat.com>
	<20150709102623.GC28530@stefanha-thinkpad.redhat.com>
	<55DBB496.2070605@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55DBB496.2070605@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] trivial: remove trailing
 newline from error_report
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
X-List-Received-Date: Thu, 03 Sep 2015 14:31:40 -0000

On Mon, Aug 24, 2015 at 08:19:34PM -0400, John Snow wrote:
> 
> 
> On 07/09/2015 06:26 AM, Stefan Hajnoczi wrote:
> > On Mon, Jun 29, 2015 at 04:56:26PM -0400, John Snow wrote:
> >> Minor cleanup.
> >> 
> >> Signed-off-by: John Snow <jsnow@redhat.com> --- hw/ide/ahci.c
> >> | 2 +- hw/vfio/platform.c | 2 +- net/tap-linux.c    | 4 ++-- 3
> >> files changed, 4 insertions(+), 4 deletions(-)
> > 
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > Laszlo Ersek suggested a compile-time check (e.g. BUILD_BUG_ON()).
> > Have you looked into this?
> > 
> > Perhaps something along the lines of:
> > 
> > BUILD_BUG_ON(__builtin_constant_p(fmt) && __builtin_strlen(fmt) > 0
> > && fmt[__builtin_strlen(fmt) - 1] == '\n')
> > 
> 
> ping for 2.5; I don't think this ever made it in.

CCing Michael explicitly since this is for the trivial tree

