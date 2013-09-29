Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQMlx-0006PV-FI
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 15:35:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQMlq-0006Es-Lt
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQMll-0008DQ-9g
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:35:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VQMlL-0007sI-0q; Sun, 29 Sep 2013 15:34:39 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E70324292C;
	Sun, 29 Sep 2013 23:34:27 +0400 (MSK)
Message-ID: <524880C3.6000801@msgid.tls.msk.ru>
Date: Sun, 29 Sep 2013 23:34:27 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: armbru@redhat.com
References: <1380008620-13796-1-git-send-email-armbru@redhat.com>
	<1380008620-13796-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1380008620-13796-2-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
	anthony@codemonkey.ws, lersek@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v3 1/2] tests: Fix schema parser test for
 in-tree build
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
X-List-Received-Date: Sun, 29 Sep 2013 19:35:16 -0000

24.09.2013 11:43, armbru@redhat.com wrote:
> From: Markus Armbruster <armbru@redhat.com>
>
> Commit 4f193e3 added the test, but screwed up in-tree builds
> (SRCDIR=.): the tests's output overwrites the expected output, and is
> thus compared to itself.

[]
>   .PHONY: $(patsubst %, check-%, $(check-qapi-schema-y))
>   $(patsubst %, check-%, $(check-qapi-schema-y)): check-%.json: $(SRC_PATH)/%.json
> -	$(call quiet-command, PYTHONPATH=$(SRC_PATH)/scripts $(PYTHON) $(SRC_PATH)/tests/qapi-schema/test-qapi.py <$^ >$*.out 2>$*.err; echo $$? >$*.exit, "  TEST  $*.out")
> -	@diff -q $(SRC_PATH)/$*.out $*.out
> -	@diff -q $(SRC_PATH)/$*.err $*.err
> -	@diff -q $(SRC_PATH)/$*.exit $*.exit
> +	$(call quiet-command, PYTHONPATH=$(SRC_PATH)/scripts $(PYTHON) $(SRC_PATH)/tests/qapi-schema/test-qapi.py <$^ >$*.test.out 2>$*.test.err; echo $$? >$*.test.exit, "  TEST  $*.out")
> +	@diff -q $(SRC_PATH)/$*.out $*.test.out
> +	@diff -q $(SRC_PATH)/$*.err $*.test.err
> +	@diff -q $(SRC_PATH)/$*.exit $*.test.exit

Hmm.  Maybe these new files should be cleaned up somehow by
`make clean' ?

Thanks,

/mjt

