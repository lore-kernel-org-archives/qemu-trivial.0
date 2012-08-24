Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4rzF-00040O-Sy
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:23:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rzD-00040I-CN
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rz7-0004EW-FJ
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:23:35 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:41276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rz7-0004EQ-8S
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:23:29 -0400
Received: by wgbfm10 with SMTP id fm10so1021104wgb.10
	for <qemu-trivial@nongnu.org>; Fri, 24 Aug 2012 04:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=I5p2Q+KOeTr6yu90mgt4CVCT4rcuzAIqnfjcc3xrxfQ=;
	b=EbEHRKeevY8EC8M6ySN0D2gdh6LgDgrZKuj7Zw9O3Ot0ACvadqoMBVCBWeKRwuMdo6
	rXnG8oCY1rCH73yb2CA2fBHKeG6GcMjZtfGmM1cdX4xcmjndTBtJ8EeTbgU8UgSy/fga
	qbCVmW+nrc20HVMrKsSNFNEqBA48F+nO/9gnGZK7CWHjkMHzLbwo8VwybNVJ0SroNDnx
	TMYou37FBJZ4aBVfrxdbVX3j6YcaMrDB5kZpgEIT+giTokSl6k+CNAzCiLOXbA/S+zRL
	T0gR+bUwja+T/dWkxB2KhoOAZA9dAhYx/1YbtxzugzLGeTZN8QLSWyRO1mtRSl4jxPyV
	TsmQ==
Received: by 10.216.236.163 with SMTP id w35mr2624662weq.13.1345807408337;
	Fri, 24 Aug 2012 04:23:28 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	dv1sm5870209wib.10.2012.08.24.04.23.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 04:23:27 -0700 (PDT)
Date: Fri, 24 Aug 2012 12:23:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120824112325.GJ10867@stefanha-thinkpad.localdomain>
References: <1345664451-28890-1-git-send-email-sw@weilnetz.de>
	<503536DB.5060603@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <503536DB.5060603@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] w32: Always use standard instead of
 native format strings
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
X-List-Received-Date: Fri, 24 Aug 2012 11:23:36 -0000

On Wed, Aug 22, 2012 at 09:45:31PM +0200, Stefan Weil wrote:
> Am 22.08.2012 21:40, schrieb Stefan Weil:
> >GLib 2.0 include files use __printf__ for the format attribute
> >which resolves to native format strings on w32 hosts.
> >
> >QEMU wants standard format strings instead of native format
> >strings, so we simply change any declaration with __printf__
> >to use __gnu_printf__.
> >
> >This works because all basic printf functions support both
> >kinds of format strings.
> >
> >This fixes a compiler warning:
> >
> >qapi/string-output-visitor.c: In function ‘print_type_int’:
> >qapi/string-output-visitor.c:34:5: warning: unknown conversion
> >type character ‘l’ in format [-Wformat]
> >qapi/string-output-visitor.c:34:5: warning: too many arguments for
> >format [-Wformat-extra-args]
> >
> >Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >---
> >compiler.h | 5 +++++
> >1 file changed, 5 insertions(+)
> >
> >diff --git a/compiler.h b/compiler.h
> >index 07ba1f8..c734a71 100644
> >--- a/compiler.h
> >+++ b/compiler.h
> >@@ -44,6 +44,11 @@
> >/* Use gnu_printf when supported (qemu uses standard format strings). */
> ># define GCC_ATTR __attribute__((__unused__, format(gnu_printf, 1, 2)))
> ># define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> >+# if defined(_WIN32)
> >+ /* Map __printf__ to __gnu_printf__ because we want standard
> >format strings
> >+ * even when MinGW or GLib include files use __printf__. */
> >+# define __printf__ __gnu_printf__
> >+# endif
> ># endif
> >#if defined(_WIN32)
> >#define GCC_WEAK __attribute__((weak))
> 
> Sorry, I used the wrong mail address.
> The mail should go to qemu-devel, not to qemu-trivial.

Okay, not applying.

Stefan

