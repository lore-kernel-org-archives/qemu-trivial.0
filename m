Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UCT4i-0004hS-Pv
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2013 05:56:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UCT4e-0004cw-EM
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 05:56:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UCT4d-0003Sp-DD
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 05:56:52 -0500
Received: from mail-bk0-f54.google.com ([209.85.214.54]:37267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UCT4d-0003Se-6O
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 05:56:51 -0500
Received: by mail-bk0-f54.google.com with SMTP id w5so2323128bku.13
	for <qemu-trivial@nongnu.org>; Mon, 04 Mar 2013 02:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5MxJ7ATPGHajOS1Mxxc67+y3qXTg+u4wQOz1Z8uYM1A=;
	b=yuNapWDVrKKk1MAl8didXUEl6X9wChTXap98918y24GcPKS6GlAws+lNMSAPtSSLgC
	5IK/6xIxad1qgd/QfBUSKll0wosUqFqQcBX6APuTTqrVIoRuYkonjNLhljhHQc4ssdcZ
	roMg/xz6/iZ4yRyq3Sq6BqrQH58nbhZjRBKg6nlOUoWhdaFxHjbfq50ox6q3I5YzZh9n
	y/4AIoscXLH6KYg7/S877YADyB+p0qDK6qWr6SowACKyB2wtWvPIOeTd3gpj3wj6mfRT
	8Et06+3l+cUK9evYqBWH1hUXIAby7wKHGetBjvpkj/Uu+Nfp7bOvIcbiVgAADjBbIE3u
	hr0w==
X-Received: by 10.204.154.87 with SMTP id n23mr7258870bkw.8.1362394610252;
	Mon, 04 Mar 2013 02:56:50 -0800 (PST)
Received: from localhost ([2a02:810d:e80:64:69de:8c87:ab42:42b3])
	by mx.google.com with ESMTPS id r17sm5587270bkw.21.2013.03.04.02.56.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 02:56:49 -0800 (PST)
Date: Mon, 4 Mar 2013 11:56:47 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Message-ID: <20130304105647.GC2837@stefanha-thinkpad.redhat.com>
References: <5130A4E3.70003@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5130A4E3.70003@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.54
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Use qemu_open / qemu_close in rng backend
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
X-List-Received-Date: Mon, 04 Mar 2013 10:56:56 -0000

On Fri, Mar 01, 2013 at 07:53:55AM -0500, Stefan Berger wrote:
> In the rng backend use qemu_open and qemu_close rather than POSIX
> open/close.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

