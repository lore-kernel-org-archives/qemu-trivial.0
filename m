Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SlcfG-00084w-O0
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jul 2012 05:11:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SlcfA-0007lN-DP
	for qemu-trivial@nongnu.org; Mon, 02 Jul 2012 05:11:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Slcf3-0007PR-Q7
	for qemu-trivial@nongnu.org; Mon, 02 Jul 2012 05:11:19 -0400
Received: from mail-ee0-f45.google.com ([74.125.83.45]:47950)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Slcer-0007Jm-Nr; Mon, 02 Jul 2012 05:11:01 -0400
Received: by eekd41 with SMTP id d41so2909310eek.4
	for <multiple recipients>; Mon, 02 Jul 2012 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rIaJvwSB4yrQfIO4PmuAIGBzVWLH4JGx+11JgFgU7ro=;
	b=VPjy7cmbg/8kEQGp1lUFA7SNL15EEBMdbPqQnO3hkdEndhSBWtpUZP0dyFjjJ0ulq6
	jNXQrhaLGNno5xDTH4WkB/DV75GUIHMlpzCPCMy+HX3g0PWJ/TRfG16vby2aFIyr9eHj
	M7wGy6XxdNNvVeWy1Zk9cxGO6bdd4HSXAG4ggRMYuc1N6xVr73u1CwkMMOPdgRrEMxXR
	WBorPiN7ec8MsbXf2XbPGAxD9I73ooTiu0VvuGNZm9iigokXHYeC2sd3UZkbdEcB1NWK
	ACGnSjnSW6okPQjoDxolYZmFK8JeoiDWXGPMAsueXwuT3oTMa1yKy4kVrV6UusfrBJGd
	9lvA==
Received: by 10.14.100.71 with SMTP id y47mr2860917eef.190.1341220259033;
	Mon, 02 Jul 2012 02:10:59 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	t3sm32664628eeb.15.2012.07.02.02.10.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jul 2012 02:10:58 -0700 (PDT)
Date: Mon, 2 Jul 2012 10:10:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120702091056.GB25781@stefanha-thinkpad.localdomain>
References: <1340898997-15820-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340898997-15820-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.83.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Remove help for
 --disable-vnc-thread, --enable-vnc-thread
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
X-List-Received-Date: Mon, 02 Jul 2012 09:11:26 -0000

On Thu, Jun 28, 2012 at 05:56:37PM +0200, Stefan Weil wrote:
> Commit 2624bab836662d37f08336408a99d97652fc9c4d removed these
> configure arguments. Now the help text for both is removed, too.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    2 --
>  1 file changed, 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

