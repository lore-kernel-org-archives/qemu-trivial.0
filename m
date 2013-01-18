Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwCE0-0004Yz-R7
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 08:43:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCDx-0004Ui-3s
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:43:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCDv-0004eZ-Tu
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:43:13 -0500
Received: from mail-bk0-f47.google.com ([209.85.214.47]:48494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TwCDv-0004eT-NO; Fri, 18 Jan 2013 08:43:11 -0500
Received: by mail-bk0-f47.google.com with SMTP id j4so1984480bkw.6
	for <multiple recipients>; Fri, 18 Jan 2013 05:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ZVPXH0l9r7IfCp+KTnu3h91tRU0IUgklQxMxYeF9qFo=;
	b=AkfWMPxGh5aYt2kx1/KYexoDZAC60com70funW3/sGOOFEiNpsAbLknNp8kStAGGtq
	UZBZFF0GWEpKS3wzQUbBssDrqOuPIDHNPXv5S3TMXn4I8RQUFqy/MG/fOYIA+6Hf2qIL
	fZLurZ7NS31OIFp/VLollsJCINGgvWEt+CL5eLfm240VKY1GBTbwcHT7lxwEkpg47mbo
	aHvWSuVnr1jsgalHHi9tbWgPcVzXGiDf0kTqRDmCtuWFWCVBxynYrngqSIJGvIXpox95
	YGUWVT5TFZ0XIioT/F/Kx0rGvORonOob71WtI/YQVcZp+x2LqzxFy3jRAABOVPk5ImoY
	WK4A==
X-Received: by 10.204.6.20 with SMTP id 20mr2625651bkx.33.1358516590679;
	Fri, 18 Jan 2013 05:43:10 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id o9sm3886209bko.15.2013.01.18.05.43.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 05:43:09 -0800 (PST)
Date: Fri, 18 Jan 2013 14:43:07 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130118134307.GB24367@stefanha-thinkpad.redhat.com>
References: <1358358029-14684-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358358029-14684-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.47
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw: Spelling fix in log message
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
X-List-Received-Date: Fri, 18 Jan 2013 13:43:15 -0000

On Wed, Jan 16, 2013 at 06:40:29PM +0100, Stefan Weil wrote:
> defineition -> definition
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/openrisc_sim.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

