Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJieZ-0001sy-4Z
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 05:55:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJieW-0001jM-14
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 05:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SJieP-0006mH-RY
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 05:55:19 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:46606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SJieH-0006Vw-OC; Mon, 16 Apr 2012 05:55:05 -0400
Received: by wgbds1 with SMTP id ds1so7671939wgb.4
	for <multiple recipients>; Mon, 16 Apr 2012 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jCtlwac6OEh0GILwFGJrZe4oQV/LyE8B+bEN7GRWCi4=;
	b=SYRl2SxvmiuZdGnfwbKy9WGoIZK4CWpjqbFyCbdyaG6S1JWK1gIoxv9Eaf0NLMpAVU
	elZ74cDaJjnuOr7nbkJq5WrVNapN4hjSMn2d4Xqn3abHRFeN+rmZgCk9XCwwWsiEBwqt
	EifN0OnkiC6vbqRvEaJAs2HEGh2UYgQRnIbUS8bZ2gc3wQ8R4YIYjhfv8j9GhLottkyq
	cydiiE7BiRj9d2BWv/T7tbyG6HknTz+32GBfsaP06FksH63MpNkhXcgw9vy4cGYkYIak
	up+Cyi1WfqakTgIaT2WGAhzjHvnH10D+ywCWgMVbZY3az1SHsUP8yfRovULEzDCiDV5w
	F6cw==
Received: by 10.216.136.157 with SMTP id w29mr6537453wei.23.1334570103085;
	Mon, 16 Apr 2012 02:55:03 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	gd4sm30007495wib.6.2012.04.16.02.55.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 02:55:02 -0700 (PDT)
Date: Mon, 16 Apr 2012 10:54:58 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20120416095458.GA5424@stefanha-thinkpad.localdomain>
References: <1334311426-5694-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334311426-5694-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix block_job_set_speed
 name in documentation
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
X-List-Received-Date: Mon, 16 Apr 2012 09:55:22 -0000

On Fri, Apr 13, 2012 at 12:03:46PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hmp-commands.hx |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

