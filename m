Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RioDD-00048T-7M
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jan 2012 09:22:35 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RioD2-0003aE-FH
	for qemu-trivial@nongnu.org; Thu, 05 Jan 2012 09:22:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RioCy-0003Dm-Ha
	for qemu-trivial@nongnu.org; Thu, 05 Jan 2012 09:22:24 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:65275)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RioCw-0003DR-Gg; Thu, 05 Jan 2012 09:22:18 -0500
Received: by werb10 with SMTP id b10so467147wer.4
	for <multiple recipients>; Thu, 05 Jan 2012 06:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+x0rD1dtCEEAwlEnT6+c8UzMLvfbEdB+ELj6ubByLeQ=;
	b=cuA+ohPXAWv/zky5GCcwL3cZN4NYKjFR4ZKc2NW00lQHUnusiz4j+mVHfsV5Q+vIxX
	vIvYpazGVgBrgxEHPPXqeU3lLJpKVhuSLX+JjCqwN+W+T9kgfRd2VYu7BawfY9s+p67e
	UmZ4LDBX7qB3FNfjXD62G2ALeS4gBdtQ32HO0=
MIME-Version: 1.0
Received: by 10.216.136.234 with SMTP id w84mr1297233wei.9.1325773337569; Thu,
	05 Jan 2012 06:22:17 -0800 (PST)
Received: by 10.180.101.135 with HTTP; Thu, 5 Jan 2012 06:22:17 -0800 (PST)
In-Reply-To: <4F05A59D.4060407@redhat.com>
References: <1325769367-32267-1-git-send-email-stefanha@linux.vnet.ibm.com>
	<4F05A59D.4060407@redhat.com>
Date: Thu, 5 Jan 2012 14:22:17 +0000
Message-ID: <CAJSP0QVgieLP2S5bMzB1HaNRMKtffKp0P1JE4YTk6Oa9iR_vcg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Dr David Alan Gilbert <davidagilbert@uk.ibm.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-nbd: drop loop which
	can never loop
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
X-List-Received-Date: Thu, 05 Jan 2012 14:22:33 -0000

On Thu, Jan 5, 2012 at 1:29 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> I suppose it will get in through your trivial patches tree, won't it?

Yes

