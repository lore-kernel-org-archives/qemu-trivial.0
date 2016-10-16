Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvnt7-0003lX-N7
	for mharc-qemu-trivial@gnu.org; Sun, 16 Oct 2016 12:02:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <danielsh@apache.org>) id 1bvnIk-0004eE-1a
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 11:24:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <danielsh@apache.org>) id 1bvnIj-0005ln-BO
	for qemu-trivial@nongnu.org; Sun, 16 Oct 2016 11:24:38 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <danielsh@apache.org>)
	id 1bvnIf-0005km-66; Sun, 16 Oct 2016 11:24:33 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id C20A6204ED;
	Sun, 16 Oct 2016 11:24:25 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Sun, 16 Oct 2016 11:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=awgrtU9d6Ev5LehUaLTXHbvLZ5c=; b=OqFxQ
	4u30pIJbnW/xLFZcoewc2iahrbjbgNGqGtN6XOlEFaQRvj9JxX5YNFheKp8FjTc4
	QBI2ZTxTTKTwYPG0Ivj/PWT4iJvLcupAwdofNNRTR2Rnr+zUzo831uY/ZX4pIqht
	HuG1508vV8mYrZ0+W01FcLhfLkPNfURKkVzYBg=
X-Sasl-enc: m0/aNfnaQHEBqVmNc63jBJgUcAMUibMx1z5LO9GZARZF 1476631465
Received: from fujitsu.shahaf.local2 (bzq-109-66-41-80.red.bezeqint.net
	[109.66.41.80])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5C560CC083;
	Sun, 16 Oct 2016 11:24:25 -0400 (EDT)
Received: by fujitsu.shahaf.local2 (Postfix, from userid 1000)
	id 3sxlSp5F7tz1cG; Sun, 16 Oct 2016 15:22:34 +0000 (UTC)
Date: Sun, 16 Oct 2016 15:22:34 +0000
From: Daniel Shahaf <danielsh@apache.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20161016152234.GA15437@fujitsu.shahaf.local2>
References: <1476628228-7425-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1476628228-7425-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.25
X-Mailman-Approved-At: Sun, 16 Oct 2016 12:02:12 -0400
Subject: Re: [Qemu-trivial] [PATCH] scripts/hxtool: fix undefined behavour
 of echo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Oct 2016 15:24:38 -0000

Michael Tokarev wrote on Sun, Oct 16, 2016 at 17:30:28 +0300:
> From: Daniel Shahaf <danielsh@apache.org>
> 
> Avoid undefined behaviour of echo(1) with backslashes in arguments
> The behaviour is implementation-defined, different /bin/sh's behave
> differently.
> 

Signed-off-by: Daniel Shahaf <danielsh@apache.org>

> Signed-off-By: Michael Tokarev <mjt@tls.msk.ru>
> ---
> Submitting this patch upstream, thank you very much!
> Daniel, can you please add your Signed-off-By line?

Like this?

Thank you for forwarding the patch upstream.

Daniel

