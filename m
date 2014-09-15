Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTW5x-0001ze-MH
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 09:13:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XTW5n-0001jO-GJ
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XTW5e-0005D7-Er
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:13:19 -0400
Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b]:53394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XTW5M-0005BW-7D; Mon, 15 Sep 2014 09:12:52 -0400
Received: by mail-pd0-f171.google.com with SMTP id p10so6247468pdj.30
	for <multiple recipients>; Mon, 15 Sep 2014 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=/X2NARHckDLBVzD2xPUjsYJUzsauJn8wwiXpjeA+xaI=;
	b=fVYy/4dFdBiaN/5V7arZ2Y902zP4Ek04v+8mRxs6yRfdLpri7sAZYMJZLWdRlPF/q/
	tng3+5Wvc/l0iPm5cx7650YhYQX8xM72052yfjzuu3H43p4/IHQsi+7L9ZS+HhoVVKIE
	4d4r19V7pfdIyslgT/IX499n4WE+K1UjpORzgIZADW4ba5gMphiLhtBmYgDFNFZ77Mpl
	mkQzIFSLFjeoc4cvF7j2xctYOmotK4ii+cS5b9NNT6L8M9/oszQnxvfp3EIswHikxIBK
	jo2ptlsD/Prb6kDODANstQMXQif7wIDmeRkm3wrM26LQ0XRzAxrSWptHA7FUG2ycH7Eu
	E8bg==
X-Received: by 10.68.171.33 with SMTP id ar1mr5093841pbc.148.1410786771130;
	Mon, 15 Sep 2014 06:12:51 -0700 (PDT)
Received: from [192.168.2.114] ([124.127.118.42])
	by mx.google.com with ESMTPSA id d3sm11480954pbu.18.2014.09.15.06.12.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Sep 2014 06:12:50 -0700 (PDT)
Message-ID: <5416E715.2040802@gmail.com>
Date: Mon, 15 Sep 2014 21:18:13 +0800
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
X-Received-From: 2607:f8b0:400e:c02::22b
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
X-List-Received-Date: Mon, 15 Sep 2014 13:13:29 -0000

On 9/15/14 21:01, Michael Tokarev wrote:
> Applied to -trivial, after fixing the commit message to be
> just a bit more english-like.  Thank you!
> 

OK, thank you for your work.

Next, I shall do something related microblaze under Qemu to let it run
for microblaze gcc/binutils test, hope I can find additional patches for
it.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

