Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXsWW-000774-IS
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2011 05:45:20 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsWQ-00071h-1s
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:45:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsWF-0002Nr-UO
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:45:13 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:34759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RXsWF-0002Hf-O7; Tue, 06 Dec 2011 05:45:03 -0500
Received: by mail-bw0-f45.google.com with SMTP id q10so5975115bka.4
	for <multiple recipients>; Tue, 06 Dec 2011 02:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H1IanwNmCFgmyfVt51V2+KEgYjIf/Lhv5YWkdvcx6wI=;
	b=YP+DiIcX28yqskoc52zvkSRt6QC6v/rGjD3I5rp1fIglUNx7QFDE89Yd9ziSUGI1bL
	W1Uwfq0EhXlb+46x+RId0+TdxcK0tSTYCBGeg2+gOLyhij61djzjwrX71OYenoUwVAkx
	esYGsyUo7Dx23ZuaKTfXOcKiHmcvkqq33iF/k=
Received: by 10.180.104.2 with SMTP id ga2mr21038106wib.33.1323168302688;
	Tue, 06 Dec 2011 02:45:02 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	bl10sm14259015wib.15.2011.12.06.02.45.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:45:02 -0800 (PST)
Date: Tue, 6 Dec 2011 10:45:00 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111206104500.GD10165@stefanha-thinkpad.localdomain>
References: <1323114854-28049-1-git-send-email-areis@redhat.com>
	<4EDD3C35.4060509@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4EDD3C35.4060509@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Avi Kivity <avi@redhat.com>,
	qemu-devel@nongnu.org, Ademar de Souza Reis Jr <areis@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] memory: minor documentation
 fixes/enhancements
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
X-List-Received-Date: Tue, 06 Dec 2011 10:45:18 -0000

On Mon, Dec 05, 2011 at 10:48:37PM +0100, Stefan Weil wrote:
> Am 05.12.2011 20:54, schrieb Ademar de Souza Reis Jr:
> >Fix typos and minor documentation errors in both memory.h and
> >docs/memory.txt.
> >
> >Also add missing documentation formatting tags to transaction
> >functions.
> >
> >Signed-off-by: Ademar de Souza Reis Jr<areis@redhat.com>
> >---
> >  docs/memory.txt |    6 +++---
> >  memory.h        |   38 ++++++++++++++++++++++----------------
> >  2 files changed, 25 insertions(+), 19 deletions(-)

Thanks, applied to the trivial-patches -next tree.

Stefan

