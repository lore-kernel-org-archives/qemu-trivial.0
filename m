Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TkzxR-0002o5-3K
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2012 11:23:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TkzxK-0002mB-0e
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:23:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TkzxI-0004qg-Mm
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:23:45 -0500
Received: from mail-we0-f181.google.com ([74.125.82.181]:52510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TkzxI-0004qQ-Ex; Tue, 18 Dec 2012 11:23:44 -0500
Received: by mail-we0-f181.google.com with SMTP id t11so387785wey.40
	for <multiple recipients>; Tue, 18 Dec 2012 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rnAtlZSjXkpRlaL7en71qNabm89F+ZnPvmfrA/AbuUU=;
	b=UOfSWndPRB45W/6Uo7zWU3CNegCVuBZzJgzKYCqhtJ0BQn/bJxA4puO5MIpH1RBFdU
	KdiEuv4+vCbafONFAo4m7yqpbQCpE3vUaE3HkdBs4UJeMga4qeIp1LxBxZuiVidTHf1t
	65BAh+RM2Md6H/SNoQ9JyklA5j6r3/vuJOCuKaQqudVPyM9Xfke2k4JM8uv49i5wj7Rn
	1tnHbcr6GFW0IpQnyn2NfeK8wIwm/k3Zu4Xq2H6hWDtolDfgEuH8GOnwYnHWzEdLR4tw
	47KoxwPQzRO91pLcPpuYr6HkdZjKXl93wvS4J9/gEEdwmuAeGjQo6d7o5qhH5r5BUHs+
	CVqg==
X-Received: by 10.194.19.10 with SMTP id a10mr5551158wje.45.1355847823362;
	Tue, 18 Dec 2012 08:23:43 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id hi2sm10225194wib.10.2012.12.18.08.23.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:23:42 -0800 (PST)
Date: Tue, 18 Dec 2012 17:23:41 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: John Spencer <maillist-qemu@barfooze.de>
Message-ID: <20121218162341.GD12099@stefanha-thinkpad.redhat.com>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
	<1355122786-29243-2-git-send-email-maillist-qemu@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1355122786-29243-2-git-send-email-maillist-qemu@barfooze.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/4] fix build error on ARM due to wrong
 glibc check
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
X-List-Received-Date: Tue, 18 Dec 2012 16:23:51 -0000

On Mon, Dec 10, 2012 at 07:59:44AM +0100, John Spencer wrote:
> the test for glibc < 2 "succeeds" wrongly for any non-glibc C library,
> and breaks the build on musl libc.
> we must first test if __GLIBC__ is defined at all, before using it
> unconditionally.
> 
> Signed-off-by: John Spencer <maillist-qemu@barfooze.de>
> 
> ---
>  user-exec.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied Patch 2 to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

