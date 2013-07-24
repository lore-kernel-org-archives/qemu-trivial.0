Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1y7F-0003j1-8E
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jul 2013 08:24:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1V1y7B-0003dR-N8
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 08:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1V1y79-0000Hf-6K
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 08:24:21 -0400
Received: from mail-qe0-x22a.google.com ([2607:f8b0:400d:c02::22a]:60897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1V1y73-0000G8-9x; Wed, 24 Jul 2013 08:24:13 -0400
Received: by mail-qe0-f42.google.com with SMTP id s1so2655966qeb.15
	for <multiple recipients>; Wed, 24 Jul 2013 05:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=HfQ+jSiM4TDhNTBEj3JPiBiLw9Pw1FxcNEn1tI1/zBU=;
	b=CwmkBCz9Tof7MBRHKjEljUNqSGAYM9jlTTujTwQo7SBoCUNl9YQNa75fUv3ja/jttv
	nmC144I7lWdzqvMZpSY9cd0ansBBgDbRSNUU0hBq64vIz4FE5JB6VwyEZvSrYc6iO8Uj
	UcWOLVzRPr4xEu+tLTY9nMonWWR6hfTTlVQ4aYUrC4/Sa/hc6FRog1z2r+20JAzjsDcf
	y5a/NqUUJp94DYhD17vSlVHsIwMK/HMNzsXCpr1xZqV8jl7hZ29T0jLLwQdqhM3J3hwK
	K4mgzUqlyx/3FEfZrs/Sb9az9aath5HZF5+H0uq0slJ1ZCajwB/trV19a22HLj0lEZRe
	Uc1A==
MIME-Version: 1.0
X-Received: by 10.229.204.131 with SMTP id fm3mr10207116qcb.15.1374668652720; 
	Wed, 24 Jul 2013 05:24:12 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.209.6 with HTTP; Wed, 24 Jul 2013 05:24:12 -0700 (PDT)
In-Reply-To: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Wed, 24 Jul 2013 08:24:12 -0400
X-Google-Sender-Auth: TTW-9HXRuHP2HFwg0FZ2hewWilo
Message-ID: <CAPyFy2BLhkY6hRhadiwP8xeqAyTBLNuG2rT+GuT+bNUQj5EZ5g@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::22a
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PULL trivial 0/5] trivial patches for 2013-07-19
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
X-List-Received-Date: Wed, 24 Jul 2013 12:24:24 -0000

On 19 July 2013 05:11, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is another trivial-patches pull request.  This time
> we have just 5 patches accumulated in two (!) weeks period.
> Please consider apply.
...
> Michael Tokarev (2):
>       slirp: remove mbuf(m_hdr,m_dat) indirection

Any idea when this might get pulled?  The FreeBSD build is broken
until this slirp fix makes it in.

