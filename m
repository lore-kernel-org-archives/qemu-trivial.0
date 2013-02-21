Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8Sc1-00088O-5Q
	for mharc-qemu-trivial@gnu.org; Thu, 21 Feb 2013 04:38:45 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U8Sbu-0007oh-Ct
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2013 04:38:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U8Sbq-0002DJ-By
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2013 04:38:38 -0500
Received: from mail-wi0-f171.google.com ([209.85.212.171]:53959)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U8SbZ-00026p-Qu; Thu, 21 Feb 2013 04:38:18 -0500
Received: by mail-wi0-f171.google.com with SMTP id hn17so7243093wib.16
	for <multiple recipients>; Thu, 21 Feb 2013 01:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=lcMWOWk0XUxZSvH2EygRBrRsbD7W7AjNoMsToKHDM/o=;
	b=e3O0UzaUJ0BIBcS0424V76tVdEBkG5fN9WlKG0JCyCdVo9bWcRoCVPqdp4Lft1Be3G
	d81WzWxEj9RrROvsctsOjE8swWsNol8wyUkj3vlNGgXXUsa1xujuc5WAqJ3BU4GINhuf
	KImFr818YjoX0GW8qkrrDZHH9FNG9fDKaAemv2L2hcpvaA6VJNrI57aoTP09AQISbaW0
	IS8qXCLbcaYFG0Oka3AKQZf9zOOCGEf4Uk/5gAKS+baTKs6wj391cbotC5+N7ajbqqTv
	iwYtsaCaDQNQyyI/X5XaaZFx/BdD3hQGFMCICeaJaS8VfAauoJteZx1C1ULDxQdgxPGp
	jCZA==
X-Received: by 10.180.80.34 with SMTP id o2mr2637321wix.0.1361439496798;
	Thu, 21 Feb 2013 01:38:16 -0800 (PST)
Received: from localhost ([2a02:810d:ec0:dd:4041:25e8:2e7:b222])
	by mx.google.com with ESMTPS id cf8sm26343514wib.1.2013.02.21.01.38.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 21 Feb 2013 01:38:15 -0800 (PST)
Date: Thu, 21 Feb 2013 10:38:13 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cole Robinson <crobinso@redhat.com>
Message-ID: <20130221093813.GA23228@stefanha-thinkpad.redhat.com>
References: <c6ae3e0f8f1c3aa615871b6ae6b6f975effa4e6e.1361313688.git.crobinso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6ae3e0f8f1c3aa615871b6ae6b6f975effa4e6e.1361313688.git.crobinso@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.171
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] .gitignore: Ignore
	optionrom/*.asm
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
X-List-Received-Date: Thu, 21 Feb 2013 09:38:43 -0000

On Tue, Feb 19, 2013 at 05:41:28PM -0500, Cole Robinson wrote:
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  .gitignore | 3 +++
>  1 file changed, 3 insertions(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

