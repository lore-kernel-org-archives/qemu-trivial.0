Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNRu7-0001HF-Gz
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 11:18:35 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRu5-0001H9-AO
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:18:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRu3-0007ED-B5
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:18:33 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:59265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRu3-0007Ae-0f
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:18:31 -0500
Received: by faap15 with SMTP id p15so6429974faa.4
	for <qemu-trivial@nongnu.org>; Mon, 07 Nov 2011 08:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=hrEcTLgodrhfyOlqR/ZXYUb/ysAQf9SAWJpFy9ZVN6Q=;
	b=PODMSw0rpnClwhePMfx/CZnXbZRAhU8txTPlNS+ApJY1lV2o+NMmXVflgeI5rNPioK
	Z9bP+WbxPhY+n3OJ5EfFJv2m+ah681u+To+dqEZy40M9n9BZgcfsNV0w4yI0dDj49ArQ
	7L0B5MHYRXOi7DykmLazQ+p0OWdskqMdwihHg=
Received: by 10.223.57.132 with SMTP id c4mr20258676fah.0.1320682710070;
	Mon, 07 Nov 2011 08:18:30 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	y10sm28607400fal.10.2011.11.07.08.18.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 08:18:28 -0800 (PST)
Date: Mon, 7 Nov 2011 16:18:27 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20111107161827.GA14396@stefanha-thinkpad.localdomain>
References: <20111104171444.GA85143@cs.nctu.edu.tw>
	<20111107081152.GC9450@stefanha-thinkpad.localdomain>
	<20111107092751.GA8377@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20111107092751.GA8377@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-tech.texi: Update default code
 cache size
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
X-List-Received-Date: Mon, 07 Nov 2011 16:18:34 -0000

On Mon, Nov 07, 2011 at 05:27:51PM +0800, 陳韋任 wrote:
> > >   Update the document since the default code cache size is 32 MB now.
> > > 
> > > Signed-off-by: chenwj <chenwj@cs.nctu.edu.tw>
> > > ---
> > >  qemu-tech.texi |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > Can you point me to the place in the code where we use 32 MB?
> 
>   In exec.c,
> 
> #define DEFAULT_CODE_GEN_BUFFER_SIZE (32 * 1024 * 1024) <--- HERE
> 
> #ifdef USE_STATIC_CODE_GEN_BUFFER
> static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
>                __attribute__((aligned (CODE_GEN_ALIGN)));
> #endif

Thank you.  I don't work on TCG and after a little bit of unsuccessful
grepping I figured it would be easiest to ask you :).

Stefan

