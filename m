Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qlkd2-0002Co-KB
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2011 12:37:08 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1Qlkcz-0002CO-PI
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 12:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1Qlkcx-0005aL-Je
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 12:37:05 -0400
Received: from e6.ny.us.ibm.com ([32.97.182.146]:33864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1Qlkcx-0005Zk-B2; Tue, 26 Jul 2011 12:37:03 -0400
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by e6.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6QGCp5b002096;
	Tue, 26 Jul 2011 12:12:51 -0400
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com [9.17.195.245])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p6QGauPY137942; Tue, 26 Jul 2011 12:36:57 -0400
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id p6QGgKfd024815; Tue, 26 Jul 2011 10:42:21 -0600
Received: from [9.53.41.195] (illuin.austin.ibm.com [9.53.41.195] (may be
	forged))
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6QGgKDR024758; Tue, 26 Jul 2011 10:42:20 -0600
Message-ID: <4E2EED1E.6030402@linux.vnet.ibm.com>
Date: Tue, 26 Jul 2011 11:36:46 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <1311690830.7898.7.camel@d941e-10>
In-Reply-To: <1311690830.7898.7.camel@d941e-10>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.146
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Makefile: Fix parallel building after
 a	clean tree
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
X-List-Received-Date: Tue, 26 Jul 2011 16:37:06 -0000

On 07/26/2011 09:33 AM, Stefan Berger wrote:
> This patch fixes a compilation error when building qemu after 'make clean'
> by parallel building using 'make -j6' for example. A dependency seems to be missing.
>
>    GEN   qemu-options.def
>    GEN   trace.h
>    GEN   qapi-generated/qga-qapi-types.h
>    GEN   qapi-generated/qga-qapi-visit.h
>    GEN   qapi-generated/qga-qmp-marshal.c
>    CC    qga/guest-agent-command-state.o
>    CC    qga/guest-agent-commands.o
>    GEN   trace.c
>    GEN   qemu-img-cmds.h
> cc1: error: qapi-generated: No such file or directory [-Werror]
> cc1: all warnings being treated as errors
>
>
> Signed-off-by: Stefan Berger<stefanb@linux.vnet.ibm.com>
>
> ---
>   Makefile |    2 ++
>   1 file changed, 2 insertions(+)
>
> Index: qemu-git/Makefile
> ===================================================================
> --- qemu-git.orig/Makefile
> +++ qemu-git/Makefile
> @@ -192,6 +192,8 @@ test-qmp-commands.o: $(addprefix $(qapi-
>   test-qmp-commands: test-qmp-commands.o qfloat.o qint.o qdict.o qstring.o qlist.o qbool.o $(qapi-obj-y) error.o osdep.o qemu-malloc.o $(oslib-obj-y) qjson.o json-streamer.o json-lexer.o json-parser.o qerror.o qemu-error.o qemu-tool.o $(qapi-dir)/test-qapi-visit.o $(qapi-dir)/test-qapi-types.o $(qapi-dir)/test-qmp-marshal.o module.o
>
>   QGALIB=qga/guest-agent-command-state.o qga/guest-agent-commands.o
> +$(QGALIB): qemu-ga.o
> +
>
>   qemu-ga.o: $(addprefix $(qapi-dir)/, qga-qapi-types.c qga-qapi-types.h qga-qapi-visit.c qga-qmp-marshal.c) $(qapi-obj-y)
>   qemu-ga$(EXESUF): qemu-ga.o $(QGALIB) qemu-tool.o qemu-error.o error.o $(oslib-obj-y) $(trace-obj-y) $(block-obj-y) $(qobject-obj-y) $(version-obj-y) $(qapi-obj-y) qemu-timer-common.o qemu-sockets.o module.o qapi/qmp-dispatch.o qapi/qmp-registry.o $(qapi-dir)/qga-qapi-visit.o $(qapi-dir)/qga-qapi-types.o $(qapi-dir)/qga-qmp-marshal.o
>
>

Hi Stefan,

Thanks for catching this. It seems to do the trick for me up until make 
-j10, where a missing dependency on $(GENERATED_HEADERS) becomes an 
issue. I'll have a patch I'll send shortly.

