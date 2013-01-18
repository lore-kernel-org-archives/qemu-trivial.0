Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwCD5-0003st-Cm
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 08:42:19 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCD1-0003sm-P9
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCCv-0004XG-Fg
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:42:15 -0500
Received: from mail-bk0-f50.google.com ([209.85.214.50]:34091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCCv-0004XB-7A
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:42:09 -0500
Received: by mail-bk0-f50.google.com with SMTP id jf3so1975088bkc.23
	for <qemu-trivial@nongnu.org>; Fri, 18 Jan 2013 05:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=HmexzicEmkIj5ns5GKMLHckz3nyPHhjSsWCKjEpp9jU=;
	b=WWJxXUXpX7ZZAihyKsUSy8QQve+gv/eNMAFcNq1SqJW4lknTg/+sSDtlNvJAH0kcjD
	HvumpDs80GZcsZBu4S0MFHFO2hgVoloqhjzf5O404E8Ez0liX2PaYZ4LxvzUKVI7+Jlc
	gSPzRG+j3wkriRmAJjlMrjd3Z0wio6jliw9tCIsUOx0EZMTyRlqJg4aah5kmEZ/GfQgg
	py4YovIBlVaFu2QzgHZM8h9IUpZwYteB6TNXq0yGd7ePLAnZfSgioTMPz5HNAQUCuCXT
	ZJkKa82cWt/pWbA4OpfSUuAXoPsdL8ukpMOZv4z+ickxP9F+TNemrQX9EPlotIrHlr3+
	iNuw==
X-Received: by 10.204.147.132 with SMTP id l4mr2612188bkv.20.1358516528012;
	Fri, 18 Jan 2013 05:42:08 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id 18sm3872607bkv.0.2013.01.18.05.42.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 05:42:07 -0800 (PST)
Date: Fri, 18 Jan 2013 14:42:05 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Stillwell <dragonfax@gmail.com>
Message-ID: <20130118134205.GA24367@stefanha-thinkpad.redhat.com>
References: <CAG0b9_jOiRwSik_Np5ym=_LOiAPhuMtZOJ6kCMv+WrftnX1LAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG0b9_jOiRwSik_Np5ym=_LOiAPhuMtZOJ6kCMv+WrftnX1LAQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.50
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] trival patch to master to fix osx build
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
X-List-Received-Date: Fri, 18 Jan 2013 13:42:18 -0000

On Tue, Jan 15, 2013 at 11:52:35PM -0800, Jason Stillwell wrote:
> symbol isnt' defined when __APPLE__
> this moves the symbol to the right place so it doesn't break the build.

Please follow http://wiki.qemu.org/Contribute/SubmitAPatch and resubmit
your patch inline (no attachments) and with Signed-off-by:.

Thanks,
Stefan

