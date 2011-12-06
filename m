Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXsWG-0006pH-I8
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2011 05:45:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsWA-0006Sp-2V
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:45:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsW6-0002MV-2X
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:44:58 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:34759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RXsVq-0002Hf-C8; Tue, 06 Dec 2011 05:44:38 -0500
Received: by mail-bw0-f45.google.com with SMTP id q10so5975115bka.4
	for <multiple recipients>; Tue, 06 Dec 2011 02:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O7Sc3nZNL40hViuX9RqEgsq7Zwx1zAnx8N82WDkg6zU=;
	b=sQvVHN9QGcV5RKJVQEc/xWvLSEH5XnYDbbITnpAlOuzLJtZ+VUZyVzIag1SfjCypmq
	YlA6yMUOxnFcO3S26NsDoF42IeLFxsBkJH1GUxKPJhZsZYocDYe+YE1t3lWxLRAUvvYk
	ULY0ushstmwoLvKcKbzTk+mDMEydBxp1B0Zuw=
Received: by 10.216.21.83 with SMTP id q61mr2526461weq.106.1323168277720;
	Tue, 06 Dec 2011 02:44:37 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id m5sm14069253wie.2.2011.12.06.02.44.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:44:36 -0800 (PST)
Date: Tue, 6 Dec 2011 10:44:35 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20111206104435.GC10165@stefanha-thinkpad.localdomain>
References: <4EDCD2CE.9080703@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4EDCD2CE.9080703@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Rename get_tls to tls_var
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
X-List-Received-Date: Tue, 06 Dec 2011 10:45:02 -0000

On Mon, Dec 05, 2011 at 03:18:54PM +0100, Jan Kiszka wrote:
> get_tls() can serve as a lvalue as well, so 'get' might be confusing.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  cpu-all.h  |    2 +-
>  qemu-tls.h |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

