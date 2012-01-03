Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri1kU-000170-MO
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 05:37:42 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1kN-0000f3-1R
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:37:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1kL-0002Bi-Su
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:37:35 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:52322)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ri1kE-00029R-Px; Tue, 03 Jan 2012 05:37:26 -0500
Received: by eekb45 with SMTP id b45so18554788eek.4
	for <multiple recipients>; Tue, 03 Jan 2012 02:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cT5xrnvJKxv1NNL03xrHEtnP1Bf8Fg51u4Vve48bmlw=;
	b=ooxVdiV5GyUMKT/96ytgDqh/IfDUbtupr/duRer32lWrKyNq3ibJGPNlsKdmhsc+op
	TW4rVYvYZ5IUouAqyIkLX677ooZU2Cs5XXBmEvki4RtrlCJqLvBxa7ZfLPFt2I7E4efZ
	MkTDnqj9HFWS9hXiXcpQ3Q0nwnEEpUoyp7sFw=
Received: by 10.14.51.198 with SMTP id b46mr21133654eec.111.1325587045860;
	Tue, 03 Jan 2012 02:37:25 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	s16sm204063202eef.2.2012.01.03.02.37.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 02:37:24 -0800 (PST)
Date: Tue, 3 Jan 2012 10:37:23 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120103103723.GA23500@stefanha-thinkpad.localdomain>
References: <1324549570-15569-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1324549570-15569-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure:
 CONFIG_QEMU_INTERP_PREFIX only for user mode
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
X-List-Received-Date: Tue, 03 Jan 2012 10:37:40 -0000

On Thu, Dec 22, 2011 at 11:26:10AM +0100, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

In the future, please include an explanation in the commit message.  For
example, this change seems to be purely a clean up.

Thanks, applied to the trivial patches -next tree:
https://github.com/stefanha/qemu/commits/trivial-patches-next

Stefan

