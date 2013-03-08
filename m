Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UDtOb-0004k9-Lf
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2013 04:15:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDtOT-0004hh-ET
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:15:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDtOO-0005Cy-Ck
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:15:13 -0500
Received: from mail-we0-x22d.google.com ([2a00:1450:400c:c03::22d]:44866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UDtOO-0005Cl-6N; Fri, 08 Mar 2013 04:15:08 -0500
Received: by mail-we0-f173.google.com with SMTP id x51so709695wey.18
	for <multiple recipients>; Fri, 08 Mar 2013 01:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mViFg+msfwFv1OzhznI8/JY23ORfIMjMNgxlo73m+zg=;
	b=NWs45TF79ynmYHho+pDmxuujqD8LImE7T82FPklsMv8ascZhACB4BrIUMM8VOxRMw4
	hfTw7jxvg16b33SqKV001zkha3+gn+Aihw1ZFZvHOCHhp4b8rbnlNkTIFU6RF/3SVyb4
	0AU+17CETBvCmO3hoiCF2ZiFKzUGkuRWTwEa7XP9Ba+MSYA6dHEIrXebTqE7a+RyI1p8
	ZREsC7t8/aC4xUXFsbw3/a/xpJTWlWO6x3l1quHEKpnsQPGhAvcJi0sAsjEu3ppsQXpz
	TZtbbX5HgmZCD9Otz+osm/WeGt1Ny0MAUoxLw1c6wXRQbhkYOGJfQ+O0jAECJsTD0Mn4
	ROng==
X-Received: by 10.180.72.148 with SMTP id d20mr38751183wiv.31.1362734107468;
	Fri, 08 Mar 2013 01:15:07 -0800 (PST)
Received: from localhost ([2a02:810d:ec0:195:852b:b477:8102:5356])
	by mx.google.com with ESMTPS id n10sm8159943wia.0.2013.03.08.01.15.05
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 01:15:06 -0800 (PST)
Date: Fri, 8 Mar 2013 10:15:04 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20130308091504.GA9597@stefanha-thinkpad.redhat.com>
References: <5127CF6D.2060104@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5127CF6D.2060104@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22d
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH][RESENT] configure: Create link to icon
 bitmap for out-of-tree builds
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
X-List-Received-Date: Fri, 08 Mar 2013 09:15:20 -0000

On Fri, Feb 22, 2013 at 09:05:01PM +0100, Jan Kiszka wrote:
> This allows to pick up the icon when starting QEMU directly from an
> out-of-tree build directory.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  configure |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

