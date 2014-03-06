Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLVsB-0005CW-DH
	for mharc-qemu-trivial@gnu.org; Thu, 06 Mar 2014 05:49:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WLVs3-000581-Hi
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 05:49:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WLVrx-0000WX-U6
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 05:49:47 -0500
Received: from mail-ea0-x22c.google.com ([2a00:1450:4013:c01::22c]:60814)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WLVrx-0000WR-HR; Thu, 06 Mar 2014 05:49:41 -0500
Received: by mail-ea0-f172.google.com with SMTP id l9so1602070eaj.31
	for <multiple recipients>; Thu, 06 Mar 2014 02:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wEBTtxpvZ/vOFSmNy/IgUAdiNV/lc0OAr52gZXMSsuw=;
	b=GnMI3QP7QWC9s231xJEF/VwaR8yEAipgXSNGLX101F1TQy88wrIbJpbFHvWh30cwRL
	UsJ3N8NQG+7SuNZfDcsryIaVlVqemMWJhpYBREApBZeP0NiwKHDAncCuCehIilWXapI/
	6+0XheLcNit/r2H11E55EijqyY1DLvpRwvO47P7lVhKhkldjaV9q5j8ZLW7+Qxbkk4U/
	9pnTDgj0KqFwFglpqQhrnVaFsV8/uH2B4dABeAU3ZpliUrWRNx4RAr1ZDo+HLN7ZhicZ
	P9P1KV7HfoDEeeQ6MIELpAr1jbIh8PF15t/PKPLxPubVcX1dgEjlIR4g80PUj7AepKuU
	ifLQ==
X-Received: by 10.14.127.4 with SMTP id c4mr3171610eei.86.1394102980374;
	Thu, 06 Mar 2014 02:49:40 -0800 (PST)
Received: from localhost (95-91-232-57-dynip.superkabel.de. [95.91.232.57])
	by mx.google.com with ESMTPSA id m8sm20474854eef.14.2014.03.06.02.49.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 02:49:39 -0800 (PST)
Date: Thu, 6 Mar 2014 11:49:37 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20140306104937.GI23172@stefanha-thinkpad.redhat.com>
References: <1394054580-29120-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394054580-29120-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22c
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-io: Fix warnings from
 static code analysis
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
X-List-Received-Date: Thu, 06 Mar 2014 10:49:53 -0000

On Wed, Mar 05, 2014 at 10:23:00PM +0100, Stefan Weil wrote:
> Smatch complains about several global symbols which should be local.
> 
> Add the missing 'static' attributes and move the 'extern' declaration
> of variable qemuio_misalign to qemu-io.h. This variable also changes
> the type from 'int' to 'bool' which better fits documents its use.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  include/qemu-io.h |    2 ++
>  qemu-io-cmds.c    |    2 +-
>  qemu-io.c         |    7 +++----
>  3 files changed, 6 insertions(+), 5 deletions(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

