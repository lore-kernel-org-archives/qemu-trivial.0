Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT7cj-00087I-89
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 05:28:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7cf-00086f-W7
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7ce-0002KH-Q3
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:28:49 -0400
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234]:58223)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UT7ce-0002KA-Jp; Fri, 19 Apr 2013 05:28:48 -0400
Received: by mail-wi0-f180.google.com with SMTP id h11so503289wiv.1
	for <multiple recipients>; Fri, 19 Apr 2013 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=bTvzNkc1Xd24IT6YVDhw7kxLtfncIqnj6ExrrNdcjEs=;
	b=bFbDvin0y/HvSC1J0vsj8GCNdHKR37SAfQcRhjPtfMfj0seb1S+jcD1RoiVgUiYdl9
	tY+rDeiWsrHpPxdm/HKHyrWBGep3SVrq/d/zFa+c8Xw0KMw0/9cWnGuS8XNaGacs8K1n
	GXSBCVlR+h0Q66qAQqTrUKMbsLXBbtFBp+xaRDe891Jiq1daY/IJPmJYgF/R8rSnA5Fz
	QTeVgufhDpoz9vxIcYptFHimQKzhdGkgjmwyuPnQxDudmMf+3FDqhS339yq1J7GvJCxb
	Gn6bnBNRc2YnGkKGlCs6kaAdxQfyaDjNY8e3IttEDzoLemGmXr+qo7dn7Vu/7dJESvKX
	arTg==
X-Received: by 10.180.93.134 with SMTP id cu6mr23476963wib.8.1366363727639;
	Fri, 19 Apr 2013 02:28:47 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:f833:9039:bb71:5207])
	by mx.google.com with ESMTPS id g4sm2324304wib.11.2013.04.19.02.28.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:28:46 -0700 (PDT)
Date: Fri, 19 Apr 2013 11:28:44 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20130419092844.GA30143@stefanha-thinkpad.redhat.com>
References: <51686F17.7070503@weilnetz.de>
	<1365990476-14975-1-git-send-email-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365990476-14975-1-git-send-email-aik@ozlabs.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::234
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Blue Swirl <blauwirbel@gmail.com>,
	qemu-ppc@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH v2] bswap: fix compiler warning
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
X-List-Received-Date: Fri, 19 Apr 2013 09:28:51 -0000

On Mon, Apr 15, 2013 at 11:47:56AM +1000, Alexey Kardashevskiy wrote:
> The bswap functions use memcpy but the bswap.h header itself does not seem to
> include it in some configuration such as cross compiling for powerpc64
> on x86_64 machine.
> 
> The patch explicitly includes string.h.
> 
> v2:
> * #include statement moved to the right place
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/qemu/bswap.h |    1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

