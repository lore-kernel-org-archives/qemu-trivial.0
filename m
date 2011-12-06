Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXrvC-00066i-Fm
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2011 05:06:46 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXrvA-00066C-3D
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:06:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXrv2-00037L-Ch
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:06:44 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:39253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXrv2-000376-6b
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:06:36 -0500
Received: by faao26 with SMTP id o26so1107220faa.4
	for <qemu-trivial@nongnu.org>; Tue, 06 Dec 2011 02:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Pobk19vDB4JvUsPUofCjWgXMT03iLC417juGLO4xZKM=;
	b=ZNByrkbKBsKGCK8zbJ8jVQrk45tPAduaDEp/EBKjkS2/4kYcx1TrJKfJ/Sad7y5Wif
	im52Ir0DCgmRVQ0OOHfBwZBemixLLzNdZCkTu4wyNB2idf6TzImc/lk4zQkr9eKR0TiV
	em3PDNLbQ9/hipB0i4wGujWcK1rTe65Hg2xzU=
Received: by 10.227.208.199 with SMTP id gd7mr1366421wbb.2.1323165995233;
	Tue, 06 Dec 2011 02:06:35 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	z35sm32814335wbm.12.2011.12.06.02.06.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:06:34 -0800 (PST)
Date: Tue, 6 Dec 2011 10:06:33 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Craig Heffner <cheffner@tacnetsol.com>
Message-ID: <20111206100633.GA1710@stefanha-thinkpad.localdomain>
References: <EE7FAED6-555F-4A0C-9131-15353A5650C6@tacnetsol.com>
	<CACfWBL1iP0ysszeZsiiqSZnYxqpcvLszTw_ZGGy4769+T7DQ3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACfWBL1iP0ysszeZsiiqSZnYxqpcvLszTw_ZGGy4769+T7DQ3A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, riku.voipio@iki.fi
Subject: Re: [Qemu-trivial] User mode support for Linux ELF files with no
 section headers
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
X-List-Received-Date: Tue, 06 Dec 2011 10:06:45 -0000

On Mon, Dec 05, 2011 at 06:47:41PM -0500, Craig Heffner wrote:
> CC'd Linux user maintainer.

Seems reasonable to me but I'll let it go through the linux-user tree.

Stefan

