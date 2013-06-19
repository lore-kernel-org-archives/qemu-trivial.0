Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpEEd-0002Qn-9T
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 04:59:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UpEEW-0002Io-UX
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UpEEW-0007OI-3v
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:59:16 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:39530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UpEEU-0007No-4W; Wed, 19 Jun 2013 04:59:14 -0400
Received: by mail-wi0-f173.google.com with SMTP id hq4so413972wib.12
	for <multiple recipients>; Wed, 19 Jun 2013 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1QsxheSRnFfIwE8BrKfqOXIi5rnWU7JSPaRND57zq3A=;
	b=FyGSb9tt/8R82rvgr+7Tw6DVNMlYHkXfsVFxz8N04+Hx2ndVyigMIRds+H1ecyL/an
	l8WUZD6tOEHxdw6H5B4Gng6x5JghWUk6TPrI5Sw9qQ8K/5SiNv+iyahOJfoGHJkZbHSR
	Gix+ZFWe3MgWWMulU42UsmG/p0FzoMaRjOSmlOsFIHD+jms3yyvkPLnGpUqHMeI6WdW7
	eb6vFtfI4o/VY9mTg1Uw0dzmfzfxpBOuS498WGO3vEUa+RXwKI7MDZImDzu/QoRubhgp
	AE36xeiLKpeYe/7CZJpRiAZC0PW/TQIN6mZJtnp91L9bxAtgVhjDYbwiag7MTB/xJHfo
	JXYw==
X-Received: by 10.194.82.193 with SMTP id k1mr1357986wjy.21.1371632353186;
	Wed, 19 Jun 2013 01:59:13 -0700 (PDT)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPSA id cw8sm7673362wib.7.2013.06.19.01.59.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 01:59:12 -0700 (PDT)
Date: Wed, 19 Jun 2013 10:59:09 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20130619085909.GB24023@stefanha-thinkpad.muc.redhat.com>
References: <1371587053-16439-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371587053-16439-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] Makefile.objs: do
 not link block/ twice
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
X-List-Received-Date: Wed, 19 Jun 2013 08:59:21 -0000

On Wed, Jun 19, 2013 at 12:24:13AM +0400, Michael Tokarev wrote:
> $(block-obj-y) already includes block/, so there's
> no need to add it explicitly to $(common-obj-y).
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  Makefile.objs |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

