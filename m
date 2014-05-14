Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkYaA-0000lW-Ch
	for mharc-qemu-trivial@gnu.org; Wed, 14 May 2014 08:46:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WkYa3-0000cJ-Qb
	for qemu-trivial@nongnu.org; Wed, 14 May 2014 08:46:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WkYZx-00023Q-Rz
	for qemu-trivial@nongnu.org; Wed, 14 May 2014 08:46:43 -0400
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229]:60651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WkYZl-0001uW-Mx; Wed, 14 May 2014 08:46:25 -0400
Received: by mail-wi0-f169.google.com with SMTP id hi2so8651159wib.4
	for <multiple recipients>; Wed, 14 May 2014 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nLt2svlHA4cT52uCkApGH4TXuidmo6BJGA1suoaH7yI=;
	b=mzmSoukA1KUA2mGoaLFlN5iCmKD3NWhFMBlSOgmKO8aT6SCYd7W0ZxS89ZC2cozElS
	MTbGYddgblSKjAf8DnisGY9soIgJjMkp9epFdLP+U43LM97p6Pz906M0a5GPuJG+UYjJ
	82imfHcCmDMkZTUauCfRc6qPI1zjfDB9vwJa22Y4iebBIqDOLR9/Onm7T4+djE60cCkX
	f8GPpmCckHwU9uVL03DnX60HhogNsnxzrkWqhXjA7/gLp1t/EQGTb0IBg3hsEnyCSDQN
	p+8SKxEgBncuOpV0Aoq9LH1Y9PtIV0TU97iDWGbW1P/6lJuo6hKfu5N6WzGnn4sQwktm
	sgZw==
X-Received: by 10.194.220.42 with SMTP id pt10mr2132186wjc.60.1400071584741;
	Wed, 14 May 2014 05:46:24 -0700 (PDT)
Received: from localhost (95-90-192-172-dynip.superkabel.de. [95.90.192.172])
	by mx.google.com with ESMTPSA id
	h3sm27596888wiz.16.2014.05.14.05.46.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 05:46:23 -0700 (PDT)
Date: Wed, 14 May 2014 14:46:22 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140514124622.GE16683@stefanha-thinkpad.redhat.com>
References: <1399937716-6086-1-git-send-email-kroosec@gmail.com>
	<1399937716-6086-2-git-send-email-kroosec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1399937716-6086-2-git-send-email-kroosec@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::229
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, stefanha@redhat.com,
	qemu-devel@nongnu.org, kwolf@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] nbd: Miscellaneous typo
	fixes.
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
X-List-Received-Date: Wed, 14 May 2014 12:46:50 -0000

On Tue, May 13, 2014 at 12:35:16AM +0100, Hani Benhabiles wrote:
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  nbd.c         | 2 +-
>  qemu-nbd.c    | 2 +-
>  qemu-nbd.texi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

