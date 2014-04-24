Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WdUqb-0005hD-IX
	for mharc-qemu-trivial@gnu.org; Thu, 24 Apr 2014 21:22:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WdUpW-0003jK-3S
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 21:22:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WdJ4q-0001kq-3u
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 08:48:36 -0400
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234]:44784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WdJ4p-0001jg-Tp; Thu, 24 Apr 2014 08:48:32 -0400
Received: by mail-wi0-f180.google.com with SMTP id q5so989499wiv.7
	for <multiple recipients>; Thu, 24 Apr 2014 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=0lvPN0AT1QJ/kCuBhRngBNhpw8lxIeFmWXpuZMIWLBM=;
	b=PSVvCrF+t4dG1e5IOqAazcejtaqYM0QmsYqUf+CujC1/TIQy1IXMkZfSrSNjq8A3qW
	QcsyMdWRjrO72QypDNfZWZ2WRdA2BqMTLYRivopchtYRnj96TfO/KD1wPypT7hXXiTv6
	L7jhi7+SvTnynJLeH4QDkZbWbr6jTYvsSHD4UN89+dxXwiV7gv1tvASPE55ZTau0gftf
	fO6TwOMVGYoArDMy1eAqRG+M7xSrvsfLJNfpKb8GHoY+R2lTywLcO0y//cHEPdt0l+2y
	96DILuEzn6PYqAxgpCWeXJlGa6aBpt00SMUCxhfxN14KqWYBs6qNNc0d7MDBc+gx+GNt
	G85Q==
X-Received: by 10.180.37.178 with SMTP id z18mr6380711wij.46.1398343710857;
	Thu, 24 Apr 2014 05:48:30 -0700 (PDT)
Received: from localhost (95-91-232-177-dynip.superkabel.de. [95.91.232.177])
	by mx.google.com with ESMTPSA id
	y20sm35243311wiv.14.2014.04.24.05.48.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Apr 2014 05:48:29 -0700 (PDT)
Date: Thu, 24 Apr 2014 14:48:27 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20140424124827.GF3738@stefanha-thinkpad.redhat.com>
References: <1397766673-20990-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1397766673-20990-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::234
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?iso-8859-1?Q?Beno=EEt?= Canet <benoit@irqsave.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Add QEMU logo (SVG file)
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
X-List-Received-Date: Fri, 25 Apr 2014 01:22:36 -0000

On Thu, Apr 17, 2014 at 10:31:13PM +0200, Stefan Weil wrote:
> The "Q" of the logo is already included in pc-bios/qemu_logo_no_text.svg.
> 
> This file now adds the complete logo as it was designed by Benoît Canet.
> Benoît licensed it under CC-BY 3.0, see
> http://lists.gnu.org/archive/html/qemu-devel/2012-02/msg02865.html.
> 
> Unneeded borders from Benoît's original logo were removed,
> and metadata (license, author, date) was added in this version.
> 
> Cc: Benoît Canet <benoit@irqsave.net>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> v2:
> 
> * Added metadata (license CC-BY 3.0, author, date).
> 
> * Fixed a SVG syntax bug (introduced by myself when I stripped
>   some unnecessary lines and removed a ">").
> 
> This version is now used on these pages:
> https://de.wikipedia.org/wiki/QEMU
> https://en.wikipedia.org/wiki/QEMU
> 
> Regards
> Stefan
> 
> 
>  pc-bios/qemu_logo.svg | 1010 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 1010 insertions(+)
>  create mode 100644 pc-bios/qemu_logo.svg

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

