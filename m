Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULCwr-0006XE-JX
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 09:33:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ULCwo-0006QJ-53
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 09:32:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ULCwm-0002Ut-RZ
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 09:32:54 -0400
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233]:50730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ULCwm-0002T0-LL; Thu, 28 Mar 2013 09:32:52 -0400
Received: by mail-wi0-f179.google.com with SMTP id hn17so3231047wib.12
	for <multiple recipients>; Thu, 28 Mar 2013 06:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=J6Sf7uOxWdqJXqAYoFk+fw925rA2ksKc0n/atll2IJw=;
	b=ONd9vYbyrPEuzIRsT3Qu76iRYH5grQU2ujlknJLFK0/b6C3IDaBDb+lxOND0Q2sYHB
	OT+C9kOhY0GtEoG8jKLiqvOllHTbkIWREoJWCVPFjsuwx7a3Ms9XyINiPhhNwB9r0Xst
	E+IaitNbanmnNlJsusCW7ZkXH945O7zASPWyoW1LLCDJDOd5TN9pMHetFisTPAvkxR2b
	GlUarBo/yTRfBF23FW+WNgU5If0l2WzQbt7QlfMNGOio+Y4poKabgRTOCGHuNr4BnGI/
	TOuOd3O5msZpDrRnsn8ks8TjD6PSLF2P3EE+3AMMIjNpTO/t799dVixZ6VVOKx15q7nr
	NBIg==
X-Received: by 10.194.170.165 with SMTP id an5mr38364281wjc.41.1364477571814; 
	Thu, 28 Mar 2013 06:32:51 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:60a5:f151:c14b:54e1])
	by mx.google.com with ESMTPS id du2sm14340414wib.0.2013.03.28.06.32.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 06:32:51 -0700 (PDT)
Date: Thu, 28 Mar 2013 14:32:49 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Message-ID: <20130328133249.GF22865@stefanha-thinkpad.redhat.com>
References: <515427E4.70402@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <515427E4.70402@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::233
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] Fix some memory leaks in
	test-visitor-serialization
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
X-List-Received-Date: Thu, 28 Mar 2013 13:32:56 -0000

On Thu, Mar 28, 2013 at 07:22:12AM -0400, Stefan Berger wrote:
> This patch fixes some of the memory leaks in
> test-visitor-serialization but not all of them.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> 
> ---
>  v1->v2: call qobject_decref(obj) earlier
> 
> ---
>  tests/test-visitor-serialization.c |   12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> Index: qemu-git.pt/tests/test-visitor-serialization.c
> ===================================================================
> --- qemu-git.pt.orig/tests/test-visitor-serialization.c
> +++ qemu-git.pt/tests/test-visitor-serialization.c
> @@ -258,6 +258,7 @@ static void test_primitives(gconstpointe
>      g_assert(pt_copy != NULL);
>      if (pt->type == PTYPE_STRING) {
>          g_assert_cmpstr(pt->value.string, ==, pt_copy->value.string);
> +        g_free((char *)pt_copy->value.string);
>      } else if (pt->type == PTYPE_NUMBER) {
>          /* we serialize with %f for our reference visitors, so
> rather than fuzzy
>           * floating math to test "equality", just compare the
> formatted values

The patch is line-wrapped.  Please fix your mail client configuration,
git-am(1) refuses to apply automatically.

Thanks,
Stefan

