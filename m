Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QzQgd-0000cR-V4
	for mharc-qemu-trivial@gnu.org; Fri, 02 Sep 2011 06:09:23 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QzQga-0000SB-Qx
	for qemu-trivial@nongnu.org; Fri, 02 Sep 2011 06:09:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QzQgZ-0005TB-OB
	for qemu-trivial@nongnu.org; Fri, 02 Sep 2011 06:09:20 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:55106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QzQgX-0005Rz-22; Fri, 02 Sep 2011 06:09:17 -0400
Received: by wwf25 with SMTP id 25so2579435wwf.10
	for <multiple recipients>; Fri, 02 Sep 2011 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pr0ZJorDhA7li1M8oUSjAvW/nH02J4bcV4z5Hm35+fU=;
	b=a9q6K637H/1edXNPXvUNLK2qetcQePg+haJ4FT/NtgY6e2jKO83kiJiykpLtdKHR59
	m/9Tiv8amsSKSDcqs/2QrLRWeI0XAy5Qol8YnPCjyzwlGL40MCIhCEfxT9tv6AbMWJlc
	ek0CD6cKQuuN7RHb9AQf1VLfwL9tGbPMSEblA=
Received: by 10.227.9.207 with SMTP id m15mr880812wbm.59.1314958155903;
	Fri, 02 Sep 2011 03:09:15 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id et17sm1142726wbb.0.2011.09.02.03.09.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Sep 2011 03:09:14 -0700 (PDT)
Date: Fri, 2 Sep 2011 11:09:08 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Boris Figovsky <boris.figovsky@ravellosystems.com>
Message-ID: <20110902100908.GA23425@stefanha-thinkpad.localdomain>
References: <4e5c8d01.05cbe30a.22c4.ffffe8ac@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e5c8d01.05cbe30a.22c4.ffffe8ac@mx.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] x86: fix daa opcode for al register
 values higher than 0xf9
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
X-List-Received-Date: Fri, 02 Sep 2011 10:09:21 -0000

On Tue, Aug 30, 2011 at 10:00:55AM +0300, Boris Figovsky wrote:
> The second if statement should consider the original al register value,
> and not the new one.
> 
> Signed-off-by: Boris Figovsky <boris.figovksy@ravellosystems.com>
> ---
>  target-i386/op_helper.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

