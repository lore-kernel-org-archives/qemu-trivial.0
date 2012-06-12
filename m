Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SeNcm-00065D-LJ
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2012 05:42:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SeNcf-0005iZ-Av
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 05:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SeNcZ-0002Z0-71
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 05:42:48 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:59749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SeNcO-0002UD-HI; Tue, 12 Jun 2012 05:42:32 -0400
Received: by wgbds1 with SMTP id ds1so4152283wgb.4
	for <multiple recipients>; Tue, 12 Jun 2012 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Z1+vyuknVGWyQSi747idUyP1doDTzf6YUziyVIsRVIg=;
	b=it+a/He0lHzMStCm+yRTJ9vR6HWksaJ6DGv98pEFc/HQR7BQBzrhiVqNLVYG7LvJ8e
	gFUrAwp5xirETnH83XHawwa/zq5Ki5FQO31zf15bGQglmJIaK+JLYChrds7I6je6zXel
	VHcxahZJdAwUOgPrp3PSQ9UtPhOsodCUBKwq/Hyuy3ZMaFfrbsH1qPNqmdPtgYxl0ETZ
	vGF0fa735TuSURwsleBmnM9ZlyNCvw2iXg3sN3zsD6D408W72gT+8YdldsqTwMjZxrPg
	1pYUQTmA7zVQ3OHRYcVqjttgk+e+bwxulNwX+L+VWlFcrWQq7IYAPCTbabnAykExO9it
	Aajw==
Received: by 10.180.88.233 with SMTP id bj9mr27504631wib.1.1339494148388;
	Tue, 12 Jun 2012 02:42:28 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id d10sm7518046wiy.3.2012.06.12.02.42.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jun 2012 02:42:27 -0700 (PDT)
Date: Tue, 12 Jun 2012 10:42:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: fboiteux@free.fr
Message-ID: <20120612094225.GA29104@stefanha-thinkpad.localdomain>
References: <1339178785-8977-1-git-send-email-fboiteux@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1339178785-8977-1-git-send-email-fboiteux@free.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 676374@bugs.debian.org
Subject: Re: [Qemu-trivial] [PATCH] Install 'bepo' keymap already included
 in Qemu source
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
X-List-Received-Date: Tue, 12 Jun 2012 09:42:55 -0000

On Fri, Jun 08, 2012 at 08:06:25PM +0200, fboiteux@free.fr wrote:
> From: Frédéric Boiteux <fboiteux@free.fr>
> 
> The 'bepo' layout (a french dvorak-like keyboard layout) was added
> about one year ago, (see commit 2a3c633c1eb8692716220195b6d3fe78b7e411d0),
> but I missed to declare to install it.
> 
> Signed-off-by: Frédéric Boiteux <fboiteux@free.fr>
> ---
>  Makefile |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

