Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4XfP-00011k-92
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 08:09:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4XfH-00010v-LA
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:09:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4Xet-0006Qu-38
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:09:23 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:57216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4Xes-0006QO-QB; Mon, 05 Mar 2012 08:08:59 -0500
Received: by wibhi18 with SMTP id hi18so2419934wib.4
	for <multiple recipients>; Mon, 05 Mar 2012 05:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dpQHuI14v17/DDFlq70ZP/mmre0UoAyr46rpxF5YMKc=;
	b=JP+wnUtFPD52ys++Gv4t7KCBGzCKWfK5FFsgY3VB4j3MHm2Ljhqk2f5qlOEKVMNfC2
	yq8TQJA4xGm8/wPxIg4+chCtPymXF1ctwRZRBRlcoN4ZSzJsp2jCQHyKyjYja6LLjlvU
	KzGQv+y72cAD5h0zBIsrDx6fR3tBSlaJk7sWWYLw1f8PIkbelxReAOI5FxjhxG8gUyIg
	SxmzyIeDxiQvS4Z2YrES9iQBnffD2pJ1IgJz+my6gBY+jPN6geGMeEacJbDIVMglEISU
	fzl7XmXvDoalQqY4pxnNjuaLfm5RDIZXqMHyXkgHb6BZ4mpdlu8zZeGhNDMEbsaoBaZH
	Co5w==
Received: by 10.180.92.165 with SMTP id cn5mr13925362wib.1.1330952936193;
	Mon, 05 Mar 2012 05:08:56 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	fb2sm20827866wid.3.2012.03.05.05.08.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 05:08:55 -0800 (PST)
Date: Mon, 5 Mar 2012 13:08:53 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120305130853.GB28506@stefanha-thinkpad.localdomain>
References: <1330174030-21373-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330174030-21373-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix spelling in
	documentation
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
X-List-Received-Date: Mon, 05 Mar 2012 13:09:29 -0000

On Sat, Feb 25, 2012 at 01:47:09PM +0100, Stefan Weil wrote:
> This fixes a new spelling issue which was detected by codespell.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  include/qemu/object.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

