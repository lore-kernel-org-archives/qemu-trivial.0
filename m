Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUX2r-0004Lw-TV
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 04:58:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1YUX2o-0004Eg-FE
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 04:58:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1YUX2n-0000oN-E4
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 04:58:42 -0400
Received: from cantor2.suse.de ([195.135.220.15]:35291 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1YUX2h-0000mq-Fb; Sun, 08 Mar 2015 04:58:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BE290ABD0;
	Sun,  8 Mar 2015 08:58:34 +0000 (UTC)
Message-ID: <54FC0F33.3030008@suse.de>
Date: Sun, 08 Mar 2015 09:58:27 +0100
From: Alexander Graf <agraf@suse.de>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425766598-18297-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1425766598-18297-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: Fix warnings from Sparse
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
X-List-Received-Date: Sun, 08 Mar 2015 08:58:43 -0000



On 07.03.15 23:16, Stefan Weil wrote:
> Sparse report:
> 
> target-ppc/mmu-hash64.c:353:9: warning: returning void-valued expression
> target-ppc/mmu-hash64.c:620:9: warning: returning void-valued expression
> 
> Cc: Alexander Graf <agraf@suse.de>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

I think it makes a lot of sense to fix these.

Thanks, applied to ppc-next (unfortunately after my pull request, so
it'll only go in after rc0).


Alex

