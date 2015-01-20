Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDWcm-0003w7-IM
	for mharc-qemu-trivial@gnu.org; Tue, 20 Jan 2015 06:05:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YDWcj-0003v9-7N
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 06:05:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YDWcd-00049b-LF
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 06:05:28 -0500
Received: from mail-la0-f45.google.com ([209.85.215.45]:36795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YDWcd-00049P-F6
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 06:05:23 -0500
Received: by mail-la0-f45.google.com with SMTP id gd6so9870713lab.4
	for <qemu-trivial@nongnu.org>; Tue, 20 Jan 2015 03:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Dk53pNWvFz1J1GiZXXO0C33mf6TgZ3a1KB1dNYfNEsI=;
	b=FsK2smtkfLuhlvLvIkwbcvuM2ePGcqAYacmyvQHdPoPIOinADHjdXNlM29SzUEWnVb
	eE+n6ETCke2Ie7A9aqBFUF2up3znJaM2vZ7/pShy7dQHmkkoWKJ3r/yeBxL3cIc68JAP
	Cyk2MftyyaZw5+Mi93oVPcXTXajyQKgYoL8T1YUBjZ8AjdD1Zig2TXzdbSo1oV/3kf8G
	S1elRzDVIm28zAVpsnYB6UM4BqEKnqLaYkij3yn0s/5tM2Ca1lGi/cQSOCinryxWYV+G
	pGOfQfnSP0YYn2iBGfDWm0zv2w6/8VtUNVApVPiVERZKHGgaDbi9HvijY02f6LUHs1OH
	EtfQ==
X-Gm-Message-State: ALoCoQlsDGQwSmOV1ogekqRVD3ZWkSRndRqg6BjdljoGlmr20szcnNrj3qoJM81oGkJJsa8wHLiJ
X-Received: by 10.152.43.103 with SMTP id v7mr37461474lal.29.1421751921708;
	Tue, 20 Jan 2015 03:05:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Tue, 20 Jan 2015 03:05:01 -0800 (PST)
In-Reply-To: <1421747963-2860-1-git-send-email-armbru@redhat.com>
References: <1421747963-2860-1-git-send-email-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jan 2015 11:05:01 +0000
Message-ID: <CAFEAcA9Gw-q+NDvb-Ysj-uB=QRdK_1GQJJZUQ2sOjpeBMnGDwg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Leon Alrae <leon.alrae@imgtec.com>,
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
X-List-Received-Date: Tue, 20 Jan 2015 11:05:30 -0000

On 20 January 2015 at 09:59, Markus Armbruster <armbru@redhat.com> wrote:
> Commit fecd264 added a number of fall-throughs, but neglected to
> properly document them as intentional.  Commit d922445 cleaned that up
> for many, but not all cases.  Take care of the remaining ones.
>
> Spotted by Coverity.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  target-mips/translate.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target-mips/translate.c b/target-mips/translate.c
> index e9d86b2..8abc12b 100644
> --- a/target-mips/translate.c
> +++ b/target-mips/translate.c
> @@ -18729,6 +18729,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
>      case OPC_SWL:
>      case OPC_SWR:
>          check_insn_opc_removed(ctx, ISA_MIPS32R6);
> +         /* fall through */

Indent here seems to be out by one? The others look OK.

-- PMM

