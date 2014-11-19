Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xr5v7-0008Di-HN
	for mharc-qemu-trivial@gnu.org; Wed, 19 Nov 2014 09:07:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xr5uz-000893-2z
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 09:07:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xr5us-0007qc-OQ
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 09:07:37 -0500
Received: from mail-la0-f46.google.com ([209.85.215.46]:46166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xr5us-0007qN-HW
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 09:07:30 -0500
Received: by mail-la0-f46.google.com with SMTP id gd6so558862lab.33
	for <qemu-trivial@nongnu.org>; Wed, 19 Nov 2014 06:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dovn3+VIFRb6mnRhjaHWYOuCCJ3icGGxwyKaVwrF2eA=;
	b=UCY3XJkNznKrSG1ifyXVFPp5Gf2q7rZCxfFaV2UuYyYY438omlW9V2GQyCKWmLcivi
	GLuPumFIemx0FJq7wl1GaiZe+J+dl5R0hIqTd25MfuJsiYzjnZMDmC9h97H+QXQwh1PQ
	uHJtc6Tl6ukjqj69B7cT7R8s3BwGEs5hZ2IR4XO1xhoQKAK6apBKXNOPgS7/EQKBQNLW
	aokCyrVJkHquwcaXxzsqNjYWOZOQXv/utxz4+tRWJJG+nk8kJcpOWxgDrQOSCCglTQYe
	Z50u+vEVarBMSmUkU5kkU9X9fF9aX8LMb7ZF+7G4a9jcleFA0Z/6z5XhLcgXow4FNPlR
	izuw==
X-Gm-Message-State: ALoCoQltpBCbZzxXGUs7rdqhLj19rKjV4t9mtMLz+43/KxbF3F33ojJ/Mmkchc9S9pyNQ3J4MSHn
X-Received: by 10.112.138.137 with SMTP id qq9mr2745760lbb.80.1416406049616;
	Wed, 19 Nov 2014 06:07:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.150.135 with HTTP; Wed, 19 Nov 2014 06:07:09 -0800 (PST)
In-Reply-To: <546C98E1.3070905@redhat.com>
References: <1416380832-9697-1-git-send-email-famz@redhat.com>
	<546C98E1.3070905@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Nov 2014 14:07:09 +0000
Message-ID: <CAFEAcA8xLZuS9YAVpoxV1jnMZqnoxUZNOC6rQno3XO1N-kc+pA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.46
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <famz@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tests: Use "command -v"
 instead of which(1) in shell scripts
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
X-List-Received-Date: Wed, 19 Nov 2014 14:07:43 -0000

On 19 November 2014 13:19, Eric Blake <eblake@redhat.com> wrote:
> Use of -a and -o in [[]] is a bit better, but I still HIGHLY recommend
> that constructs like this be rewritten as [ -n "$p" ] && [ -x "$p" ] for
> avoidance of confusion and prevention of copy-pasting the test to
> non-bash shells.  But that would be a separate patch.

Yeah, this is one of those issues I tend to pick up in
patches which change our shell scripts, but we still have
a fair amount of existing code that isn't up to that standard.

-- PMM

