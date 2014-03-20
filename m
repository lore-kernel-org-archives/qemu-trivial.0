Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQfG2-0002aW-JL
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 11:51:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQfFv-0002Jq-5L
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:51:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WQfFk-0002IH-Eg
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:51:42 -0400
Received: from mail-qc0-x230.google.com ([2607:f8b0:400d:c01::230]:41891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WQfFk-0002IC-Ao; Thu, 20 Mar 2014 11:51:32 -0400
Received: by mail-qc0-f176.google.com with SMTP id m20so1204261qcx.7
	for <multiple recipients>; Thu, 20 Mar 2014 08:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=O8n3MjnFO+IPgr84lwTXEvR76JRCyRkghQox8b//SFY=;
	b=sYS9dXHM9piU3vAaD8IVzUyhWYq4Ulod87NwMMXRMEEOjZShjsgU3eT1su3Cu7Iaa+
	QC3bnBiZHwqJP03sgyu0WkseuwQ2SmXmCuE7/KhccSkUUZmG6HYq9Fxo4z2BqitD2oUq
	fOHAJmYmcXzR7iOshyQEPB2zZzRunNA9aQy7Zh2SU7GJ/3DMpd5cS9viILINYlbhfoFG
	bsmRXtBoclUF5RvAtGcfh92/9Ytnm82/v7QjEPpJmAYrC1fZjbnCxU6sURyNjS3RHTT3
	WO+lFOKE9vCZxe/l+CLDRdHif+5IYTAvThKyx/3CBVPEGw0DXOvhC5uelOVsKL/jrAXo
	ntdg==
X-Received: by 10.140.91.228 with SMTP id z91mr48614325qgd.32.1395330691846;
	Thu, 20 Mar 2014 08:51:31 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id j91sm3306466qgj.19.2014.03.20.08.51.25
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Mar 2014 08:51:30 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <532B0E71.1000009@redhat.com>
Date: Thu, 20 Mar 2014 16:51:13 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20140227011300.8CD451983B@mono.eik.bme.hu>	<alpine.LMD.2.02.1403101939400.485@jedlik.phy.bme.hu>
	<532B0C5D.5060905@msgid.tls.msk.ru>
In-Reply-To: <532B0C5D.5060905@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::230
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] serial-pci: Set prog interface field of
 pci config to 16550 compatible
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
X-List-Received-Date: Thu, 20 Mar 2014 15:51:49 -0000

Il 20/03/2014 16:42, Michael Tokarev ha scritto:
> 10.03.2014 22:40, BALATON Zoltan wrote:
>> Ping!
>> http://patchwork.ozlabs.org/patch/324674/
>
> Thanks, applied to -trivial.

No, please don't; this needs to be done for new machine types only.

Paolo


