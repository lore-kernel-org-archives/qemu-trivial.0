Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rammo-0002NZ-BR
	for mharc-qemu-trivial@gnu.org; Wed, 14 Dec 2011 06:14:10 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rammh-0002N2-JV
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 06:14:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rammc-00089e-VV
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 06:14:03 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:33722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Rammc-00089a-Qv; Wed, 14 Dec 2011 06:13:58 -0500
Received: by faao26 with SMTP id o26so1073653faa.4
	for <multiple recipients>; Wed, 14 Dec 2011 03:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bTMu8RP3XyxhOo/8Fumgf2zBp4EWzamP842IY9hUJkI=;
	b=usxOfotstCtR4YMfbhYXV4ultu2DJxMj5nSF+y02cMZDzYYhmJd/9Q0GH8XirIu27h
	tr1Dcnxbsh/cN+kzrW+TqBX3TCHFQko47QjzUgBlbxA7auytyIBBL6EMBaE805a/vn5i
	RfRXLtDZQxIKhBg21VDnsMM6k9qZFQ2lRWAS0=
Received: by 10.180.4.37 with SMTP id h5mr3675512wih.45.1323861237901;
	Wed, 14 Dec 2011 03:13:57 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id gg1sm3213093wbb.17.2011.12.14.03.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Dec 2011 03:13:57 -0800 (PST)
Date: Wed, 14 Dec 2011 11:13:56 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Isaku Yamahata <yamahata@valinux.co.jp>
Message-ID: <20111214111356.GC10403@stefanha-thinkpad.localdomain>
References: <7649482739064866ddfb50275b1fcfa43547b782.1323747574.git.yamahata@valinux.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7649482739064866ddfb50275b1fcfa43547b782.1323747574.git.yamahata@valinux.co.jp>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration.h: remove
 incoming_expected declarations
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
X-List-Received-Date: Wed, 14 Dec 2011 11:14:09 -0000

On Tue, Dec 13, 2011 at 12:40:51PM +0900, Isaku Yamahata wrote:
> The variable is deleted by 1bcef683bf840a928d633755031ac572d5fdb851
> So remove its declaration.
> 
> Cc: Luiz Capitulino <lcapitulino@redhat.com>
> Signed-off-by: Isaku Yamahata <yamahata@valinux.co.jp>
> ---
>  migration.h |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

