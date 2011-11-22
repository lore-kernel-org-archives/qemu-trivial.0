Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSnpt-0008N4-Fv
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:44:21 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RSnpm-00080m-M2
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:44:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RSnph-00050P-4S
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:44:14 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:33940)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RSnpX-0004xx-44; Tue, 22 Nov 2011 05:43:59 -0500
Received: by eyh6 with SMTP id 6so13415eyh.4
	for <multiple recipients>; Tue, 22 Nov 2011 02:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4OdwJg7RH0/8w8iDIpRvfW7MQmbkRhWGpJLkMiKABwE=;
	b=sF1SmTe5T0BKnysk+VnHBbEsoNwUfSDbvyEXHXEcpeJMB/bVrMuqXFDj1bNCYlKD2K
	VghilOpq8ekDe1ln/cjbnJmH/rgyzJX9NjEa+u3JMZd8iS9npeHm42w1lQTbcYMCIXHL
	jHTEnPQGB6/YFmDFYfR0f2jn56bLBzHDNhnOU=
Received: by 10.213.21.23 with SMTP id h23mr1611225ebb.55.1321958637309;
	Tue, 22 Nov 2011 02:43:57 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	s44sm7723843eef.11.2011.11.22.02.43.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 02:43:56 -0800 (PST)
Date: Tue, 22 Nov 2011 10:43:54 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111122104354.GA27846@stefanha-thinkpad.localdomain>
References: <1321730319-21498-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321730319-21498-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] darwin-user: Fix format string in debug
 message
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
X-List-Received-Date: Tue, 22 Nov 2011 10:44:20 -0000

On Sat, Nov 19, 2011 at 08:18:39PM +0100, Stefan Weil wrote:
> This was spotted by cppcheck.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  darwin-user/signal.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)

I am waiting to see if you send a v2 or this thread continues.  Not
applied to trivial-patches.

Stefan

