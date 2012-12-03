Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfVVI-0001Za-3E
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2012 07:52:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVVG-0001ZU-9h
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 07:52:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVVF-0007md-0o
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 07:52:06 -0500
Received: from mail-ea0-f173.google.com ([209.85.215.173]:32940)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TfVVE-0007mZ-QM; Mon, 03 Dec 2012 07:52:04 -0500
Received: by mail-ea0-f173.google.com with SMTP id i13so1213910eaa.4
	for <multiple recipients>; Mon, 03 Dec 2012 04:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JqUv5ef69J1/dxHt2eOtIDY/z7nYZQOxNMQ2lLvkXJk=;
	b=laNGC2Lz8yVx8jMtAMM/XBYlBSuyDyOxVxxO/F9ccVPgG+7Y1babtMNDi4mJhWs4af
	RBgsPNpp0O28mZy0itKdLkI6HkvhEVcRo1NdoVJiZHuph9ruYd+Nmx4BdmP7PqwRj6gm
	T5pdy1Xx1YRzYtehdglBH/BBWyLsdceD5Z39h4/p4lt75OZyavoCfuofbaotoDDhPJZV
	018dVU/FiJe+eFOV0RhjLExYD9XoKneDr3a37nJwXjuPu7DtqSDsYhNXZV3KxebZzEYn
	9Ml4A5Y9sH1EoCqAPB6USDHfqXtxlg30w6wTsKG8Q7XAn5RksouM0IzyoWpTSFjMoMuP
	s2dw==
Received: by 10.14.205.198 with SMTP id j46mr36160093eeo.27.1354539122337;
	Mon, 03 Dec 2012 04:52:02 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id z8sm31092941eeo.11.2012.12.03.04.52.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 04:52:01 -0800 (PST)
Date: Mon, 3 Dec 2012 13:52:00 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121203125200.GA6048@stefanha-thinkpad.redhat.com>
References: <1353170443-18168-1-git-send-email-sw@weilnetz.de>
	<50A8A264.4090705@redhat.com> <50A8BB50.5040905@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50A8BB50.5040905@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 03 Dec 2012 12:52:07 -0000

On Sun, Nov 18, 2012 at 11:41:20AM +0100, Stefan Weil wrote:
> Am 18.11.2012 09:55, schrieb Paolo Bonzini:
> >Il 17/11/2012 17:40, Stefan Weil ha scritto:
> >>backends/rng-random.c which was added by commit
> >>5c74521d249486fa3e749dbbf6d56a70d4d7235f needs
> >>macro O_NONBLOCK.
> >>
> >>The macro O_NONBLOCK is not defined for all hosts.
> >>Adding a default definition fixes builds for MinGW.
> >>
> >>Signed-off-by: Stefan Weil<sw@weilnetz.de>
> >>---
> >>
> >>This is a build fix. Therefore I'd appreciate if it could be
> >>committed soon.
> >
> >This would make things blocking when they were supposed to be
> >nonblocking, so I'd prefer not including it.  I thought Anthony had a
> >fix too?
> >
> >Paolo
> 
> Yes, my patch is only a quick fix to enable builds with MinGW again.
> 
> Anthony's patch solves the same problem by omitting the code in
> comiplations for non-POSIX builds.
> 
> My primary goal was fixing the build, so any of these two patches
> is fine for me.
> 
> A backends/rng-random.c which compiles with MinGW would be even better,
> but maybe that needs a little more time. /dev/random is available with
> MinGW, so there is no basic problem doing this.

Anthony's rng POSIX build patch was merged, dropping this.

Stefan

