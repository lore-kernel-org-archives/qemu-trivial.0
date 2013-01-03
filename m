Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TqgjT-0007b7-0l
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2013 04:04:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TqgjO-0007Zr-Bj
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 04:04:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TqgjN-0008CI-48
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 04:04:54 -0500
Received: from mail-qa0-f53.google.com ([209.85.216.53]:47080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TqgjN-0008CC-0C; Thu, 03 Jan 2013 04:04:53 -0500
Received: by mail-qa0-f53.google.com with SMTP id a19so9538245qad.12
	for <multiple recipients>; Thu, 03 Jan 2013 01:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=csACw6GQ0ix3gEv6tY+H9mNRTegeacAzlA4G4u1/ISQ=;
	b=GUjjtviBFkJNs4/y8/ZsyLPq1JW4hjv05ez+94vLBg/BW6rbmioo9dWgdvkrN6CyNF
	x3PaO/TnjbgtHSItsNatiiAXNYbuDMAP+5R2fjFI3lkXUiykyejHwnfc9H9ZtiH3v+V2
	1KXrm7GeQWcX91h2dNuF9PVjfTp+y6u4KKBnse37CTvvXSCfkuEanDzzK2YR0T7Jql5V
	WxEO84ck78tKGmd4VsR5WIQehWsRoW5/2ZvR75riBKlhshFch5Ioapajr7ZDRWPGx5LW
	d9gFU1Cv+drKbk5J+PQzm4Z2JSMl+pGRbfKeh3c89dOE2aFcfCtUpuHkp+cRfaLCdLUU
	sIOg==
X-Received: by 10.49.133.68 with SMTP id pa4mr31889194qeb.50.1357203889683;
	Thu, 03 Jan 2013 01:04:49 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id eg9sm13268289qab.7.2013.01.03.01.04.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 01:04:48 -0800 (PST)
Date: Thu, 3 Jan 2013 10:04:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: John Spencer <maillist-qemu@barfooze.de>
Message-ID: <20130103090444.GD11586@stefanha-thinkpad.muc.redhat.com>
References: <1356479389-1967-1-git-send-email-maillist-qemu@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1356479389-1967-1-git-send-email-maillist-qemu@barfooze.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.216.53
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] linux-user/syscall.c: remove forward
 declarations
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
X-List-Received-Date: Thu, 03 Jan 2013 09:04:56 -0000

On Wed, Dec 26, 2012 at 12:49:49AM +0100, John Spencer wrote:
> instead use the correct headers that define these functions.
> 
> Requested-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: John Spencer <maillist-qemu@barfooze.de>
> ---
>  linux-user/syscall.c |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

