Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R4B0P-0006N3-TU
	for mharc-qemu-trivial@gnu.org; Thu, 15 Sep 2011 08:25:25 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R4B0J-0005z9-G2
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2011 08:25:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R4B0I-0007W7-He
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2011 08:25:19 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:42356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R4B0B-0007O2-I7; Thu, 15 Sep 2011 08:25:11 -0400
Received: by mail-fx0-f45.google.com with SMTP id 13so648084fxh.4
	for <multiple recipients>; Thu, 15 Sep 2011 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NeNx+Jk6TQrNO2dTfNAZIz0pz4Y7pIslj6QwxEVtKhw=;
	b=W1lm5Jw3e6sCddH/GMHlcdugjkcdYvfb3QHQDQ4t4Kw5uYoBoip/mMLDUATVVkG2Zk
	tITQujnXqxHPdAfFM6IPt/2zfNxUQc0oivR5bCjg4E/wXE2e6FMeK2IVsCz72xsXpdv6
	TErfRUFj3Ej6ew4veVHlI4iJvwxIC3vn4vi4U=
Received: by 10.223.37.18 with SMTP id v18mr414839fad.98.1316089510993;
	Thu, 15 Sep 2011 05:25:10 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id b10sm6919124fam.1.2011.09.15.05.25.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 05:25:10 -0700 (PDT)
Date: Thu, 15 Sep 2011 13:25:07 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20110915122507.GC18553@stefanha-thinkpad.localdomain>
References: <1316085356-632-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1316085356-632-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Make missing pkg-config an
 error rather than a warning
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
X-List-Received-Date: Thu, 15 Sep 2011 12:25:24 -0000

On Thu, Sep 15, 2011 at 12:15:56PM +0100, Peter Maydell wrote:
> If pkg-config doesn't exist then make configure fail immediately
> with a useful error message. Now that glib is a required dependency,
> proceeding despite the missing pkg-config will just cause us to
> fail later with a misleading message about glib not being present.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

