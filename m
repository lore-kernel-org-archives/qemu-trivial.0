Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT7tA-0000oO-1a
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 05:45:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7t6-0000oB-Fn
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:45:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7t5-0000Cg-0e
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:45:48 -0400
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229]:53311)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UT7t4-0000CW-Rs; Fri, 19 Apr 2013 05:45:46 -0400
Received: by mail-wi0-f169.google.com with SMTP id h11so645626wiv.4
	for <multiple recipients>; Fri, 19 Apr 2013 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FzIJ6i0SV8v0+OY0sKOAi685OW7goVTSTANwBs+6nyw=;
	b=cYTuCe11NfW7Ph0Zhm2/07Ne+EFrWTiy42JUJwJ0Wsxv06HreMdEk2jWaa99BmiyDB
	hYrpBX8I4ifs9g76lCYT6m9DDWhpGLBIWz9NcQkxZ/zsOkFqC54QBbPOZYtZ2t53ILMM
	WzKTnmNL1Az7ak7elIMfl1W8oRlbH6bx2tb2DU9/gqFyv497EUxRtrQXuT5Sf/zZvi1n
	IVEbdGWzVB5kPxu6i5MpCKKlXIBuaSPtjhIOVSvIymtTv28vayGl3q3F8B5KlTev3ML8
	2+un+duhigqldJs3YXBgyW1EIDqB/FlF77lJxlqabScbWkrpHxs+5Hr1JfhUEHyCQKLB
	D3Tg==
X-Received: by 10.181.11.196 with SMTP id ek4mr23907730wid.30.1366364745984;
	Fri, 19 Apr 2013 02:45:45 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:f833:9039:bb71:5207])
	by mx.google.com with ESMTPS id ed6sm2427884wib.9.2013.04.19.02.45.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:45:45 -0700 (PDT)
Date: Fri, 19 Apr 2013 11:45:43 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20130419094543.GH30143@stefanha-thinkpad.redhat.com>
References: <1366319373-12926-1-git-send-email-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366319373-12926-1-git-send-email-rjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::229
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ssh: Remove unnecessary use of strlen
 function.
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
X-List-Received-Date: Fri, 19 Apr 2013 09:45:50 -0000

On Thu, Apr 18, 2013 at 10:09:33PM +0100, Richard W.M. Jones wrote:
> From: "Richard W.M. Jones" <rjones@redhat.com>
> 
> ---
>  block/ssh.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

