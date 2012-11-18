Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ta0el-0004Sz-Pc
	for mharc-qemu-trivial@gnu.org; Sun, 18 Nov 2012 03:55:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Ta0eh-0004OJ-9i
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 03:55:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Ta0ee-0006xC-6t
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 03:55:07 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:60504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Ta0ee-0006v7-0h; Sun, 18 Nov 2012 03:55:04 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so2439067eek.4
	for <multiple recipients>; Sun, 18 Nov 2012 00:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Le/pbGKD/xtQLpHK5Q8rT/srtYLzlr1hpkrkrgug1w4=;
	b=wLu3oPS6p9prvDGyxedueye06y9uOlroxaJBPSZ7ihYM33Y6M4D9uFD8uHsSrqpta3
	ACcz117QokRQHVlpVVGL+u+DThIIn6Wa/jAL6JGpc2Wy4AorbbNu+1t5BbxG4NHHF+dz
	7onUq1fGR/ZGsejxLUNG8vqLdG97MNsfMyWmedQoRviI03ae6BMJ1fkcqIi/HgLwpnMu
	I3qVepvlXRJxI+OIjm5FLyXKTl7vzyAPXi1XYggHpU+iMarEUM+zDY2nHtI9XOg4aMKy
	Cj4tpQ+ObAyKzuQpZvHomdSeMcH9w9ecmna7+nck6UgDtv+okT7+uSB3hU7hD8nUgyNI
	2nog==
Received: by 10.14.176.68 with SMTP id a44mr13681190eem.1.1353228902842;
	Sun, 18 Nov 2012 00:55:02 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id 42sm16070452eee.0.2012.11.18.00.55.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Nov 2012 00:55:02 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <50A8A264.4090705@redhat.com>
Date: Sun, 18 Nov 2012 09:55:00 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1353170443-18168-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1353170443-18168-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-common: Add definition for
	O_NONBLOCK
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
X-List-Received-Date: Sun, 18 Nov 2012 08:55:10 -0000

Il 17/11/2012 17:40, Stefan Weil ha scritto:
> backends/rng-random.c which was added by commit
> 5c74521d249486fa3e749dbbf6d56a70d4d7235f needs
> macro O_NONBLOCK.
> 
> The macro O_NONBLOCK is not defined for all hosts.
> Adding a default definition fixes builds for MinGW.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> This is a build fix. Therefore I'd appreciate if it could be
> committed soon.

This would make things blocking when they were supposed to be
nonblocking, so I'd prefer not including it.  I thought Anthony had a
fix too?

Paolo

