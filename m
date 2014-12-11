Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz93X-0005TP-Mu
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 14:05:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Xz93P-0005Rb-Pe
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 14:05:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Xz93J-000086-FT
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 14:05:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Xz93J-00007a-4j; Thu, 11 Dec 2014 14:05:29 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBBJ5ORI009298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 11 Dec 2014 14:05:24 -0500
Received: from [10.36.112.22] (ovpn-112-22.ams2.redhat.com [10.36.112.22])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBBJ5JUi017099
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 11 Dec 2014 14:05:22 -0500
Message-ID: <5489EAEF.1010600@redhat.com>
Date: Thu, 11 Dec 2014 20:05:19 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1418203056-5365-1-git-send-email-pbonzini@redhat.com>
	<5489DA78.9030003@msgid.tls.msk.ru>
In-Reply-To: <5489DA78.9030003@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, zhang.zhanghailiang@huawei.com,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] vt82c686: avoid out-of-bounds read
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
X-List-Received-Date: Thu, 11 Dec 2014 19:05:42 -0000



On 11/12/2014 18:55, Michael Tokarev wrote:
>> > superio_ioport_readb can read the 256th element of the array.
> Is there a legitimate reason for it to access byte index 256?

The 256th element is byte index 255. :)

> What is the actual size of superio config memory, 256 or 257?

It's 256 and the array is sized conf[0xff].

> I don't know, but somehow it looks like it should be 256.

That's what the patch does. :)

Paolo

