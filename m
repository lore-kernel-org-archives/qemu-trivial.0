Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SC8Dl-0004qF-DH
	for mharc-qemu-trivial@gnu.org; Mon, 26 Mar 2012 07:36:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SC8DY-0004JQ-1j
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2012 07:36:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SC8DT-00030y-2c
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2012 07:36:07 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:53081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SC8DL-0002z1-1K; Mon, 26 Mar 2012 07:35:55 -0400
Received: by wibhn6 with SMTP id hn6so3874069wib.10
	for <multiple recipients>; Mon, 26 Mar 2012 04:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J4PJac8proVKBDvitIPr9jv9DvALEdQ9JvE7cry0YzU=;
	b=jsbSti/tcM7AxFEoR/0FYaWql9jSMRJ94+smhaweHSpd7TF9lr1UUlxkoCNIGtlPya
	5xDf1IyAJcGl09TpSKrlInuOlM5JNoUBDwhK8f5o+imMZ4iHchMu1bF1/cbXGmHnizUG
	FTDbso5s+VnMPi37t0QSkqoXosjpONQEgpaAsw9tYHgTeZQr4h9tVZ6Fx+C73D5zt67v
	evbUOpdN/kx4DBfig/ezvxeduZGMS0UqKSdcQjnMi6geCY8xUJEho5NDPU1R2aupzqAy
	PCL026/NF6dEyL6xIDGPPBvG7nTznbEBUTPcAWOwG53G9JgPyCm8XZoiX4S2MMi0MsYT
	f0GA==
Received: by 10.216.136.202 with SMTP id w52mr12447388wei.109.1332761751937;
	Mon, 26 Mar 2012 04:35:51 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id k6sm40235557wiy.7.2012.03.26.04.35.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 04:35:51 -0700 (PDT)
Date: Mon, 26 Mar 2012 12:35:49 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120326113549.GA31742@stefanha-thinkpad.localdomain>
References: <1332573214-8485-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1332573214-8485-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Alon Levy <alevy@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] trace-events: Fix broken build caused by
 wrong format specifier
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
X-List-Received-Date: Mon, 26 Mar 2012 11:36:19 -0000

On Sat, Mar 24, 2012 at 08:13:34AM +0100, Stefan Weil wrote:
> mem is an uint64_t value, so %lx was wrong.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  trace-events |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Normally build fixes are sent directly to qemu.git/master committers for
quick merging.  But this fix is only needed for 32-bit hosts that use
stderr tracing or another backend that uses the format string.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

