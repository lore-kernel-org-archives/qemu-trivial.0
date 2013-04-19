Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT7lu-0004t2-1O
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 05:38:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7lr-0004sb-Mt
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:38:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7lq-0005uI-Be
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:38:19 -0400
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236]:36546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UT7lq-0005uB-2d; Fri, 19 Apr 2013 05:38:18 -0400
Received: by mail-wi0-f182.google.com with SMTP id m6so509032wiv.15
	for <multiple recipients>; Fri, 19 Apr 2013 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=74lpoYADoRiqFD4LIEN+Mt1AOZswA6QuCta9CcooB6s=;
	b=vOWOdlIsrBk9cXCX46HQWRbIJz6NSO2+3Iqnxjs6pXooEaOGiwW4CF0PWcWfo2Pbcx
	zQtnNipbaxXao2VKioRM/ozMzLBN8U0IbVX2O4wEKR/KzOQS19iXdefs65764vIl8iV0
	ORbZLZvG4DwGhV/AfYk8CWDDpdhT8fu1HixrJNpB2LWyg1spgVYxSyoKyKZ9nOdCkJlu
	SVXYcvxOr5VVHQQ6CuzIjcsrbS/MZpXqBHi2QnNbguhdjuDXy3q4Pt7i5h2cUjQDx1Po
	3u3NwyiLTFFTTpH67G4LQf1P0QhBOVivo/4Crza8tU0N3OTQRioFqmVdX40YuT+iXAI9
	4/SA==
X-Received: by 10.180.21.167 with SMTP id w7mr1237118wie.2.1366364297248;
	Fri, 19 Apr 2013 02:38:17 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:f833:9039:bb71:5207])
	by mx.google.com with ESMTPSA id ej8sm2112728wib.9.2013.04.19.02.38.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:38:16 -0700 (PDT)
Date: Fri, 19 Apr 2013 11:38:14 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130419093814.GD30143@stefanha-thinkpad.redhat.com>
References: <1365885950-27598-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365885950-27598-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] w64: Fix compiler warnings (wrong format
 specifier)
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
X-List-Received-Date: Fri, 19 Apr 2013 09:38:20 -0000

On Sat, Apr 13, 2013 at 10:45:50PM +0200, Stefan Weil wrote:
> GetLastError() returns a DWORD value which is unsigned long,
> so the correct format specifier is %lu.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Debian's w32 cross compiler does not complain about the wrong
> specifiers, but the w64 cross compiler does.
> 
> I'm sorry that I did not notice this before sending the pull
> request.
> 
> 
>  cpus.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

