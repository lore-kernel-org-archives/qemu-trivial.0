Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9b2H-0001CA-T8
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 09:22:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1V9b26-0000z1-Uk
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 09:22:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1V9b1y-00066o-Ib
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 09:22:38 -0400
Received: from mail-ee0-x22c.google.com ([2a00:1450:4013:c00::22c]:51628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1V9b1h-00061r-3v; Wed, 14 Aug 2013 09:22:13 -0400
Received: by mail-ee0-f44.google.com with SMTP id b47so4845883eek.17
	for <multiple recipients>; Wed, 14 Aug 2013 06:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Pr7qw9QozkWGmjIRfGLu+z0EX8D0+6klVYH9m1Do8r4=;
	b=A11hORM7TH+zwM3NtkJnYIad2AE1mAgMH/5RAwqCdSae2EJgA6lnZpgF2w7rE39bDH
	1FdhxnI6nYcWu5mnF6FYEuxwL4nO0F8n1AF4WWAdn1FxlBi3DA3ytbTXK23IlPnTtKOS
	x9YE2rY4/bhuvOMEHcYRVMoImgrxPhSBV7df2y0HNKl5moR3lh4R29fHunZ3/mQC0EtG
	XsdHbHaz6IXt1XYhY7I03JS86ixn0Q2idShhmfyse3BIU31FyhzJoJMn2XOfobP3zR9t
	CoUCIUmGQ/OC5CRzphH32xiQ42qiHPUOpM6s988NKKXIyrUAddboZfN7HCoUALAkzo+V
	MPRw==
X-Received: by 10.14.113.137 with SMTP id a9mr14714714eeh.3.1376486532304;
	Wed, 14 Aug 2013 06:22:12 -0700 (PDT)
Received: from localhost (178-26-138-183-dynip.superkabel.de. [178.26.138.183])
	by mx.google.com with ESMTPSA id
	bp43sm75116955eeb.4.2013.08.14.06.22.10 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 06:22:11 -0700 (PDT)
Date: Wed, 14 Aug 2013 15:22:09 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "M. Mohan Kumar" <mohan@in.ibm.com>
Message-ID: <20130814132209.GB26698@stefanha-thinkpad.redhat.com>
References: <1376483201-13466-1-git-send-email-mohan@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376483201-13466-1-git-send-email-mohan@in.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22c
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH for-1.6] block: Dont ignore previously
	set bdrv_flags
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
X-List-Received-Date: Wed, 14 Aug 2013 13:22:48 -0000

On Wed, Aug 14, 2013 at 05:56:41PM +0530, M. Mohan Kumar wrote:
> From: "M. Mohan Kumar" <mohan@in.ibm.com>
> 
> bdrv_flags is set by bdrv_parse_discard_flags(), but later it is reset
> to zero.
> 
> Signed-off-by: M. Mohan Kumar <mohan@in.ibm.com>
> ---
>  blockdev.c | 1 -
>  1 file changed, 1 deletion(-)

Anthony: Please merge this directly into QEMU 1.6, it's a regression
from QEMU 1.5.

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

