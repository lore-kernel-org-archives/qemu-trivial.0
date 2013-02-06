Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U36MS-0002jK-VO
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2013 09:52:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U36MQ-0002bv-GL
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 09:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U36MP-0004mv-65
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 09:52:30 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:51962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U36ME-0004YC-2A; Wed, 06 Feb 2013 09:52:18 -0500
Received: by mail-wi0-f173.google.com with SMTP id hq4so5636083wib.0
	for <multiple recipients>; Wed, 06 Feb 2013 06:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rRwMgtDv2uMnLLYppdlDC2crGVB8LCKn4MSUY4BY9u0=;
	b=HSHdwuuxfzL0+9SpvaH5IVl763RC82V2pRUbW3qAq1drd1Fk6K26b0DxtpKzxMzKzF
	4UCJuJSqtoOpdwOtncQSZibHFv4yEc5oFW6PFgrogeWqbvlmkeqNaro0jgcqXEF+YRSl
	vZPvWCPpxMfnO8AEyVlHjn7bJC8NE2FBqbGwHICnYa44/PDAO4LnMzSlQHaDWun05xVE
	c53YUn/WowMPna5XyQUjYu5VO0+1mzUxgXp4+BYWgvpJ6AmVagiVM2jwaJWnbdR2Y+bD
	F+IAdQ54qimib6H/+r9PnEtgUATKjlLDchvcoxJ00gOIHH5Lml11IEzi9xvXn/hGUKnV
	joEg==
X-Received: by 10.180.24.9 with SMTP id q9mr5537088wif.14.1360162337113;
	Wed, 06 Feb 2013 06:52:17 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id s8sm3412300wif.9.2013.02.06.06.52.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 06:52:16 -0800 (PST)
Date: Wed, 6 Feb 2013 15:52:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130206145214.GB22233@stefanha-thinkpad.redhat.com>
References: <1360066363-19595-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1360066363-19595-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] target-m68k: Fix comment
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
X-List-Received-Date: Wed, 06 Feb 2013 14:52:31 -0000

On Tue, Feb 05, 2013 at 01:12:43PM +0100, Stefan Weil wrote:
> * spelling fix ito -> into
> * reorder to match load/store
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-m68k/translate.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

