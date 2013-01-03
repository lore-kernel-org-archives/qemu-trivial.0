Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tqgo0-0000SO-5J
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2013 04:09:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TqgfA-0006PF-50
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 04:00:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tqgf8-0007En-Gm
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 04:00:32 -0500
Received: from mail-qc0-f177.google.com ([209.85.216.177]:58206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tqgf8-0007Ej-BJ
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 04:00:30 -0500
Received: by mail-qc0-f177.google.com with SMTP id u28so7760979qcs.22
	for <qemu-trivial@nongnu.org>; Thu, 03 Jan 2013 01:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=d2leuXcW4fjFPLXmqAESTE8yf6ybajs5KXf8Uq+IHv4=;
	b=bRM7XBuIFbFUb2gAp+zmJQtww9426PibH9On3wraE89zOFddApzwzxR2838eb8sJ3L
	snKbF1h0zQeikzwWt/Z0JC41SY2koNn1dyN4xWO8bvE0D+MsaXnxHLT6EDUA+D9tv4z/
	eqhcEK04KWNgRVg54g79lS2j+jBn1D30NgmOPrztxQfYGmLOaolBKr2mBGWQxDz4PUWp
	6To4nC8wyMiAem21IzU6YRwM0fV2I+32wGZcteAVUsLeTB8f5/Bln0p/dTIlG0GtNAxr
	6HAC7fufMqOques0+nkha4jGRl7r4A3uZTG619Yg/8KxdB13G7sfpYJRmEvq5BdeqolL
	W3cg==
X-Received: by 10.49.131.67 with SMTP id ok3mr31726708qeb.42.1357203629942;
	Thu, 03 Jan 2013 01:00:29 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id u18sm13268870qal.0.2013.01.03.01.00.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 01:00:28 -0800 (PST)
Date: Thu, 3 Jan 2013 10:00:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20130103090025.GB11586@stefanha-thinkpad.muc.redhat.com>
References: <20121220084133.GA22209@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20121220084133.GA22209@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.216.177
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Remove --sparc_cpu option from the
	configure list
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
X-List-Received-Date: Thu, 03 Jan 2013 09:09:38 -0000

On Thu, Dec 20, 2012 at 04:41:34PM +0800, 陳韋任 (Wei-Ren Chen) wrote:
>   commit 9b9c37c36439ee0452632253dac7a31897f27f70 always assume sparcv9,
> the others are no longer supported. Remove --sparc_cpu option from the
> configure list.
> 
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  configure |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

