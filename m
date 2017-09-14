Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsP1i-0004fk-SC
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 03:57:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsP1f-0004W1-T9
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsP1f-0006qk-6o
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:57:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dsP1a-0006mG-PF; Thu, 14 Sep 2017 03:57:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E291A412CF;
	Thu, 14 Sep 2017 10:57:25 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id BC5175B9;
	Thu, 14 Sep 2017 10:57:23 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1503916557-1292-1-git-send-email-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <f174639e-8d8a-23eb-af4b-6ba4d20d3d88@msgid.tls.msk.ru>
Date: Thu, 14 Sep 2017 10:57:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503916557-1292-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] tests/libqtest: Use a proper error
 message if QTEST_QEMU_BINARY is missing
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2017 07:57:33 -0000

28.08.2017 13:35, Thomas Huth weote:
> The user can currently still cause an abort() if running certain tests
> (like the prom-env-test) without setting the QTEST_QEMU_BINARY first.
> A similar problem has been fixed with commit 7c933ad61b8f3f51337
> already, but forgot to also take care of the qtest_get_arch() function,
> so let's introduce a proper wrapper around getenv("QTEST_QEMU_BINARY")
> that can be used in both locations now.

Applied to -trivial, thanks!

/mjt

