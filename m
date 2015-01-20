Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDdeo-0005BN-PP
	for mharc-qemu-trivial@gnu.org; Tue, 20 Jan 2015 13:36:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YDdem-0005AE-Mf
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 13:36:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YDdeh-0003kD-RH
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 13:36:04 -0500
Received: from mail-la0-f41.google.com ([209.85.215.41]:51795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YDdeh-0003jl-Jw
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 13:35:59 -0500
Received: by mail-la0-f41.google.com with SMTP id gm9so9919478lab.0
	for <qemu-trivial@nongnu.org>; Tue, 20 Jan 2015 10:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hyXz/u2Vffp/kw50K7qly38MQCWnWvcGFud49JnVzQo=;
	b=M48d6TcdTUmWQrFREwttpU+dj+Wx0U7e9S1O5tZt1A/sTTs7R6hpyBq7yvb0skJTwc
	4dICg/RhRvNQY+sRcy8GytgHdCj5jfDctmRd3SK9rxo2PSFjEiJdfR8jQwS0qO3/4+Zk
	0tyszy7COTCYHbSTNyYWyMCxoQWeymKzrWmiiA3j+KNXhKz36S9TlOuH2HjrVh9fSTZS
	s+dt6kYUcZGMrFqfRZMUD6NRD21pXBOMtKpjxj9lt2DMt/sg0LqPLof7XglnXe4Qy/Fg
	NhDr1FdPfz3OSzr5h1SXQrmP+XZ8SQIIscnclShcwGZrkHs2d/YtoOmbrYttWuOjraRx
	KkTw==
X-Gm-Message-State: ALoCoQmoykiE0RJ+RHCAXvVkKeUdZR1aLRFeUfy1lWd6Jr8sjQsG7+A//8KGD9e6lGaRlPCYJMMS
X-Received: by 10.112.151.4 with SMTP id um4mr40799010lbb.50.1421778958691;
	Tue, 20 Jan 2015 10:35:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Tue, 20 Jan 2015 10:35:38 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1501201811480.28301@eddie.linux-mips.org>
References: <1421747963-2860-1-git-send-email-armbru@redhat.com>
	<CAFEAcA9Gw-q+NDvb-Ysj-uB=QRdK_1GQJJZUQ2sOjpeBMnGDwg@mail.gmail.com>
	<87lhkxiqak.fsf@blackfin.pond.sub.org>
	<alpine.LFD.2.11.1501201811480.28301@eddie.linux-mips.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jan 2015 18:35:38 +0000
Message-ID: <CAFEAcA8kwLL0T-riyEO-AKyYeueCszMVB2eDR5DWuY=oKNE_cw@mail.gmail.com>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Leon Alrae <leon.alrae@imgtec.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
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
X-List-Received-Date: Tue, 20 Jan 2015 18:36:05 -0000

On 20 January 2015 at 18:16, Maciej W. Rozycki <macro@linux-mips.org> wrote:
> On Tue, 20 Jan 2015, Markus Armbruster wrote:
>
>> >> diff --git a/target-mips/translate.c b/target-mips/translate.c
>> >> index e9d86b2..8abc12b 100644
>> >> --- a/target-mips/translate.c
>> >> +++ b/target-mips/translate.c
>> >> @@ -18729,6 +18729,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
>> >>      case OPC_SWL:
>> >>      case OPC_SWR:
>> >>          check_insn_opc_removed(ctx, ISA_MIPS32R6);
>> >> +         /* fall through */
>> >
>> > Indent here seems to be out by one? The others look OK.
>>
>> Sorry about that.  Fix up on commit, or would you like a respin?
>
>  It looks to me like this whole file requires reindentation, perhaps a
> mechanical update like that would be better.  There are many lines with 9
> leading spaces (`wc -l' tells me 20), that I deliberately left as they are
> with my recent patches in this area so as not to obfuscate semantic
> changes.  There may be some more issues.

In this particular case, this part of the file is fine and the
problem is simply that this patch as it stands introduces a single
line (the one above) that's not indented correctly. The only fix
required is to delete one space in the line added by the patch
(thus avoiding introducing any new misindented lines).

In the general case, we tend to not do whole-file reindentation,
because it breaks 'git blame' and similar tools. It's not an
outright ban, though -- I guess it comes down to a maintainer
judgement call whether they think the benefit outweighs the cost
for a particular bit of code.

-- PMM

