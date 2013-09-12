Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VK2dS-0007Tu-N8
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 04:52:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VK2dL-0007Jc-QR
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 04:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VK2dG-0004z5-8e
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 04:52:15 -0400
Received: from mail-ee0-x22a.google.com ([2a00:1450:4013:c00::22a]:42539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1VK2d4-0004x9-Mt; Thu, 12 Sep 2013 04:51:58 -0400
Received: by mail-ee0-f42.google.com with SMTP id b45so5178393eek.29
	for <multiple recipients>; Thu, 12 Sep 2013 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q0i/9Tf00Ryaeql3NmZTpri78h+KTOo+6bUMmncNTk8=;
	b=C6PV/q87AexE0YY/5iMD55qVHbWWABwWb8i1pBYFjvB79hDeLh8qtB1cmBKMMeHnbA
	8fn29YARqIMRYq3BxuOf+/wvtBJk+Tu8pqayKwhFVtRBMLgqnZMokT7RXOmtU/gHMysv
	XPQhLM7Mb8Q+Mi7vsPKR5hJXWFCPge+tDrEd7rwq+9I8DIo70m2OhC8RoWN/CdBv/ANO
	92EGJ3IkOg02W2M4R0zw/F+0VrtkyxiDQeed61VRBlBehq20J2AKVSVIBIWoT4Xco5er
	M6rKghzuOHTL8OBY/qYNnodC1etwb7Ixeocb9DX46r0vL0yQNNfkhCMW9eRpG/22QcUR
	Ctxw==
X-Received: by 10.14.223.134 with SMTP id v6mr889eep.88.1378975917499;
	Thu, 12 Sep 2013 01:51:57 -0700 (PDT)
Received: from localhost (188-193-160-156-dynip.superkabel.de.
	[188.193.160.156])
	by mx.google.com with ESMTPSA id r48sm3892187eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 01:51:57 -0700 (PDT)
Date: Thu, 12 Sep 2013 10:51:55 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20130912085155.GH1965@stefanha-thinkpad.redhat.com>
References: <5230F7D1.9090009@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5230F7D1.9090009@twiddle.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22a
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] Ping
	http://patchwork.ozlabs.org/patch/251410/
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
X-List-Received-Date: Thu, 12 Sep 2013 08:52:21 -0000

On Wed, Sep 11, 2013 at 04:08:01PM -0700, Richard Henderson wrote:
> There have been two patches posted for this uninitialized warning, outstanding
> since June 14.  I still encounter this daily...

I'm still happy with the patch.

Michael: Do you want to take this through the trivial patches tree?

Stefan

