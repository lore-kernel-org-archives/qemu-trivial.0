Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULEld-0007XS-Pa
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 11:29:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ULElW-0007Vu-Sv
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 11:29:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ULElU-00025c-M1
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 11:29:22 -0400
Received: from mail-wg0-f52.google.com ([74.125.82.52]:65375)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ULElU-00025Q-FZ; Thu, 28 Mar 2013 11:29:20 -0400
Received: by mail-wg0-f52.google.com with SMTP id n12so1647777wgh.19
	for <multiple recipients>; Thu, 28 Mar 2013 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GfkRwUrd6eEg+QjXQf2bkzFGTFsAvyM5waHyev6amVo=;
	b=vq2flW42IgnkIm2kQ47wR2UzfT/qy4DdZ4DPXfJVUyMdtawIxPQkBVUUUIILN7Y5AP
	I6aiY52F8VKp+dyqZzBK7lre6r/BrW5wPuEEH/GYMAm333zCIImyqw+/q8B7+QeyawEX
	q+2ISR7QFhbLJO73q/nSln/LyW2f+Gn+I4wgsMKCLdwOgZQY2707+aFycSLMtIGUFuJK
	ILNsdDz3z0VLl1OXCF3wqOQjYJOLKkxCKsjo2gQIKvM5KR4ANgW3YNxdVmXBB3oqWp21
	WT3Dry3fwgRPQy6dNnaFk+dVYjqA4DSXLy7L9MYMQPVZIrRSgillny1D1hpm7h/dxFpz
	vHbA==
X-Received: by 10.180.76.84 with SMTP id i20mr17340298wiw.9.1364484559664;
	Thu, 28 Mar 2013 08:29:19 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:60a5:f151:c14b:54e1])
	by mx.google.com with ESMTPS id s2sm16532816wib.4.2013.03.28.08.29.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 08:29:18 -0700 (PDT)
Date: Thu, 28 Mar 2013 16:29:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Message-ID: <20130328152916.GA31205@stefanha-thinkpad.redhat.com>
References: <1364483920.28637.3.camel@d941e-10>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1364483920.28637.3.camel@d941e-10>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.52
Cc: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] Fix some memory leaks in
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
X-List-Received-Date: Thu, 28 Mar 2013 15:29:28 -0000

On Thu, Mar 28, 2013 at 11:18:40AM -0400, Stefan Berger wrote:
> This patch fixes some of the memory leaks in test-visitor-serialization but not all of them.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> 
> ---
>  v2->v3: repost
> 
>  v1->v2: call qobject_decref(obj) earlier
> 
> ---
>  tests/test-visitor-serialization.c |   12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Thanks, applied to the trivial patches -next tree:
https://github.com/stefanha/qemu/commits/trivial-patches-next

Stefan

