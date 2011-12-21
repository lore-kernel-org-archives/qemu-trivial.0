Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RdJtW-0006ds-BT
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2011 05:59:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RdJtQ-0006d7-RH
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 05:59:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RdJtK-0005Wa-DW
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 05:59:28 -0500
Received: from mail-qw0-f45.google.com ([209.85.216.45]:60263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RdJtK-0005WQ-8q; Wed, 21 Dec 2011 05:59:22 -0500
Received: by qadc10 with SMTP id c10so3537936qad.4
	for <multiple recipients>; Wed, 21 Dec 2011 02:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PnoJiB3KF6+EfG9N4L5hXdjlGPp6b229lPF5F1rSqtw=;
	b=F9YeD9Lwf1wMTjP0bfvpQ8W93Cegrmo/7G/rzonsbZ610usUmtWjNuPupZkQ1jVaa2
	B8+61RmDOKpa3cTVHmQwHt28owdzYUtp0z94klpCCK6LhMmW+zNZIjgENQrPMMZa8xeK
	gsZsRd/h4WPFXYQ8aIxvIf0KHxnQVyZanplCw=
Received: by 10.224.98.8 with SMTP id o8mr7410774qan.79.1324465161899;
	Wed, 21 Dec 2011 02:59:21 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id q14sm9919777qap.4.2011.12.21.02.59.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 02:59:20 -0800 (PST)
Date: Wed, 21 Dec 2011 10:59:17 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alon Levy <alevy@redhat.com>
Message-ID: <20111221105917.GB22697@stefanha-thinkpad.localdomain>
References: <1324379118-2570-1-git-send-email-alevy@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1324379118-2570-1-git-send-email-alevy@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: fix
	tls-channel help text
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
X-List-Received-Date: Wed, 21 Dec 2011 10:59:33 -0000

On Tue, Dec 20, 2011 at 01:05:18PM +0200, Alon Levy wrote:
> Remove the default compiled out tunnel channel, add the always available
> cursor channel. Optimally the man page would depend on compiled in
> options, but that's harder to do.
> 
> RHBZ: 688586
> 
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>  qemu-options.hx |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

