Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UzSyQ-0000P9-B6
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jul 2013 10:44:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UzSyI-0000BA-Ht
	for qemu-trivial@nongnu.org; Wed, 17 Jul 2013 10:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UzSyF-0000Tg-G5
	for qemu-trivial@nongnu.org; Wed, 17 Jul 2013 10:44:50 -0400
Received: from mail-qe0-x232.google.com ([2607:f8b0:400d:c02::232]:62850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1UzSy9-0000Rq-D3; Wed, 17 Jul 2013 10:44:41 -0400
Received: by mail-qe0-f50.google.com with SMTP id f6so1145255qej.23
	for <multiple recipients>; Wed, 17 Jul 2013 07:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=vXm3ll/hKOTz5eGoveRzMhs7Gvk/KarbYtKirdxS3ow=;
	b=zhbQfY0aF7LBoHeOHcH8dSb/adfzMMa3014hXL6rqsHGcGQt0XJgGzdGlO9sewbZsg
	6zqoWVIxglDjqHESLPhNyxhmqPxIA5hEfqCKsgnEV0MW8EVN1kRjupwnsPgDHrfOWq/t
	2cVNwTr7H/WzgmkTK/Jnzh/iZxfP9LazXgLlDPo2eD4gG0wmfV/u0upm44Tpy0Lpt4xT
	HxPt37MGed0fCf4ESnrO3+twiqAwPZTt7qg2m58VK6ZTvlEYi8p/MgD1CEkc44ZfFpBX
	b8PDk6A/ng0PZjIa4yM/cwSx734P7R5+DJhNj+5XMxwtOiQHFO7bSw6Eu9YTyGr4QPDv
	mP4A==
MIME-Version: 1.0
X-Received: by 10.49.13.229 with SMTP id k5mr8096514qec.64.1374072280533; Wed,
	17 Jul 2013 07:44:40 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.209.6 with HTTP; Wed, 17 Jul 2013 07:44:40 -0700 (PDT)
In-Reply-To: <51E65BDE.60402@msgid.tls.msk.ru>
References: <1373660992-92075-1-git-send-email-emaste@freebsd.org>
	<51E11A1B.2020503@msgid.tls.msk.ru>
	<CAPyFy2BW9+hLC=7+oxnyiA17Lm484VgaQRz8S-RaV_vv92LoHg@mail.gmail.com>
	<51E656B9.6090600@siemens.com> <51E65BDE.60402@msgid.tls.msk.ru>
Date: Wed, 17 Jul 2013 10:44:40 -0400
X-Google-Sender-Auth: R2H5lGC7MtEO8QRGq66mjjxrbCs
Message-ID: <CAPyFy2BQR6KK0dGT-R=H3GLtAQo2vcnY0Zcc2ac==qvZaVdBGQ@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::232
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: reorder include to
 fix FreeBSD build failure
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
X-List-Received-Date: Wed, 17 Jul 2013 14:44:57 -0000

On 17 July 2013 04:54, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 17.07.2013 12:32, Jan Kiszka wrote:
>> No problem, as Peter already said. Please provide an according patch.
>
> http://thread.gmane.org/gmane.comp.emulators.qemu/221949/focus=221975
>  (an attachtment there)
> http://git.corpit.ru/?p=qemu.git;a=commitdiff;h=2915c3b20260b1a653fced3b584d0c2b012880dc

I'm happy with Michael's patch.

