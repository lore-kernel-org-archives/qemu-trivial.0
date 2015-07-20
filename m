Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZHDsn-0005ZU-4X
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jul 2015 12:25:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZHDsk-0005X7-Gu
	for qemu-trivial@nongnu.org; Mon, 20 Jul 2015 12:25:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZHDsj-0001uQ-Hf
	for qemu-trivial@nongnu.org; Mon, 20 Jul 2015 12:25:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZHDsb-0001rp-5h; Mon, 20 Jul 2015 12:25:25 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id BE51AC6569;
	Mon, 20 Jul 2015 16:25:24 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-56-218.rdu2.redhat.com
	[10.10.56.218])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6KGPLVv020579; Mon, 20 Jul 2015 12:25:22 -0400
Message-ID: <55AD20F1.9070607@redhat.com>
Date: Mon, 20 Jul 2015 12:25:21 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1437231284-17455-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1437231284-17455-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.4] tests: Fix broken
	targets check-report-qtest-*
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
X-List-Received-Date: Mon, 20 Jul 2015 16:25:35 -0000



On 07/18/2015 10:54 AM, Stefan Weil wrote:
> They need QTEST_QEMU_IMG. Without it, the tests raise an assertion:
> 
> $ make -C bin check-report-qtest-i386.xml
> make: Entering directory 'bin'
> GTESTER check-report-qtest-i386.xml
> blkdebug: Suspended request 'A'
> blkdebug: Resuming request 'A'
> ahci-test: tests/libqos/libqos.c:162:
>  mkimg: Assertion `qemu_img_path' failed.
> main-loop: WARNING: I/O thread spun for 1000 iterations
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tests/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/Makefile b/tests/Makefile
> index 2c4b8dc..8d26736 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -478,6 +478,7 @@ $(patsubst %, check-%, $(check-unit-y)): check-%: %
>  
>  $(patsubst %, check-report-qtest-%.xml, $(QTEST_TARGETS)): check-report-qtest-%.xml: $(check-qtest-y)
>  	$(call quiet-command,QTEST_QEMU_BINARY=$*-softmmu/qemu-system-$* \
> +		QTEST_QEMU_IMG=qemu-img$(EXESUF) \
>  	  gtester -q $(GTESTER_OPTIONS) -o $@ -m=$(SPEED) $(check-qtest-$*-y),"GTESTER $@")
>  
>  check-report-unit.xml: $(check-unit-y)
> 

Tentatively:

Thanks, applied to my IDE tree:

https://github.com/jnsnow/qemu/commits/ide
https://github.com/jnsnow/qemu.git

--js

