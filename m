Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0CXc-00016M-8y
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2013 09:52:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0CXV-0000mE-JK
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 09:52:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0CXU-0004SN-LK
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2013 09:51:57 -0500
Received: from mail-ea0-f173.google.com ([209.85.215.173]:59788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U0CXS-0004Rf-5M; Tue, 29 Jan 2013 09:51:54 -0500
Received: by mail-ea0-f173.google.com with SMTP id i1so228348eaa.18
	for <multiple recipients>; Tue, 29 Jan 2013 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=JUWAYyLa79+rsNPLX/fEkqqyCJxCSBc34dBtyPzO+oI=;
	b=x6/+Jh7qF0tBA1e8nuHFNIrum3EvwPSrtasnZ3Wja/K/+PJ1KHU4XNQ5K+qy8J8N86
	F8MJN8n3gfV3plAtkkpSJaaWcPSMLHSuHhbS9it3euMcrTx5kXDPDgfA8hcM6xdTJcct
	i7GDzDGAEZw8bctRS0UxXfwLQWh+R50J4anSv2eUsRoHn9K+vdrco/G9ntksZ0s5GiDB
	T3wLxed+AvEGm9OV8UHDp4UsWtEHfFpLl5G96fDmUPrlrl7shrLOWcpJ6wtsqAObXUd3
	0iZCRako7pxwcRjNWaexdNwASAjd1R9+Z2tE7LQXkzMsxgLlzQNf0EDLGiUNqCPk66eO
	B5Mg==
X-Received: by 10.14.201.69 with SMTP id a45mr3276980eeo.43.1359471113097;
	Tue, 29 Jan 2013 06:51:53 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id g2sm20639549eep.16.2013.01.29.06.51.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 06:51:52 -0800 (PST)
Date: Tue, 29 Jan 2013 15:51:49 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Vishvananda Ishaya <vishvananda@gmail.com>
Message-ID: <20130129145149.GB17664@stefanha-thinkpad.redhat.com>
References: <1359050528-52668-1-git-send-email-vishvananda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1359050528-52668-1-git-send-email-vishvananda@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Fix
 is_allocated_above with resized files
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
X-List-Received-Date: Tue, 29 Jan 2013 14:52:03 -0000

On Thu, Jan 24, 2013 at 10:02:08AM -0800, Vishvananda Ishaya wrote:
> In an image chain, if the base image is smaller than the current
> image, we need to make sure to use the current images count of
> unallocated blocks once we get to the end of the base image. Without
> this change the code will return 0 blocks when it gets to the end
> of the base image and mirror_run will fail its assertion.
> 
> Signed-off-by: Vishvananda Ishaya <vishvananda@gmail.com>
> ---
> Fixes https://bugs.launchpad.net/qemu/+bug/1103868
> 
>  block.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

