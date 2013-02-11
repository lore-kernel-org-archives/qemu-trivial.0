Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4t8B-0006cl-LA
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 08:09:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U4t88-0006TF-70
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 08:09:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U4t87-0001iC-0L
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 08:09:08 -0500
Received: from mail-wg0-f44.google.com ([74.125.82.44]:34625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U4t7y-0001h5-W5; Mon, 11 Feb 2013 08:08:59 -0500
Received: by mail-wg0-f44.google.com with SMTP id dr12so4672991wgb.35
	for <multiple recipients>; Mon, 11 Feb 2013 05:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=hoC0iv2AdD/sCbmnclCMEdsP/tedMMPjLnGrZzwiQQw=;
	b=u0cNdxftvri+57l7Ruhjq/82eiqQNqensyII3sz81hxMEh2tGqRefxnHVKO4HX3CnK
	TLQPkakGXyF1gve2vgCwxVWYt9D92EdvzQSwq4J+4LvUWsQz82qPB98arAvLO88AMGQT
	jlWLk6wVoj2Cg6u6IIE3r14QjTTQXSfg/baJXHAeIEd6QKhD+VCnhEuNgyEeI9dQmiYo
	5CThS0HGdEIfpaRmXY/K86jFzQuuQ9bHebYaWhC/tE5GSjcrMiDiv4rDzeLb3SnpmpKI
	CIO6dROB8tPe1IJqI2t0eWBqCt1iu7nyRI3CnPgaLcQaMiZ9TmUDLzWBJyDDxv6CeNSP
	C6Pw==
X-Received: by 10.194.172.197 with SMTP id be5mr23763203wjc.20.1360588128564; 
	Mon, 11 Feb 2013 05:08:48 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id gy2sm33088911wib.3.2013.02.11.05.08.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 05:08:47 -0800 (PST)
Date: Mon, 11 Feb 2013 14:08:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Message-ID: <20130211130845.GB6491@stefanha-thinkpad.redhat.com>
References: <1360534265-6477-1-git-send-email-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1360534265-6477-1-git-send-email-hpoussin@reactos.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.44
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove forward declaration
 of non-existant variable
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
X-List-Received-Date: Mon, 11 Feb 2013 13:09:10 -0000

On Sun, Feb 10, 2013 at 11:11:05PM +0100, Hervé Poussineau wrote:
> This variable has been removed 5 years ago in 970ac5a3082428dca91171f270dcd95d6f4b2636.
> 
> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
> ---
>  include/sysemu/sysemu.h |    1 -
>  1 file changed, 1 deletion(-)

Thanks, applied to the trivial patches -next tree:
https://github.com/stefanha/qemu/commits/trivial-patches-next

Stefan

