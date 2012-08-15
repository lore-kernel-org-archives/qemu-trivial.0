Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1dyY-0002sP-5r
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:49:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dyV-0002pz-HL
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dyU-0006AG-Hr
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:49:31 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:61156)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1dyU-0006AB-B9; Wed, 15 Aug 2012 09:49:30 -0400
Received: by weyz53 with SMTP id z53so992084wey.4
	for <multiple recipients>; Wed, 15 Aug 2012 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=08X19LfNrpEHVn7iOvWa1GsSOnl8jCDyl6EzowNEoPY=;
	b=G3TR/jDFQj/yZRTTxf41POlAafhKpMwfvI2CAtBe8pKocPNtGm5z346UPRzVbF10Sg
	ghL7G9VmXrXbH4GSaT1P6NAaOrkFqunCOKB4+/88ZLkIGjj2puqSXlVVDFu71XXFlOuH
	jrk2jlxm28p4fvrjMTLGgTiQaMi3vULLvQIf3sHwn7liuGv9mVdlrKAkCRGVhbc2FT4d
	SAOboRKWZ00hxkj5aTcL8dUlGKH64xXhCQB+WyRMq0yKNSuEN+s4wBU58xjNgTZQ8zT+
	qsXMnED8qaTD8mSNCLPeqv4J0GdjrDi3n0Aep3E8A5KPO20zOLAb26LFhTi/KZ6QTA68
	n51g==
Received: by 10.180.107.163 with SMTP id hd3mr9358699wib.19.1345038569421;
	Wed, 15 Aug 2012 06:49:29 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id j6sm4732387wiy.4.2012.08.15.06.49.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:49:28 -0700 (PDT)
Date: Wed, 15 Aug 2012 14:49:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120815134925.GI10742@stefanha-thinkpad.localdomain>
References: <1344628606-26620-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344628606-26620-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fix in comment
 (peripherans -> peripherals)
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
X-List-Received-Date: Wed, 15 Aug 2012 13:49:32 -0000

On Fri, Aug 10, 2012 at 09:56:46PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/versatilepb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

