Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TU01Y-00045v-IA
	for mharc-qemu-trivial@gnu.org; Thu, 01 Nov 2012 15:01:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TTzrB-00031b-Id
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 14:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TTzrA-00039M-FT
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 14:51:09 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:37599)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TTzr7-000393-TW; Thu, 01 Nov 2012 14:51:06 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so1055954bkc.4
	for <multiple recipients>; Thu, 01 Nov 2012 11:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8N+tqCm4pe46AztJWXNkrVfK4/Er7sbhdnQgLgW0Yjk=;
	b=Mdf7v/x1hC+daIT+pfT5x1fBl65vO+apPdK3hpK0WxbOrlSbJj6SW3KqpQ1z7amKgA
	4rre06npLjndsV+WjpyeGxoIs/Eoz004bzza6Th13CQnebVKsrktmYaaBvdz8TjU5nC6
	bPM89MfQgjH2U7FM9Yv2Wfu0dWU4s2o597MnS3WNb2nME3w7fXDpRrCnWmcP/yy8ZH9N
	zqlRvYssmjtRcFC3S+mRLIuP+04M7Y3EeQ05j+bq5bpWGTbbGXolcRDiSPZKGjc2j9Lw
	JgncKNv0ujnPVny9hzhC1jQSqrx4/pSk5uzK21PsIRxobXrlNDu9mz6+wkRtrDpRg4Hj
	Ws9g==
Received: by 10.205.121.7 with SMTP id ga7mr12322317bkc.30.1351795864854;
	Thu, 01 Nov 2012 11:51:04 -0700 (PDT)
Received: from localhost (188-194-253-244-dynip.superkabel.de.
	[188.194.253.244])
	by mx.google.com with ESMTPS id gy18sm5621745bkc.4.2012.11.01.11.51.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:51:04 -0700 (PDT)
Date: Thu, 1 Nov 2012 19:51:03 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20121101185103.GB910@stefanha-thinkpad.redhat.com>
References: <5092A364.4040807@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5092A364.4040807@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pc: Drop redundant test for
 ROM memory region
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
X-List-Received-Date: Thu, 01 Nov 2012 19:01:51 -0000

On Thu, Nov 01, 2012 at 05:29:24PM +0100, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Just a few lines above, we already initialize rom_memory accordingly.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hw/pc_piix.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

