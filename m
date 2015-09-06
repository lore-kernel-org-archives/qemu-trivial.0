Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYb2u-0008M9-7j
	for mharc-qemu-trivial@gnu.org; Sun, 06 Sep 2015 10:35:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZYb2p-0008H0-VU
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 10:35:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZYb2p-0001dC-9r
	for qemu-trivial@nongnu.org; Sun, 06 Sep 2015 10:35:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZYb2k-0001bH-30; Sun, 06 Sep 2015 10:35:42 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 055C9A8A;
	Sun,  6 Sep 2015 14:35:41 +0000 (UTC)
Received: from [10.36.112.26] (ovpn-112-26.ams2.redhat.com [10.36.112.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t86EZW8k014595
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 6 Sep 2015 10:35:34 -0400
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1438609948-3744-1-git-send-email-lvivier@redhat.com>
	<1438676851-10684-1-git-send-email-lvivier@redhat.com>
	<55EC1590.4000102@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55EC4F3E.8070705@redhat.com>
Date: Sun, 6 Sep 2015 16:35:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55EC1590.4000102@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH][TRIVIAL] i6300esb: fix timer overflow
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
X-List-Received-Date: Sun, 06 Sep 2015 14:35:49 -0000



On 06/09/2015 12:29, Michael Tokarev wrote:
> 04.08.2015 11:27, Laurent Vivier wrote:
>> We use muldiv64() to compute the time to wait:
>>
>>     timeout = muldiv64(get_ticks_per_sec(), timeout, 33000000);
> ...
> 
> Applied to -trivial, thank you!

I think this was superseded by a later patch.

Paolo

