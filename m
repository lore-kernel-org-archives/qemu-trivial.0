Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZbuSS-00064c-V9
	for mharc-qemu-trivial@gnu.org; Tue, 15 Sep 2015 13:55:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZbuSR-00062J-Af
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 13:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZbuSQ-0006Kg-Hq
	for qemu-trivial@nongnu.org; Tue, 15 Sep 2015 13:55:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZbuSK-0006IA-0x; Tue, 15 Sep 2015 13:55:48 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 99A7941A29;
	Tue, 15 Sep 2015 20:55:45 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 80266A67;
	Tue, 15 Sep 2015 20:55:45 +0300 (MSK)
Message-ID: <55F85BA1.9020902@msgid.tls.msk.ru>
Date: Tue, 15 Sep 2015 20:55:45 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1441621264-23812-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1441621264-23812-1-git-send-email-pbonzini@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] add macro file for coccinelle
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
X-List-Received-Date: Tue, 15 Sep 2015 17:55:56 -0000

07.09.2015 13:21, Paolo Bonzini wrote:
> Coccinelle chokes on some idioms from compiler.h and queue.h.
> Extract those in a macro file, to be used with "--macro-file
> scripts/cocci-macro-file.h".

Applied to -trivial, thank you!

/mjt

