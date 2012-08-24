Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4r7s-0001JV-EN
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 06:28:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4r7q-0001Ht-Aj
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 06:28:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4r7p-00054L-4Q
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 06:28:26 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:51218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4r7o-00054D-UG; Fri, 24 Aug 2012 06:28:25 -0400
Received: by wgbfm10 with SMTP id fm10so993433wgb.10
	for <multiple recipients>; Fri, 24 Aug 2012 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ejmTAj6Yi4wB+qeV3fawUxgQc1fMz4NLqthyddG4K4w=;
	b=v/cX3QtvdJi2/21Ar9G+6Duz4kfHBy3seMhsgkXzeDCY7qRGTvMzk2AWdcGWq2bneR
	bu1eArVKwLzYcwcHx2rgGU0swscThnqH4u4DQ642JepFkbKQB3sUoia7O2BymYLiFjFh
	IIHHphxinOXs5Hg6Rl6RoeRxQ6BBDTRaekLNr2GI9HOU/v0fgqk01SGc3QC4U++sk5Zb
	h5q/BccuSxSSvMEPkDp3kgdzNf8reRPOVFxwHjLGtv8CnyOUqr89+rW3FQ2U12OeSBO3
	iQU4WLfXpobBrQolno64UbJZmgCGfB2LBOk1elosK+6nbHT6G/4hy3uAvx5T+hGMlUHf
	q14w==
Received: by 10.180.104.200 with SMTP id gg8mr4456396wib.14.1345804103974;
	Fri, 24 Aug 2012 03:28:23 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id b7sm5559905wiz.9.2012.08.24.03.28.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 03:28:23 -0700 (PDT)
Date: Fri, 24 Aug 2012 11:28:21 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120824102821.GA10867@stefanha-thinkpad.localdomain>
References: <1345209600-808-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345209600-808-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ui: Fix spelling in comment (ressource
 -> resource)
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
X-List-Received-Date: Fri, 24 Aug 2012 10:28:27 -0000

On Fri, Aug 17, 2012 at 03:20:00PM +0200, Stefan Weil wrote:
> The function is called interface_release_resource.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  ui/spice-display.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

