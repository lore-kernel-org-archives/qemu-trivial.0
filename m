Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QwVDe-0000g3-P6
	for mharc-qemu-trivial@gnu.org; Thu, 25 Aug 2011 04:23:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QwVDb-0000RO-5z
	for qemu-trivial@nongnu.org; Thu, 25 Aug 2011 04:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QwVDa-0007lb-6c
	for qemu-trivial@nongnu.org; Thu, 25 Aug 2011 04:23:19 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:45310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QwVDX-0007l6-CF; Thu, 25 Aug 2011 04:23:15 -0400
Received: by fxbb27 with SMTP id b27so1779444fxb.4
	for <multiple recipients>; Thu, 25 Aug 2011 01:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZdzENCuWn4k3u0Dqoh7CIAWxfjUs52S7UFOQTIVWrAw=;
	b=Lnil3jsAalP4hKA6iJwr5oMoydCU/J/9vIlQb6W6hT2m+9zv4wqoMk2vNhK9gKGbL/
	v5oplA6iqQCwfTrbbN6CgaLM07IA++N3sHI1ZW4bJ6FmS52K2QTXSmD6hGXmngYj1kOj
	s4ML8Tw+R3mxMpOwYps+4odea3gWySskmnnnk=
Received: by 10.223.76.201 with SMTP id d9mr8698264fak.119.1314260594281;
	Thu, 25 Aug 2011 01:23:14 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id c18sm281905fah.39.2011.08.25.01.23.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Aug 2011 01:23:13 -0700 (PDT)
Date: Thu, 25 Aug 2011 09:23:07 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Frediano Ziglio <freddy77@gmail.com>
Message-ID: <20110825082307.GA10892@stefanha-thinkpad.localdomain>
References: <1314256478-4853-1-git-send-email-freddy77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1314256478-4853-1-git-send-email-freddy77@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] disasm: update comment
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
X-List-Received-Date: Thu, 25 Aug 2011 08:23:20 -0000

On Thu, Aug 25, 2011 at 09:14:38AM +0200, Frediano Ziglio wrote:
> 
> Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
> ---
>  disas.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

