Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W2ZzD-0000qk-C5
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jan 2014 00:22:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1W2Zz6-0000iY-Eq
	for qemu-trivial@nongnu.org; Mon, 13 Jan 2014 00:22:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1W2Zz1-0000lD-4h
	for qemu-trivial@nongnu.org; Mon, 13 Jan 2014 00:22:48 -0500
Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e]:49007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1W2Zyp-0000h1-Vg; Mon, 13 Jan 2014 00:22:32 -0500
Received: by mail-ee0-f46.google.com with SMTP id d49so2911018eek.33
	for <multiple recipients>; Sun, 12 Jan 2014 21:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C2n5jOKOQWq28Fd/80GqtZa4QFo/i0xcHVDzfxKvDLs=;
	b=kb9+guOsDcw8M6DjceCu3dIrfHtfN6gvUIHwT1oQjEnlErwYwUC9h5lgS58oHCpqVF
	bmqEnVlR77Jr7+bovOcuKfBVltzsRYDaSr2SyDZ2dxgKu/WU7TcKMSGV04ND3fisDj9I
	B60Un+xtBQsqr+0Q5vJj0u5Ay/SEbgTfN/Dd0elIOnzVDs1jByBapr9muLtWI9sgQtxF
	Z5De4R2VIEd31iuUNDJcL8EGY0IqlTOi9lwTwtJqSUSn9JOHgA13G/qXnU4QKg1UfwIq
	BhmxZ+Jck75GIvvh3meIvf1p7vMLe5+8HXTiuvHwvI3+qyR0Mb0jR+PH6E6VQgmFcJd+
	nySw==
X-Received: by 10.14.198.195 with SMTP id v43mr9501435een.62.1389590551102;
	Sun, 12 Jan 2014 21:22:31 -0800 (PST)
Received: from localhost (42-98-41-126.static.netvigator.com. [42.98.41.126])
	by mx.google.com with ESMTPSA id
	7sm36387425eee.12.2014.01.12.21.22.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Jan 2014 21:22:30 -0800 (PST)
Date: Mon, 13 Jan 2014 13:22:23 +0800
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140113052223.GB14770@stefanha-thinkpad.redhat.com>
References: <1389292467-5570-1-git-send-email-kroosec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389292467-5570-1-git-send-email-kroosec@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22e
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
	aliguori@amazon.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: Use g_strdup_printf
 instead of snprintf.
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
X-List-Received-Date: Mon, 13 Jan 2014 05:22:53 -0000

On Thu, Jan 09, 2014 at 07:34:27PM +0100, Hani Benhabiles wrote:
> assign_name() in net/net.c is using snprintf + g_strdup to get the same
> result as g_strdup_printf.
> 
> Signed-off-by: Hani Benhabiles <kroosec@gmail.com>
> ---
>  net/net.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Thanks, applied to my net tree:
https://github.com/stefanha/qemu/commits/net

Stefan

