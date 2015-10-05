Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk5BM-00015P-1Y
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 03:00:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZiyAF-0003HE-2N
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 01:18:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZiyAE-0006HY-4t
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 01:18:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZiyA9-0006EN-SS; Mon, 05 Oct 2015 01:18:13 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 39035157743;
	Mon,  5 Oct 2015 05:18:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-24.ams2.redhat.com
	[10.36.116.24])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t955IBrp003738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 5 Oct 2015 01:18:12 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ADE3F300253F; Mon,  5 Oct 2015 07:18:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
	<56100743.4010604@msgid.tls.msk.ru>
Date: Mon, 05 Oct 2015 07:18:10 +0200
In-Reply-To: <56100743.4010604@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Sat, 03 Oct 2015 19:50:11 +0300")
Message-ID: <87d1wtao6l.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Shraddha Barke <shraddha.6596@gmail.com>, kvm@vger.kernel.org,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/3] Target-microblaze:
	Remove unnecessary variable
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
X-List-Received-Date: Mon, 05 Oct 2015 05:18:20 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 25.09.2015 11:37, Shraddha Barke wrote:
>> Compress lines and remove the variable .
>
> Applied to -trivial, removing this piece of commit message:
>
> ---
>> Change made using Coccinelle script
>> 
>> @@
>> expression ret;
>> @@
>> - if (ret) return ret;
>> - return 0;
>> + return ret;
>> @@
>> local idexpression ret;
>> expression e;
>> @@
>> - ret = e;
>> - return ret;
>> + return e;
>> @@
>> type T; identifier i;
>> @@
>> - T i;
>> ... when != i
> ---

Why?  I like having the semantic patch in the commit message when
there's any chance we'll want do the same mechanical change again later.

You could save space and include it by reference, though: "Same
Coccinelle semantic patch as is commit 74c373e".

