Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDoyx-0007Ai-Uw
	for mharc-qemu-trivial@gnu.org; Wed, 21 Jan 2015 01:41:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <macro@linux-mips.org>) id 1YDdLl-0007nc-UJ
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 13:16:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <macro@linux-mips.org>) id 1YDdLl-0004tm-3J
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 13:16:25 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:40907
	helo=cvs.linux-mips.org) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <macro@linux-mips.org>)
	id 1YDdLh-0004sl-4z; Tue, 20 Jan 2015 13:16:21 -0500
Received: from localhost.localdomain ([127.0.0.1]:49370 "EHLO
	localhost.localdomain" rhost-flags-OK-OK-OK-OK)
	by eddie.linux-mips.org with ESMTP id S27011260AbbATSQSx3fs7 (ORCPT
	<rfc822;qemu-devel@nongnu.org> + 1 other);
	Tue, 20 Jan 2015 19:16:18 +0100
Date: Tue, 20 Jan 2015 18:16:18 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Markus Armbruster <armbru@redhat.com>
In-Reply-To: <87lhkxiqak.fsf@blackfin.pond.sub.org>
Message-ID: <alpine.LFD.2.11.1501201811480.28301@eddie.linux-mips.org>
References: <1421747963-2860-1-git-send-email-armbru@redhat.com>
	<CAFEAcA9Gw-q+NDvb-Ysj-uB=QRdK_1GQJJZUQ2sOjpeBMnGDwg@mail.gmail.com>
	<87lhkxiqak.fsf@blackfin.pond.sub.org>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 148.251.95.138
X-Mailman-Approved-At: Wed, 21 Jan 2015 01:41:38 -0500
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leon Alrae <leon.alrae@imgtec.com>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Clean up
 switch fall through after commit fecd264
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
X-List-Received-Date: Tue, 20 Jan 2015 18:16:27 -0000

On Tue, 20 Jan 2015, Markus Armbruster wrote:

> >> diff --git a/target-mips/translate.c b/target-mips/translate.c
> >> index e9d86b2..8abc12b 100644
> >> --- a/target-mips/translate.c
> >> +++ b/target-mips/translate.c
> >> @@ -18729,6 +18729,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
> >>      case OPC_SWL:
> >>      case OPC_SWR:
> >>          check_insn_opc_removed(ctx, ISA_MIPS32R6);
> >> +         /* fall through */
> >
> > Indent here seems to be out by one? The others look OK.
> 
> Sorry about that.  Fix up on commit, or would you like a respin?

 It looks to me like this whole file requires reindentation, perhaps a 
mechanical update like that would be better.  There are many lines with 9 
leading spaces (`wc -l' tells me 20), that I deliberately left as they are 
with my recent patches in this area so as not to obfuscate semantic 
changes.  There may be some more issues.

  Maciej

