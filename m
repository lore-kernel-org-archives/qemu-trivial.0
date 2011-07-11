Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QgGaU-0003jy-L4
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jul 2011 09:31:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QgGaS-0003jN-M3
	for qemu-trivial@nongnu.org; Mon, 11 Jul 2011 09:31:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QgGaR-0002rr-7x
	for qemu-trivial@nongnu.org; Mon, 11 Jul 2011 09:31:48 -0400
Received: from mail-yi0-f45.google.com ([209.85.218.45]:48426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QgGaM-0002nP-HO; Mon, 11 Jul 2011 09:31:42 -0400
Received: by yia25 with SMTP id 25so1818720yia.4
	for <multiple recipients>; Mon, 11 Jul 2011 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hXMqx8cHle5qQJVSFOzA2YhSxtbzlnPhMvePAw9Rzgo=;
	b=YzbWKthp8TUxxYff31X7sTXEVE+ytgjd6Mz4WFHPJ/P094WU7LV9wCbTt4lBThr15v
	iQUriab3b8nQP0Phuk+B6mmkSRmHzfgnaJwB8vWNgaUyanO4K54Hk27lF3pfrjmODhux
	z7CjydNQTPeTMwgvRv+gFqaC9J91hljiVf21Y=
MIME-Version: 1.0
Received: by 10.236.176.42 with SMTP id a30mr5492313yhm.255.1310391100334;
	Mon, 11 Jul 2011 06:31:40 -0700 (PDT)
Received: by 10.147.98.12 with HTTP; Mon, 11 Jul 2011 06:31:40 -0700 (PDT)
In-Reply-To: <1310389063-16382-1-git-send-email-wolfgang.mauerer@siemens.com>
References: <1310389063-16382-1-git-send-email-wolfgang.mauerer@siemens.com>
Date: Mon, 11 Jul 2011 14:31:40 +0100
Message-ID: <CAJSP0QXPJWRBLPikS1rvPRWpm3CspjwVTToJMoYNf08qZ2QS-Q@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.218.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vhost build fix for i386
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
X-List-Received-Date: Mon, 11 Jul 2011 13:31:50 -0000

On Mon, Jul 11, 2011 at 1:57 PM, Wolfgang Mauerer
<wolfgang.mauerer@siemens.com> wrote:
> vhost.c uses __sync_fetch_and_and(), which is only
> available for -march=i486 and above (see
> https://bugzilla.redhat.com/show_bug.cgi?id=624279).

Seems reasonable.  I am happy to add it to the trivial-patches tree
but will wait another day to let others who are better gcc wizards
consider it.

Stefan

