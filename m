Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SeNjv-0001YH-86
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2012 05:50:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SeNjo-0001VS-1I
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 05:50:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SeNjh-0006A8-QX
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 05:50:11 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:49439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SeNjh-00062n-H0; Tue, 12 Jun 2012 05:50:05 -0400
Received: by bkwj10 with SMTP id j10so4712591bkw.4
	for <multiple recipients>; Tue, 12 Jun 2012 02:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nl2xivf7Ri//hnu5oI/IGGkrxH6V6WOI1YpmEqFz/NA=;
	b=NkaowvM3Y5olO9nv45fENnr3/OkQ0iFy/XsfvHCjNjq4ZDA3x/zRPC8JUYK/GPCdB8
	7UWlEP8rXgilqGLgWb7f1OQHvS5EarBCJVFnGk9XBdzCPpuLq5vdUO5A7vEVy4jGnsLV
	UD5IIToGXub/O0CJ+Qiv0wBPPlKTGEUkl8DOpJBXQgTpWuSUKgnagV+6KyZWu9SF0lMq
	KXzAxOiosK81LgjqlZt1vl4etWUskrK8v1qpx/1z2J9Kg7dt3MaZY3br8rAdxNwdZCNS
	v+xYG5d0ra8ttCZXOoHUr9ujekUYzr5XqAIZXr9nA6rPNMWRA4SyO7bK/b4wYKlrXQ6s
	u1ug==
Received: by 10.205.134.6 with SMTP id ia6mr11834473bkc.51.1339494602228;
	Tue, 12 Jun 2012 02:50:02 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	gm18sm19527959bkc.7.2012.06.12.02.50.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jun 2012 02:50:01 -0700 (PDT)
Date: Tue, 12 Jun 2012 10:49:57 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20120612094957.GC29104@stefanha-thinkpad.localdomain>
References: <1339225719-5434-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339225719-5434-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Makefile: Remove
	BUILD_DIR from qapi-dir
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
X-List-Received-Date: Tue, 12 Jun 2012 09:50:18 -0000

On Sat, Jun 09, 2012 at 09:08:38AM +0200, Stefan Weil wrote:
> qapi-dir does not need an absolute path. All other build directories
> are relative. When BUILD_DIR is removed, the build output looks better
> (no long lines with absolute paths when everything else uses short
> lines):
> 
>   GEN   qapi-generated/qga-qapi-types.c
>   CC    qapi-generated/qga-qapi-types.o
>   GEN   qapi-generated/qga-qapi-visit.c
>   CC    qapi-generated/qga-qapi-visit.o
>   GEN   qapi-generated/qga-qmp-marshal.c
>   CC    qapi-generated/qga-qmp-marshal.o
> 
> Using a relative path also avoids potential problems when BUILD_DIR
> includes blanks.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I merged this but have CCed Michael Roth to take a look.  qemu.git
contains an earlier commit to explicitly add $(BUILD_DIR):

commit 9b129408589b2ed7bb2cdea03d2aba46a5fd74d4
Author: Michael Roth <mdroth@linux.vnet.ibm.com>
Date:   Tue Nov 29 16:47:49 2011 -0600

    Makefile: use full path for qapi-generated directory
    
    Generally $(BUILD_DIR) == $(CURDIR), but that isn't necessarilly the
    case, so use $(BUILD_DIR)/qapi-generated for generated files to
    avoid potentionally sticking generating files in odd places outside
    the build's include paths.
    
    Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>

Does this rationale still apply?  Is it really a good ideal to remove
$(BUILD_DIR)?

Stefan

