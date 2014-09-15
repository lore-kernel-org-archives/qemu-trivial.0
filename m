Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTW5m-0001gF-Bj
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 09:13:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XTW5c-0001QY-2M
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XTW5T-0005Bw-0z
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:13:07 -0400
Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232]:61650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XTW58-0004yw-JF; Mon, 15 Sep 2014 09:12:38 -0400
Received: by mail-pd0-f178.google.com with SMTP id p10so6199033pdj.9
	for <multiple recipients>; Mon, 15 Sep 2014 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=tXS8SUHxdEgh8otD+0MNO9MRo1WVL5Ro9jbCVx3giMc=;
	b=YurR/UnV2ax3Qr2hLLAHnO71zw3hmkXegg0Co4hGNPh/6zE+d3GFqw/p2QL1DcIvUg
	8AQQCWoNbnyuz0XcRG8Cs4mBUTUPeTjgKinlZs8v9Mvwe48b/82+FlGFRmJkyRhgkwN3
	ULOv3nUdaXfBnyDBDR7Zde6+3OYeDm5ZrKfNmZo3vyuBmlVxlJQpbAY+1BuGBhjvU4MY
	Cmq26o7Hq7dKinhPPddFptxVQ+rD2XEqta7+H78zcpCBTeMJqvdUaSkcRmo9VTj2RQ/n
	hu98TYOZe4mhDeKU+afgCTFzZLLg6MzxPZRJxWWbi312/UvCz8F1e/mHtY5wjxJkBSPj
	RaZw==
X-Received: by 10.68.245.135 with SMTP id xo7mr4524023pbc.161.1410786756568;
	Mon, 15 Sep 2014 06:12:36 -0700 (PDT)
Received: from [192.168.2.114] ([124.127.118.42])
	by mx.google.com with ESMTPSA id
	fh10sm11396889pdb.71.2014.09.15.06.12.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Sep 2014 06:12:35 -0700 (PDT)
Message-ID: <5416E706.9030300@gmail.com>
Date: Mon, 15 Sep 2014 21:17:58 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, stefano.stabellini@eu.citrix.com
References: <5408780E.70607@gmail.com> <5416E31E.60104@msgid.tls.msk.ru>
In-Reply-To: <5416E31E.60104@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::232
Cc: qemu-trivial@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] xen-hvm.c: Always return -1 when
 failure occurs in xen_hvm_init()
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
X-List-Received-Date: Mon, 15 Sep 2014 13:13:17 -0000

On 9/15/14 21:01, Michael Tokarev wrote:
> Applied to -trivial, after fixing the commit message to be
> just a bit more english-like.  Thank you!
> 

OK, thank you for your work.

Next, I shall do something related microblaze under Qemu to let it run
for microblaze gcc/binutils test, hope I can find additonal patches for
it.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

