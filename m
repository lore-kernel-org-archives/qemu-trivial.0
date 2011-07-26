Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlmSz-0003KY-LP
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2011 14:34:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1QlmSv-00036T-Ui
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 14:34:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1QlmSu-0004Pi-OK
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 14:34:49 -0400
Received: from e3.ny.us.ibm.com ([32.97.182.143]:41532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1QlmSs-0004P5-JA; Tue, 26 Jul 2011 14:34:46 -0400
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by e3.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6QIB5dN003833;
	Tue, 26 Jul 2011 14:11:05 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p6QIYjjL133782; Tue, 26 Jul 2011 14:34:45 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p6QIYipM006125; Tue, 26 Jul 2011 15:34:45 -0300
Received: from [9.59.241.154] (d941e-10.watson.ibm.com [9.59.241.154])
	by d01av02.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6QIYgmJ005958; Tue, 26 Jul 2011 15:34:43 -0300
Message-ID: <4E2F08C2.4020601@linux.vnet.ibm.com>
Date: Tue, 26 Jul 2011 14:34:42 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110621 Fedora/3.1.11-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.11
MIME-Version: 1.0
To: Michael Roth <mdroth@linux.vnet.ibm.com>
References: <4E2EED1E.6030402@linux.vnet.ibm.com>
	<1311698364-32395-1-git-send-email-mdroth@linux.vnet.ibm.com>
In-Reply-To: <1311698364-32395-1-git-send-email-mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.143
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: add missing deps
	on $(GENERATED_HEADERS)
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
X-List-Received-Date: Tue, 26 Jul 2011 18:34:51 -0000

On 07/26/2011 12:39 PM, Michael Roth wrote:
> This fixes a build issue with make -j6+ due to qapi-generated files
> being built before $(GENERATED_HEADERS) have been created.
>
> Signed-off-by: Michael Roth<mdroth@linux.vnet.ibm.com>
Tested-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

> ---
>   Makefile |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index daa3aa0..0a31633 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -192,8 +192,10 @@ test-qmp-commands.o: $(addprefix $(qapi-dir)/, test-qapi-types.c test-qapi-types
>   test-qmp-commands: test-qmp-commands.o qfloat.o qint.o qdict.o qstring.o qlist.o qbool.o $(qapi-obj-y) error.o osdep.o qemu-malloc.o $(oslib-obj-y) qjson.o json-streamer.o json-lexer.o json-parser.o qerror.o qemu-error.o qemu-tool.o $(qapi-dir)/test-qapi-visit.o $(qapi-dir)/test-qapi-types.o $(qapi-dir)/test-qmp-marshal.o module.o
>
>   QGALIB=qga/guest-agent-command-state.o qga/guest-agent-commands.o
> +QGALIB_GEN=$(addprefix $(qapi-dir)/, qga-qapi-types.c qga-qapi-types.h qga-qapi-visit.c qga-qmp-marshal.c)
>
> -qemu-ga.o: $(addprefix $(qapi-dir)/, qga-qapi-types.c qga-qapi-types.h qga-qapi-visit.c qga-qmp-marshal.c) $(qapi-obj-y)
> +$(QGALIB_GEN): $(GENERATED_HEADERS)
> +$(QGALIB) qemu-ga.o: $(QGALIB_GEN) $(qapi-obj-y)
>   qemu-ga$(EXESUF): qemu-ga.o $(QGALIB) qemu-tool.o qemu-error.o error.o $(oslib-obj-y) $(trace-obj-y) $(block-obj-y) $(qobject-obj-y) $(version-obj-y) $(qapi-obj-y) qemu-timer-common.o qemu-sockets.o module.o qapi/qmp-dispatch.o qapi/qmp-registry.o $(qapi-dir)/qga-qapi-visit.o $(qapi-dir)/qga-qapi-types.o $(qapi-dir)/qga-qmp-marshal.o
>
>   QEMULIBS=libhw32 libhw64 libuser libdis libdis-user


