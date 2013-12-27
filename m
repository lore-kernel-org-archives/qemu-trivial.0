Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfRL-0000uz-1W
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 16:59:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfRD-0000jg-08
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 16:59:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfR7-0001W4-2M
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 16:59:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfQs-0001Ts-IL; Fri, 27 Dec 2013 16:59:02 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 117074383C;
	Sat, 28 Dec 2013 01:58:54 +0400 (MSK)
Message-ID: <52BDF81C.3050205@msgid.tls.msk.ru>
Date: Sat, 28 Dec 2013 01:58:52 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>
References: <1388033619-6294-1-git-send-email-famz@redhat.com>
In-Reply-To: <1388033619-6294-1-git-send-email-famz@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.a@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] acpi unit-test: Remove temporary disk
 after test
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
X-List-Received-Date: Fri, 27 Dec 2013 21:59:29 -0000

26.12.2013 08:53, Fam Zheng write:
> ---
>  tests/acpi-test.c | 5 ++++-

Thanks, applied to the trivial-patches queue.

/mjt

