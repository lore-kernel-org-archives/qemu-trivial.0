Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL72e-00024h-L7
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 04:23:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bp@alien8.de>) id 1YL72c-00022N-Nf
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:23:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bp@alien8.de>) id 1YL72b-0004al-Ki
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:23:34 -0500
Received: from mail.skyhub.de ([2a01:4f8:120:8448::d00d]:55548)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <bp@alien8.de>)
	id 1YL72V-0004Wb-Sp; Tue, 10 Feb 2015 04:23:28 -0500
X-Virus-Scanned: Nedap ESD1 at mail.skyhub.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1423560205; bh=RqszSewlb7WH1LUTulgWHBTje4fzDpa/Z3Q1NBoos50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	Content-Type:In-Reply-To; b=pBCq/0BAgEbluYLGjvDVBbnkHo6Ltw2Q5YK85/
	0NeS508MRbFE6Xk/+8u6pAx7GlrlWZ8Ct3VUl4UTB/v6jLia7tEcnVPkr6NhKgeVBUI
	M9vAj6GDvZAk0gPjr6Vrb79gBRlvLy/UH3hdBuSS7EP789QIo/VFN34DoRLeheekRw=
Received: from mail.skyhub.de ([127.0.0.1])
	by localhost (door.skyhub.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2hzXKIj78Xok; Tue, 10 Feb 2015 10:23:24 +0100 (CET)
Received: from pd.tnic (p5DDC6814.dip0.t-ipconnect.de [93.220.104.20])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id
	BF3501D9794; Tue, 10 Feb 2015 10:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1423560204; bh=RqszSewlb7WH1LUTulgWHBTje4fzDpa/Z3Q1NBoos50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	Content-Type:In-Reply-To; b=K2oOQC6O9xoCYflhYN0qH0P31+okJuU4MXZSLO
	bhok9zt+KDa96H9umu6/mGlPqSlN1pQT2juPPueFVTqwPYXHCq0aah/G3NVc7QMZs5o
	xenbBNmmsS8H8nMLgby/n65+ZUk/gV4bCe4Oknzg8OhNvrrop9EyefXiduCtzTtHso=
Received: by pd.tnic (Postfix, from userid 1000)
	id 788EB16162D; Tue, 10 Feb 2015 10:22:50 +0100 (CET)
Date: Tue, 10 Feb 2015 10:22:50 +0100
From: Borislav Petkov <bp@alien8.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150210092250.GA3195@pd.tnic>
References: <1423340992-3156-1-git-send-email-bp@alien8.de>
	<54D735D4.8000105@redhat.com> <20150208121438.GA6290@pd.tnic>
	<54D7D91D.2040505@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54D7D91D.2040505@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:120:8448::d00d
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH] memsave: Improve and disambiguate error
	message
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
X-List-Received-Date: Tue, 10 Feb 2015 09:23:35 -0000

On Sun, Feb 08, 2015 at 10:46:05PM +0100, Paolo Bonzini wrote:
> I use ":set shiftwidth=4 expandtab" and c-indent mode.
> 
> Quick googling for "vim four spaces" suggests the following alternatives:
> 
> * ":set tabstop=8 expandtab shiftwidth=4 softtabstop=4"
> 
> * "set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab".

Thanks Paolo!

:-)

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--

