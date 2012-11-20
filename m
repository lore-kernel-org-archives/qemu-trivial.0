Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TannG-0005rj-KO
	for mharc-qemu-trivial@gnu.org; Tue, 20 Nov 2012 08:23:14 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tann9-0005pd-Va
	for qemu-trivial@nongnu.org; Tue, 20 Nov 2012 08:23:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tann4-0005lQ-3p
	for qemu-trivial@nongnu.org; Tue, 20 Nov 2012 08:23:07 -0500
Received: from mail-bk0-f45.google.com ([209.85.214.45]:63957)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tann3-0005lH-Sw; Tue, 20 Nov 2012 08:23:02 -0500
Received: by mail-bk0-f45.google.com with SMTP id jk13so1390223bkc.4
	for <multiple recipients>; Tue, 20 Nov 2012 05:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/cd0K+/pHiX3pISQPDhhW3PIDfD9Sl2npZsXT7B20Z0=;
	b=QwM/GPTpE1/DVe+Oww3lN/LyXYl0FGuFm5xcSoyoO2UgWq9UknkN4/9uxOsNREnLeL
	FZvX29TSN+K6XKuFd3tSWAJ6/XG+MoFmWd8w6hvlKQFltkF11FD2J3xSzLz7ZY5mKmP4
	N9lbhgfazH2mNtQvVbzjP8ekIkVJbce57KQDhlsZ8iAYwqNYijLo/300g/pnesILwjmx
	wpOwRsqU/KD1M3YH49r8BL6yvjIhp6Z+8LnxsmxBPK5P6RJ03mKcgiNVL+GOPSi+YpAQ
	5QMZAtt9J9muuQYvnQcNXFYSziEkhL1JbgV5hYS8J7xgeFMfh4pBHHEuW7w9s2criwew
	KNAA==
Received: by 10.204.11.70 with SMTP id s6mr6277824bks.63.1353417780989;
	Tue, 20 Nov 2012 05:23:00 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id v14sm6874866bkv.10.2012.11.20.05.22.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2012 05:23:00 -0800 (PST)
Date: Tue, 20 Nov 2012 14:22:58 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121120132258.GF27378@stefanha-thinkpad.redhat.com>
References: <1353227175-24596-1-git-send-email-sw@weilnetz.de>
	<20121119113111.GA21658@stefanha-thinkpad.redhat.com>
	<50AA6E88.5050303@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50AA6E88.5050303@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Jim Meyering <meyering@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block: Fix regression for MinGW
 (assertion caused by short string)
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
X-List-Received-Date: Tue, 20 Nov 2012 13:23:13 -0000

On Mon, Nov 19, 2012 at 06:38:16PM +0100, Stefan Weil wrote:
> If we want a better solution, we should also consider g_mkstemp
> and related functions like g_file_open_tmp. We could also modify
> bdrv_create to allow a NULL filename which is interpreted as a
> temporary filename. IMHO that would be a good solution for the
> future (= after 1.3). Feel free to add a TODO comment to the
> code in my patch.

For 1.3 please send directly through Anthony or other commiters.  I
don't want to be a middle-man for last-minute fixes, it will just slow
things down.

Stefan

