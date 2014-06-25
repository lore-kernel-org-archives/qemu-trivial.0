Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzkPP-0002Fl-QE
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 06:26:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WzkPH-00022s-G7
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 06:26:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WzkPA-0008Hi-Ks
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 06:26:23 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:47710)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WzkOw-0008FO-Sx; Wed, 25 Jun 2014 06:26:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 06B06113B36;
	Wed, 25 Jun 2014 12:26:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 16oZGR_pgXo8; Wed, 25 Jun 2014 12:26:01 +0200 (CEST)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id DA04F109624;
	Wed, 25 Jun 2014 12:26:01 +0200 (CEST)
Message-ID: <53AAA3BC.4010500@weilnetz.de>
Date: Wed, 25 Jun 2014 12:26:04 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1403679897-11480-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1403679897-11480-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.80
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for 2.1] qemu-char: initialize out_lock
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
X-List-Received-Date: Wed, 25 Jun 2014 10:26:30 -0000

Am 25.06.2014 09:04, schrieb Paolo Bonzini:
> Otherwise, Windows fails with a deadlock.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qemu-char.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/qemu-char.c b/qemu-char.c
> index 2e50a10..17bd360 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -94,6 +94,7 @@ static QTAILQ_HEAD(CharDriverStateHead, CharDriverState) chardevs =
>  CharDriverState *qemu_chr_alloc(void)
>  {
>      CharDriverState *chr = g_malloc0(sizeof(CharDriverState));
> +    qemu_mutex_init(&chr->chr_write_lock);
>      return chr;
>  }
>  


Thanks, this fixes the problem with QEMU for Windows.

Tested-by: Stefan Weil <sw@weilnetz.de>


