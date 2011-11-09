Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RO59i-0001PX-W8
	for mharc-qemu-trivial@gnu.org; Wed, 09 Nov 2011 05:13:18 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RO59f-0001BL-CZ
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 05:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RO59e-0005D2-2E
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 05:13:14 -0500
Received: from mail-wy0-f173.google.com ([74.125.82.173]:47756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RO59b-0005Cb-As; Wed, 09 Nov 2011 05:13:11 -0500
Received: by wyh22 with SMTP id 22so1554719wyh.4
	for <multiple recipients>; Wed, 09 Nov 2011 02:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oAzP59KzqQ/zk7Rs3ZmdGXLGEBZfw9dFIb/xV4BBKjY=;
	b=q3niysd5LuoQiSVH62wME06+9AarJvIs76s/zkyroG5ZUrXUBe3PP4lKqSXBVgK7Zp
	8PG/aGgkJAIBfC7QWsxuPBE9Fn0NnnrUNsdK0p8Bk+u6gQbR7SVfGJ9VB3D9FCKgheLH
	wO3HecRclyz6xt8t0k8TB52e8p0249i4yV+zQ=
Received: by 10.227.204.132 with SMTP id fm4mr1191185wbb.26.1320833590116;
	Wed, 09 Nov 2011 02:13:10 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id fw16sm5076611wbb.13.2011.11.09.02.13.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 02:13:08 -0800 (PST)
Date: Wed, 9 Nov 2011 10:13:07 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111109101307.GB4659@stefanha-thinkpad.localdomain>
References: <1320763010-10024-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320763010-10024-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] x86/cpuid: A few trivial fixes
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
X-List-Received-Date: Wed, 09 Nov 2011 10:13:16 -0000

On Tue, Nov 08, 2011 at 03:36:47PM +0100, Markus Armbruster wrote:
> Markus Armbruster (3):
>   x86/cpuid: Convert remaining strdup() to g_strdup()
>   x86/cpuid: Plug memory leak in cpudef_setfield()
>   x86/cpuid: Fix crash on -cpu ""
> 
>  target-i386/cpuid.c |   13 +++++++------
>  1 files changed, 7 insertions(+), 6 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

